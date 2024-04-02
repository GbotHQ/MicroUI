import std/[strutils, algorithm, enumerate, typetraits]

template push(stk: typed, item: typed) =
  assert stk.idx < stk.items.len
  stk.items[stk.idx] = item
  inc stk.idx

template pop(stk: typed) =
  assert stk.idx > 0
  dec stk.idx

const
  CommandListSize* = 256 * 1024
  RootListSize* = 32
  ContainerStackSize* = 32
  ClipStackSize* = 32
  IdStackSize* = 32
  LayoutStackSize* = 16
  ContainerPoolSize* = 48
  TreeNodePoolSize* = 48
  MaxWidths* = 16
  MaxFmt* = 127

type
  Clip* {.pure, size: sizeof(int32).} = enum
    None
    Part
    All

  Commands* {.pure, size: sizeof(int32).} = enum
    None
    Jump
    Clip
    Rect
    Text
    Icon
  
  Colors* {.pure, size: sizeof(int32).} = enum
    Text
    Border
    WindowBg
    TitleBg
    TitleText
    PanelBg
    Button
    ButtonHover
    ButtonFocus
    Base
    BaseHover
    BaseFocus
    ScrollBase
    ScrollThumb
  
  Icon* {.pure, size: sizeof(int32).} = enum
    None
    Close
    Check
    Collapsed
    Expanded

  Result* {.pure, size: sizeof(int32).} = enum
    Active
    Submit
    Change

  Option* {.pure, size: sizeof(int32).} = enum
    AlignCenter
    AlignRight
    NoInteract
    NoFrame
    NoResize
    NoScroll
    NoClose
    NoTitle
    HoldFocus
    AutoSize
    Popup
    Closed
    Expanded
  
  OptionSet = set[Option]

  Mouse* {.pure, size: sizeof(int32).} = enum
    Left
    Right
    Middle
  
  MouseSet = set[Mouse]

  Key* {.pure, size: sizeof(int32).} = enum
    Shift
    Ctrl
    Alt
    Backspace
    Return
  
  KeySet = set[Key]

  Id* = uint32
  Font* = pointer

  Vec2* = object
    x*, y*: int32
  Rect* = object
    x*, y*, w*, h*: int32
  Color* = object
    r*, g*, b*, a*: uint8
  PoolItem* = object
    id*: Id
    lastUpdate*: int32

  Layout = object
    body: Rect
    next: Rect
    position: Vec2
    size: Vec2
    max: Vec2
    widths: array[MaxWidths, int32]
    items: int32
    itemIndex: int32
    nextRow: int32
    nextType: int32
    indent: int32
  
  BaseCommand = object
    typefield*: int32
    size*: int32
  
  JumpCommand = object
    base*: BaseCommand
    dst*: pointer
  
  ClipCommand = object
    base*: BaseCommand
    rect*: Rect
  
  RectCommand = object
    base*: BaseCommand
    rect*: Rect
    color*: Color
  
  TextCommand = object
    base*: BaseCommand
    font*: Font
    pos*: Vec2
    color*: Color
    str*: array[1, cschar]
  
  IconCommand = object
    base*: BaseCommand
    rect*: Rect
    id*: int32
    color*: Color

  CommandBase {.union.} = object
    typefield*: int32
    base*: BaseCommand
    jump*: JumpCommand
    clip*: ClipCommand
    rect*: RectCommand
    text*: TextCommand
    icon*: IconCommand
  
  Command* = ptr CommandBase
  
  ContainerBase* = object
    head*, tail*: Command
    rect*, body*: Rect
    contentSize*, scroll*: Vec2
    zindex*: int32
    open*: bool
  
  Container* = ptr ContainerBase
  
  Style = object
    font*: Font
    size*: Vec2
    padding*: int32
    spacing*: int32
    indent*: int32
    titleHeight*: int32
    scrollbarSize*: int32
    thumbSize*: int32
    colors*: array[Colors.enumLen, Color]

  CommandListStack = object
    idx: int32
    items: array[CommandListSize, cschar]
  
  RootListStack = object
    idx: int32
    items: array[RootListSize, Container]
  
  ContainerStack = object
    idx: int32
    items: array[ContainerStackSize, Container]

  ClipStack = object
    idx: int32
    items: array[ClipStackSize, Rect]

  IdStack = object
    idx: int32
    items: array[IdStackSize, Id]

  LayoutStack = object
    idx: int32
    items: array[LayoutStackSize, Layout]

  CtxBase* = object
    # callbacks:
    textWidth*: proc(font: Font, str: cstring, len: int32): int32
    textHeight*: proc(font: Font): int32
    drawFrame*: proc(ctx: Ctx, rect: Rect, colorId: int32)
    # coreState:
    internalStyle: Style
    style*: ptr Style
    hover*: Id
    focus*: Id
    lastId*: Id
    lastRect*: Rect
    lastZIndex*: int32
    updatedFocus*: bool
    frame*: int32
    hoverRoot*: Container
    nextHoverRoot*: Container
    scrollTarget*: Container
    numberEditBuf*: array[MaxFmt, cschar]
    numberEdit*: Id
    # stacks:
    commandList*: CommandListStack
    rootList*: RootListStack
    containerStack*: ContainerStack
    clipStack*: ClipStack
    idStack*: IdStack
    layoutStack*: LayoutStack
    # retainedStatePools:
    containerPool*: array[ContainerPoolSize, PoolItem]
    containers*: array[ContainerPoolSize, ContainerBase]
    treeNodePool*: array[TreeNodePoolSize, PoolItem]
    # inputState:
    mousePos*: Vec2
    lastMousePos*: Vec2
    mouseDelta*: Vec2
    scrollDelta*: Vec2
    mouseDown*: MouseSet
    mousePressed*: MouseSet
    keyDown*: KeySet
    keyPressed*: KeySet
    inputText*: array[32, cschar]
  
  Ctx* = ref CtxBase

template defineSetConverters(T: typedesc) =
  converter toSet*(opt: T): set[T] =
    {opt}

defineSetConverters Option
defineSetConverters Mouse
defineSetConverters Key

proc vec2*(x, y: int): Vec2 =
  result.x = int32 x
  result.y = int32 y

proc rect*(x, y, w, h: int): Rect =
  result.x = int32 x
  result.y = int32 y
  result.w = int32 w
  result.h = int32 h

proc color*(r, g, b, a: uint8): Color =
  result.r = uint8 r
  result.g = uint8 g
  result.b = uint8 b
  result.a = uint8 a

proc expandRect(rect: Rect, n: int32): Rect =
  rect(rect.x - n, rect.y - n, rect.w + 2 * n, rect.h + 2 * n)

proc intersectRects(r1: Rect, r2: Rect): Rect =
  var x1 = max(r1.x, r2.x)
  var y1 = max(r1.y, r2.y)
  var x2 = min(r1.x + r1.w, r2.x + r2.w)
  var y2 = min(r1.y + r1.h, r2.y + r2.h)
  
  x2 = max(x2, x1)
  y2 = max(y2, y1)
  
  rect(x1, y1, x2 - x1, y2 - y1)

proc rectOverlapsVec2(r: Rect, p: Vec2): bool =
  (p.x >= r.x) and
  (p.x < r.x + r.w) and
  (p.y >= r.y) and
  (p.y < r.y + r.h)

# pool
proc getPool*(ctx: Ctx, items: openArray[PoolItem], id: Id): int32 =
  for i in 0..<items.len.int32:
    if items[i].id == id:
      return i
  -1

proc updatePool*(ctx: Ctx, items: var openArray[PoolItem], idx: int32) =
  items[idx].lastUpdate = ctx.frame

proc initPool*(ctx: Ctx, items: var openArray[PoolItem], id: Id): int32 =
  result = -1
  var f = ctx.frame
  for i in 0..<items.len.int32:
    if items[i].lastUpdate < f:
      f = items[i].lastUpdate
      result = i
  assert result > -1
  items[result.int].id = id
  ctx.updatePool(items, result)

# clip
proc getClipRect*(ctx: Ctx): Rect =
  assert ctx.clipStack.idx > 0
  ctx.clipStack.items[ctx.clipStack.idx - 1]

proc pushClipRect*(ctx: Ctx, rect: Rect) =
  let lastRect = ctx.getClipRect
  ctx.clipStack.push intersectRects(rect, lastRect)

proc popClipRect*(ctx: Ctx) =
  ctx.clipStack.pop

proc checkClip*(ctx: Ctx, r: Rect): Clip =
  let cr = ctx.getClipRect
  if r.x > cr.x + cr.w or r.x + r.w < cr.x or
     r.y > cr.y + cr.h or r.y + r.h < cr.y:
    All
  elif r.x >= cr.x and r.x + r.w <= cr.x + cr.w and
     r.y >= cr.y and r.y + r.h <= cr.y + cr.h:
    None
  else:
    Part

# input
proc inputMouseMove*(ctx: Ctx, x, y: int32) =
  ctx.mousePos = vec2(x, y)

proc inputMouseDown*(ctx: Ctx, x, y: int32, btn: Mouse) =
  ctx.inputMouseMove(x, y)
  ctx.mouseDown = ctx.mouseDown + btn
  ctx.mousePressed = ctx.mousePressed + btn

proc inputMouseUp*(ctx: Ctx, x, y: int32, btn: Mouse) =
  ctx.inputMouseMove(x, y)
  ctx.mouseDown = ctx.mouseDown - btn

proc inputScroll*(ctx: Ctx, x, y: int32) =
  ctx.scrollDelta.x += x
  ctx.scrollDelta.y += y

proc inputKeyDown*(ctx: Ctx, key: KeySet) =
  ctx.keyPressed = ctx.keyPressed + key
  ctx.keyDown = ctx.keyDown + key

proc inputKeyUp*(ctx: Ctx, key: KeySet) =
  ctx.keyDown = ctx.keyDown - key

proc inputText*(ctx: Ctx, text: cstring) =
  let inputTextLen = cast[cstring](addr ctx.inputText[0]).len
  let size = text.len + 1
  assert inputTextLen + size <= sizeof(ctx.inputText)
  copyMem(addr ctx.inputText[inputTextLen], addr text[0], size)

# drawing
proc pushCommand*(ctx: Ctx, typ: Commands, size: int32): Command =
  let cmd = cast[Command](addr ctx.commandList.items[ctx.commandList.idx])
  assert ctx.commandList.idx + size < CommandListSize
  cmd.base.typefield = int32 typ
  cmd.base.size = size
  ctx.commandList.idx += size
  cmd

proc nextCommand*(ctx: Ctx, cmd: ptr Command): bool =
  cmd[] =
    if not cmd[].isNil:
      cast[Command]((cast[int](cast[ptr cschar](cmd[])) + cmd.base.size))
    else:
      cast[Command](addr ctx.commandList.items[0])
  while cmd[] != addr ctx.commandList.items[ctx.commandList.idx]:
    if cmd.typefield != Commands.Jump.int32:
      return true
    cmd[] = cast[Command](cmd.jump.dst)

proc setClip*(ctx: Ctx, rect: Rect) =
  let cmd = ctx.pushCommand(Commands.Clip, ClipCommand.sizeof.int32)
  cmd.clip.rect = rect

proc drawRect*(ctx: Ctx, rect: Rect, color: Color) =
  let r = intersectRects(rect, ctx.getClipRect)
  if r.w > 0 and r.h > 0:
    let cmd = ctx.pushCommand(Commands.Rect, RectCommand.sizeof.int32)
    cmd.rect.rect = r
    cmd.rect.color = color

proc drawBox*(ctx: Ctx, rect: Rect, color: Color) =
  ctx.drawRect(rect(rect.x + 1, rect.y, rect.w - 2, 1), color)
  ctx.drawRect(rect(rect.x + 1, rect.y + rect.h - 1, rect.w - 2, 1), color)
  ctx.drawRect(rect(rect.x, rect.y, 1, rect.h), color)
  ctx.drawRect(rect(rect.x + rect.w - 1, rect.y, 1, rect.h), color)

const unclippedRect = rect(0, 0, int32.high, int32.high)

proc drawText*(ctx: Ctx, font: Font, str: cstring, len: int32, pos: Vec2, color: Color) =
  let rect = rect(pos.x, pos.y, ctx.textWidth(font, str, len), ctx.textHeight(font))
  let clipped = ctx.checkClip(rect)
  case clipped
  of Clip.All:
    return
  of Clip.Part:
    ctx.setClip(ctx.getClipRect)
  else: discard
  # add command
  var length =
    if len < 0:
      int32 str.len
    else:
      len
  let cmd = ctx.pushCommand(Commands.Text, TextCommand.sizeof.int32 + length)
  copyMem(addr cmd.text.str[0], addr str[0], length)
  let nullTer = cstring "\0"
  copyMem(cast[ptr cschar](cast[int](addr cmd.text.str) + length), addr nullTer[0], 1)
  cmd.text.pos = pos
  cmd.text.color = color
  cmd.text.font = font
  # reset clipping if it was set
  if clipped != Clip.None:
    ctx.setClip(unclippedRect)

proc drawIcon*(ctx: Ctx, id: int32, rect: Rect, color: Color) =
  # do clip command if the rect isn't fully contained within the cliprect
  let clipped = ctx.checkClip(rect)
  case clipped
  of Clip.All:
    return
  of Clip.Part:
    ctx.setClip(ctx.getClipRect)
  else: discard
  # do icon command
  let cmd = ctx.pushCommand(Commands.Icon, IconCommand.sizeof.int32)
  cmd.icon.id = id
  cmd.icon.rect = rect
  cmd.icon.color = color
  # reset clipping if it was set
  if clipped != Clip.None:
    ctx.setClip(unclippedRect)

proc drawFrame(ctx: Ctx, rect: Rect, colorId: int32) = 
  ctx.drawRect(rect, ctx.style.colors[colorId])
  case colorId:
  of Colors.ScrollBase.int32, Colors.ScrollThumb.int32, Colors.TitleBg.int32:
    return
  else: discard
  if ctx.style.colors[Colors.Border.int].a != 0:
    ctx.drawBox(expandRect(rect, 1), ctx.style.colors[Colors.Border.int])

# context managment
const defaultStyle =
  Style(
    font: nil,
    size: vec2(68, 10),
    padding: 5,
    spacing: 4,
    indent: 24,
    titleHeight: 24,
    scrollbarSize: 12,
    thumbSize: 8,
    colors: [
      color(230, 230, 230, 255), # Colors.Text
      color(25,  25,  25,  255), # Colors.Border
      color(50,  50,  50,  255), # Colors.WindowBg
      color(25,  25,  25,  255), # Colors.TitleBg
      color(240, 240, 240, 255), # Colors.TitleText
      color(0,   0,   0,   0  ), # Colors.PanelBg
      color(75,  75,  75,  255), # Colors.Button
      color(95,  95,  95,  255), # Colors.ButtonHover
      color(115, 115, 115, 255), # Colors.ButtonFocus
      color(30,  30,  30,  255), # Colors.Base
      color(35,  35,  35,  255), # Colors.BaseHover
      color(40,  40,  40,  255), # Colors.BaseFocus
      color(43,  43,  43,  255), # Colors.ScrollBase
      color(30,  30,  30,  255)  # Colors.ScrollThumb
    ]
  )

proc init*(ctx: Ctx) =
  ctx.drawFrame = drawFrame
  ctx.internalStyle = defaultStyle
  ctx.style = addr ctx.internalStyle

proc begin*(ctx: Ctx) =
  assert not (ctx.textWidth.isNil or ctx.textHeight.isNil)
  ctx.commandList.idx = 0
  ctx.rootList.idx = 0
  ctx.scrollTarget = nil
  ctx.hoverRoot = ctx.nextHoverRoot
  ctx.nextHoverRoot = nil
  ctx.mouseDelta.x = ctx.mousePos.x - ctx.lastMousePos.x
  ctx.mouseDelta.y = ctx.mousePos.y - ctx.lastMousePos.y
  inc ctx.frame

proc bringToFront*(ctx: Ctx, cnt: Container) =
  inc ctx.lastZindex
  cnt.zIndex = ctx.lastZindex

proc finish*(ctx: Ctx) =
  # check stacks
  assert ctx.containerStack.idx == 0
  assert ctx.clipStack.idx == 0
  assert ctx.idStack.idx == 0
  assert ctx.layoutStack.idx == 0

  # handle scroll input
  if not isNil ctx.scrollTarget:
    ctx.scrollTarget.scroll.x += ctx.scrollDelta.x
    ctx.scrollTarget.scroll.y += ctx.scrollDelta.y

  # unset focus if focus id was not touched this frame
  if not ctx.updatedFocus:
    ctx.focus = 0
  ctx.updatedFocus = false

  # bring hover root to front if mouse was pressed
  if ctx.mousePressed.len > 0 and (not isNil ctx.nextHoverRoot) and
      ctx.nextHoverRoot.zindex < ctx.lastZindex and
      ctx.nextHoverRoot.zindex >= 0:
    ctx.bringToFront(ctx.nextHoverRoot)
  
  # reset input state
  ctx.keyPressed = {}
  ctx.inputText[0] = cschar '\0'
  ctx.mousePressed = {}
  ctx.scrollDelta = vec2(0, 0)
  ctx.lastMousePos = ctx.mousePos

  # sort root containers by zindex
  let n = ctx.rootList.idx

  proc cmpZindex(a, b: Container): int =
    if a.isNil:
      return -1
    elif b.isNil:
      return 1
    cmp(a.zindex, b.zindex)
  
  var subarrayToSort = ctx.rootList.items[0..<n]
  subarrayToSort.sort(cmpZindex)
  ctx.rootList.items[0..<n] = subarrayToSort

  # set root container jump commands
  for i, cnt in enumerate(ctx.rootList.items[0..<n]):
    # if this is the first container then make the first command jump to it.
    # otherwise set the previous container's tail to jump to this one
    let jmpCommand = cast[ptr cschar](cast[int](cnt.head) + sizeof(JumpCommand))
    if i == 0:
      cast[Command](addr ctx.commandList.items[0]).jump.dst = jmpCommand
    else:
      ctx.rootList.items[i - 1].tail.jump.dst = jmpCommand
    # make the last container's tail jump to the end of command list
    if i == n - 1:
      cnt.tail.jump.dst = addr ctx.commandList.items[ctx.commandList.idx]

proc setFocus*(ctx: Ctx, id: Id) =
  ctx.focus = id
  ctx.updatedFocus = true

# 32-bit FNV-1a hash
const HashInitial = uint32 2166136261

proc hash(id: var Id, data: ptr, size: int) =
  let dataArr = cast[ptr UncheckedArray[byte]](data)
  for i in 0..<size:
    id = (id xor dataArr[i]) * 16777619

proc getId*(ctx: Ctx, data: ptr, size: int32): Id =
  let idx = ctx.idStack.idx
  var res: Id = if idx > 0: ctx.idStack.items[idx - 1] else: HashInitial
  hash(res, data, size)
  ctx.lastId = res
  res

proc getId*(ctx: Ctx, data: ptr): Id =
  ctx.getId(data, data[].sizeof.int32)

proc getId*(ctx: Ctx, data: cstring): Id =
  ctx.getId(addr data[0], data.len.int32)

proc pushId*(ctx: Ctx, data: ptr, size: int32) =
  ctx.idStack.push ctx.getId(data, size)

proc popId*(ctx: Ctx) =
  ctx.idStack.pop

proc getCurrentContainer*(ctx: Ctx): Container =
  assert ctx.containerStack.idx > 0
  ctx.containerStack.items[ctx.containerStack.idx - 1]

proc getContainerBase(ctx: Ctx, id: Id, opt: OptionSet): Container = 
  var cnt: Container
  # try to get existing container from pool
  var idx = ctx.getPool(ctx.containerPool, id)
  if idx >= 0:
    if ctx.containers[idx].open or (Option.Closed in opt).not:
      ctx.updatePool(ctx.containerPool, idx)
    return addr ctx.containers[idx]
  if (Option.Closed in opt): return nil
  # container not found in pool: init new container
  idx = ctx.initPool(ctx.containerPool, id)
  cnt = addr ctx.containers[idx]
  zeroMem(cnt, sizeof(ContainerBase))
  cnt.open = true
  ctx.bringToFront(cnt)
  return cnt

proc getContainer*(ctx: Ctx, name: cstring): Container =
  ctx.getContainerBase(
    ctx.getId(name), {}
  )

# layout
proc getLayout*(ctx: Ctx): ptr Layout =
  addr ctx.layoutStack.items[ctx.layoutStack.idx - 1]

proc popContainer*(ctx: Ctx) =
  let cnt = ctx.getCurrentContainer
  let layout = ctx.getLayout
  cnt.contentSize.x = layout.max.x - layout.body.x
  cnt.contentSize.y = layout.max.y - layout.body.y
  ctx.containerStack.pop
  ctx.layoutStack.pop
  ctx.popId

proc layoutRow*(ctx: Ctx, items: int32, widths: openArray[int32], height: int32) =
  let layout = ctx.getLayout
  if widths.len > 0:
    assert items <= MaxWidths
    layout.widths[0..<items] = widths[0..<items]
  layout.items = items
  layout.position = vec2(layout.indent, layout.nextRow)
  layout.size.y = height
  layout.itemIndex = 0

proc layoutWidth*(ctx: Ctx, width: int32) =
  ctx.getLayout.size.x = width

proc layoutHeight*(ctx: Ctx, height: int32) =
  ctx.getLayout.size.y = height

proc pushLayout(ctx: Ctx, body: Rect, scroll: Vec2) =
  var layout: Layout
  layout.body = rect(body.x - scroll.x, body.y - scroll.y, body.w, body.h)
  layout.max = vec2(int32.low, int32.low)
  ctx.layoutStack.push layout
  ctx.layoutRow(1, [int32 0, -1], 0)

type
  LayoutType {.pure, size: sizeof(int32).} = enum
    None
    Absolute
    Relative

proc layoutSetNext*(ctx: Ctx, rect: Rect, relative: bool) =
  var layout = ctx.getLayout
  layout.next = rect
  layout.nextType = int32 (if relative: LayoutType.Relative else: LayoutType.Absolute)

proc layoutNext*(ctx: Ctx): Rect =
  let layout = ctx.getLayout
  let style = addr ctx.style
  var res: Rect

  if layout.nextType != LayoutType.None.int32:
    # handle rect set by `layoutSetNext`
    let typ = layout.nextType
    layout.nextType = LayoutType.None.int32
    res = layout.next
    if typ == LayoutType.Absolute.int32:
      ctx.lastRect = res
      return res
  else:
    # handle next row
    if layout.itemIndex == layout.items:
      ctx.layoutRow(layout.items, [], layout.size.y)

    # position
    res.x = layout.position.x
    res.y = layout.position.y

    # size
    res.w = 
      if layout.items > 0: layout.widths[layout.itemIndex] 
      else: layout.size.x
    res.h = layout.size.y
    if res.w == 0: res.w = style.size.x + style.padding * 2
    if res.h == 0: res.h = style.size.y + style.padding * 2
    if res.w <  0: res.w += layout.body.w - res.x + 1
    if res.h <  0: res.h += layout.body.h - res.y + 1

    inc layout.itemIndex

  # update position
  layout.position.x += res.w + style.spacing
  layout.nextRow = max(layout.nextRow, res.y + res.h + style.spacing)

  # apply body offset
  res.x += layout.body.x
  res.y += layout.body.y

  # update max position
  layout.max.x = max(layout.max.x, res.x + res.w)
  layout.max.y = max(layout.max.y, res.y + res.h)

  ctx.lastRect = res
  res

proc layoutBeginColumn*(ctx: Ctx) =
  ctx.pushLayout(ctx.layoutNext, vec2(0, 0))

proc layoutEndColumn*(ctx: Ctx) =
  let b = ctx.getLayout
  ctx.layoutStack.pop
  # inherit position/nextRow/max from child layout if they are greater
  let a = ctx.getLayout
  a.position.x = max(a.position.x, b.position.x + b.body.x - a.body.x)
  a.nextRow = max(a.nextRow, b.nextRow + b.body.y - a.body.y)
  a.max.x = max(a.max.x, b.max.x)
  a.max.y = max(a.max.y, b.max.y)

# misc
proc drawControlFrame*(ctx: Ctx, id: Id, rect: Rect, colorId: Colors, opt: OptionSet = {}) =
  if Option.NoFrame in opt:
    return
  var colorId = colorId.int32
  if ctx.focus == id:
    colorId += 2
  elif ctx.hover == id:
    colorId += 1
  ctx.drawFrame(ctx, rect, colorId)

proc drawControlText*(ctx: Ctx, str: cstring, rect: Rect, colorId: Colors, opt: OptionSet = {}) =
  var font = ctx.style.font
  let tw = ctx.textWidth(font, str, -1)
  ctx.pushClipRect rect
  var pos = vec2(0, 0)
  pos.y = int32 rect.y.cfloat + (rect.h - ctx.textHeight(font)).cfloat / 2
  if Option.AlignCenter in opt:
    pos.x = int32 rect.x.cfloat + (rect.w - tw) / 2
  elif Option.AlignRight in opt:
    pos.x = rect.x + rect.w - tw - ctx.style.padding
  else:
    pos.x = rect.x + ctx.style.padding
  ctx.drawText(font, str, -1, pos, ctx.style.colors[colorId.int])
  ctx.popClipRect

proc inHoverRoot(ctx: Ctx): bool =
  var i = ctx.containerStack.idx
  while i > 0:
    dec i
    if ctx.containerStack.items[i] == ctx.hoverRoot:
      return true
    # only root containers have their `head` field set; stop searching if we've
    # reached the current root container
    if not isNil ctx.containerStack.items[i].head:
      break

proc mouseOver*(ctx: Ctx, rect: Rect): bool =
  rectOverlapsVec2(rect, ctx.mousePos) and
    rectOverlapsVec2(ctx.getClipRect, ctx.mousePos) and
    ctx.inHoverRoot

proc updateControl*(ctx: Ctx, id: Id, rect: Rect, opt: OptionSet = {}) =  
  if ctx.focus == id:
    ctx.updatedFocus = true
  if Option.NoInteract in opt:
    return
  
  let mouseOver = ctx.mouseOver rect
  if mouseOver and ctx.mouseDown.len == 0:
    ctx.hover = id
  
  if ctx.focus == id:
    if ctx.mousePressed.len > 0 and
      not mouseOver:
      ctx.setFocus 0
    if ctx.mouseDown.len == 0 and Option.HoldFocus notin opt:
      ctx.setFocus 0
  
  if ctx.hover == id:
    if ctx.mousePressed.len > 0:
      ctx.setFocus id
    elif not mouseOver:
      ctx.hover = 0

# widgets
proc text*(ctx: Ctx, text: cstring) =
  var
    start = 0
    ends = 0
    i = 0
    font = ctx.style.font
    color = ctx.style.colors[Colors.Text.int]
  
  ctx.layoutBeginColumn
  ctx.layoutRow(1, [int32 -1], ctx.textHeight(font))
  while ends < text.len:
    let r = ctx.layoutNext
    var w = 0
    start = i
    ends = i
    var broken = false
    while ends < text.len and text[ends] != '\n':
      let word = i
      while i < text.len and text[i] notin [' ', '\n']:
        inc i
      w += ctx.textWidth(font, cast[cstring](addr text[word]), int32 i - word)
      if w > r.w and ends != start:
        broken = true
        break
      w += ctx.textWidth(font, cast[cstring](addr text[i]), 1)
      ends = i
      inc i
    ctx.drawText(font, cast[cstring](addr text[start]), int32 ends - start, vec2(r.x, r.y), color)
    i = ends + 1
  ctx.layoutEndColumn

proc label*(ctx: Ctx, text: cstring) =
  ctx.drawControlText(text, ctx.layoutNext, Colors.Text)

proc lmbPressed(ctx: Ctx): bool =
  Mouse.Left in ctx.mousePressed

proc lmbDown(ctx: Ctx): bool =
  Mouse.Left in ctx.mouseDown

proc button*(ctx: Ctx, label: cstring, icon = int32 0, opt = Option.AlignCenter.toSet): bool {.discardable.} =  
  var id: Id
  if not label.isNil:
    id = ctx.getId(label)
  else:
    id = ctx.getId(addr icon)
  let rect = ctx.layoutNext
  ctx.updateControl(id, rect, opt)
  # handle click
  if ctx.lmbPressed and ctx.focus == id:
    result = true
  # draw
  ctx.drawControlFrame(id, rect, Colors.Button, opt)
  if not label.isNil:
    ctx.drawControlText(label, rect, Colors.Text, opt)
  if icon != 0:
    ctx.drawIcon(icon, rect, ctx.style.colors[Colors.Text.int])

proc checkbox*(ctx: Ctx, label: cstring, state: var int32): bool {.discardable.} =
  let stateAddr = addr state
  let id = ctx.getId(addr stateAddr)
  var r = ctx.layoutNext
  let box = rect(r.x, r.y, r.h, r.h)
  ctx.updateControl(id, r)
  # handle click
  if ctx.lmbPressed and ctx.focus == id:
    result = true
    state = 1 - state
  # draw
  ctx.drawControlFrame(id, box, Colors.Base)
  if state != 0:
    ctx.drawIcon(Icon.Check.int32, box, ctx.style.colors[Colors.Text.int])
  r = rect(r.x + box.w, r.y, r.w - box.w, r.h)
  ctx.drawControlText(label, r, Colors.Text)

proc textboxRaw*(ctx: Ctx, buf: var cstring, maxSize: int32, id: Id, rect: Rect, opt: OptionSet = {}): Result {.discardable.} =
  ctx.updateControl(id, rect, opt + Option.HoldFocus)

  if ctx.focus == id:
    # handle text input
    var n = min(maxSize - buf.len - 1, ctx.inputText.len)
    if n > 0:
      copyMem(addr buf[buf.len], addr ctx.inputText, n)
      buf[buf.len] = '\0'
      result = Result.Change
    # handle backspace
    if Key.Backspace in ctx.keyPressed and buf.len > 0:
      # skip UTF-8 continuation bytes
      var len = buf.len - 1
      while len > 0 and (buf[len].uint8 and 0xc0) == 0x80:
        dec len
      buf[len] = '\0'
      result = Result.Change
    # handle return
    if Key.Return in ctx.keyPressed:
      ctx.setFocus 0
      result = Result.Submit
  
  # draw
  ctx.drawControlFrame(id, rect, Colors.Base, opt)
  if ctx.focus == id:
    let
      color = ctx.style.colors[Colors.Text.int]
      font = ctx.style.font
      textWidth = ctx.textWidth(font, buf, -1)
      textHeight = ctx.textHeight(font)
      ofx = rect.w - ctx.style.padding - textWidth - 1
      textX = rect.x + min(ofx, ctx.style.padding)
      textY = rect.y + (rect.h - textHeight) div 2
    ctx.pushClipRect rect
    ctx.drawText(font, buf, -1, vec2(textX, textY), color)
    ctx.drawRect(rect(textX + textWidth, textY, 1, textHeight), color)
    ctx.popClipRect
  else:
    ctx.drawControlText(buf, rect, Colors.Text, opt)

proc numberTextBox(ctx: Ctx, value: var cfloat, r: Rect, id: Id): bool = 
  if ctx.lmbPressed and
    Key.Shift in ctx.keyDown and
    ctx.hover == id:
    ctx.numberEdit = id
    let s = cstring $value
    copyMem(addr ctx.numberEditBuf[0], s[0].unsafeAddr, min(s.len, ctx.numberEditBuf.len))
  if ctx.numberEdit == id:
    assert ctx.numberEditBuf.len == 127
    var cstr = cast[cstring](addr ctx.numberEditBuf[0])
    let res = ctx.textboxRaw(cstr, ctx.numberEditBuf.len.int32, id, r)
    if res == Result.Submit or ctx.focus != id:
      value = parseFloat($cstr)
      ctx.numberEdit = 0
    else:
      result = true

proc textbox*(ctx: Ctx, buf: var cstring, maxSize: int32, opt: OptionSet = {}): Result {.discardable.} =
  let id = ctx.getId(addr buf)
  let r = ctx.layoutNext
  ctx.textboxRaw(buf, maxSize, id, r, opt)

proc sliderFloatFormat*(value: cfloat, fmt = ffDecimal, fmtPrecision = 2): cstring =
  if fmtPrecision > 0:
    cstring value.formatFloat(fmt, fmtPrecision)
  else:
    cstring $(int value + 0.5)

proc remap(value, low1, high1, low2, high2: cfloat): cfloat =
  ## Remap value from [low1, high1] to [low2, high2]
  low2 + (value - low1) * (high2 - low2) / (high1 - low1)

proc slider*(ctx: Ctx, value: var cfloat, low, high: cfloat, step: cfloat = 0, fmtPrecision = 2, fmt = ffDecimal, opt = Option.AlignCenter.toSet): bool {.discardable.} =
  let last = value
  let valueAddr = addr value
  let id = ctx.getId(addr valueAddr)
  let base = ctx.layoutNext

  var v = last
  # handle text input mode
  if ctx.numberTextBox(v, base, id):
    return false

  # handle normal mode
  ctx.updateControl(id, base, opt)

  # handle input
  if ctx.focus == id and (ctx.lmbPressed or ctx.lmbDown):
    v = remap(
      ctx.mousePos.x.cfloat,
      base.x.cfloat, cfloat base.x + base.w,
      low, high
    )
    v += step / 2
  # clamp and store value
  v = clamp(v, low, high)
  value = v
  if last != v:
    result = true
  
  # draw base
  ctx.drawControlFrame(id, base, Colors.Base, opt)
  # draw thumb
  let
    w = ctx.style.thumbSize
    x = int remap(v, low, high, 0.cfloat, cfloat(base.w - w))
    thumb = rect(base.x + x, base.y, w, base.h)
  ctx.drawControlFrame(id, thumb, Colors.Button, opt)
  # draw text
  ctx.drawControlText(v.sliderFloatFormat(fmt, fmtPrecision), base, Colors.Text, opt)

proc number*(ctx: Ctx, value: var cfloat, step: cfloat, fmtPrecision = 2, fmt = ffDecimal, opt = Option.AlignCenter.toSet): bool {.discardable.} =
  let valueAddr = addr value
  let id = ctx.getId(addr valueAddr)
  let base = ctx.layoutNext
  var last = value

  # handle text input mode
  if ctx.numberTextBox(value, base, id):
    return false

  # handle normal mode
  ctx.updateControl(id, base, opt)

  # handle input
  if ctx.focus == id and ctx.lmbDown:
    value += ctx.mouseDelta.x.cfloat * step

  # set flag if value changed
  if value != last:
    result = true

  # draw base
  ctx.drawControlFrame(id, base, Colors.Base, opt)
  # draw text
  ctx.drawControlText(value.sliderFloatFormat(fmt, fmtPrecision), base, Colors.Text, opt)

proc headerBase*(ctx: Ctx, label: cstring, isTreeNode: bool, opt: OptionSet): bool =
  var r: Rect
  var active, expanded: bool
  let id = ctx.getId(label)
  let idx = ctx.getPool(ctx.treenodePool, id)
  ctx.layoutRow(1, [int32 -1], 0)

  active = idx >= 0
  expanded =
    if Option.Expanded in opt:
      not active
    else:
      active
  r = ctx.layoutNext
  ctx.updateControl(id, r)

  # handle click
  active = active xor (ctx.lmbPressed and ctx.focus == id)

  # update pool ref
  if idx >= 0:
    if active:
      ctx.updatePool(ctx.treenodePool, idx)
    else:
      zeroMem(addr ctx.treenodePool[idx], sizeof(PoolItem))
  elif active:
    discard ctx.initPool(ctx.treenodePool, id)

  # draw
  if isTreeNode:
    if ctx.hover == id:
      ctx.drawFrame(ctx, r, Colors.ButtonHover.int32)
  else:
    ctx.drawControlFrame(id, r, Colors.Button)
  ctx.drawIcon(
    (if expanded: Icon.Expanded else: Icon.Collapsed).int32,
    rect(r.x, r.y, r.h, r.h), ctx.style.colors[Colors.Text.int]
  )
  r.x += r.h - ctx.style.padding
  r.w -= r.h - ctx.style.padding
  ctx.drawControlText(label, r, Colors.Text)

  expanded

proc header*(ctx: Ctx, label: cstring, opt: OptionSet = {}): bool =
  ctx.headerBase(label, false, opt)

proc beginTreenode*(ctx: Ctx, label: cstring, opt: OptionSet = {}): bool =
  result = ctx.headerBase(label, true, opt)
  if result:
    ctx.getLayout.indent += ctx.style.indent
    ctx.idStack.push ctx.lastId

proc endTreenode*(ctx: Ctx) =
  ctx.getLayout.indent -= ctx.style.indent
  ctx.popId

proc pushJump*(ctx: Ctx, dst: ptr Command): ptr Command =
  let cmd = ctx.pushCommand(Commands.Jump, JumpCommand.sizeof.int32)
  cmd.jump.dst = dst
  addr cmd

proc beginRootContainer(ctx: Ctx, cnt: Container) = 
  ctx.containerStack.push cnt
  # push container to roots list and push head command
  ctx.rootList.push cnt
  var nilCmd: Command
  cnt.head = ctx.pushJump(addr nilCmd)[]
  # set as hover root if the mouse is overlapping this container and it has a
  # higher zindex than the current hover root
  if rectOverlapsVec2(cnt.rect, ctx.mousePos) and
     (ctx.nextHoverRoot.isNil or cnt.zindex > ctx.nextHoverRoot.zindex):
    ctx.nextHoverRoot = cnt
  # clipping is reset here in case a root-container is made within
  # another root-containers's begin/end block; this prevents the inner
  # root-container being clipped to the outer
  ctx.clipStack.push unclippedRect

proc endRootContainer(ctx: Ctx) = 
  # push tail 'goto' jump command and set head 'skip' command. the final steps
  # on initing these are done in finish()
  let cnt = ctx.getCurrentContainer
  var nilCmd: Command
  cnt.tail = (ctx.pushJump(addr nilCmd))[]
  cnt.head.jump.dst = addr ctx.commandList.items[ctx.commandList.idx]
  # pop base clip rect and container
  ctx.popClipRect
  ctx.popContainer

proc scrollBarY(ctx: Ctx, cnt: Container, body: ptr Rect, contentSize: Vec2) =
  # only add scrollbar if content size is larger than body
  let maxScroll = contentSize.y - body.h
  if maxScroll > 0 and body.h > 0:
    let id = ctx.getId(cstring "!scrollBarY")

    # get sizing / positioning
    var base = body[]
    base.x += body.w
    base.w = ctx.style.scrollbarSize

    # handle input
    ctx.updateControl(id, base)
    if ctx.focus == id and ctx.lmbDown:
      cnt.scroll.y += (ctx.mouseDelta.y * contentSize.y) div base.h

    # clamp scroll to limits
    cnt.scroll.y = clamp(cnt.scroll.y, 0, maxScroll)

    # draw base and thumb
    ctx.drawFrame(ctx, base, Colors.ScrollBase.int32)
    var thumb = base
    thumb.h = max(ctx.style.thumbSize, (base.h * body.h) div contentSize.y)
    thumb.y += (cnt.scroll.y * (base.h - thumb.h)) div maxScroll
    ctx.drawFrame(ctx, thumb, Colors.ScrollThumb.int32)

    # set this as the scrollTarget (will get scrolled on mousewheel)
    # if the mouse is over it
    if ctx.mouseOver(body[]):
      ctx.scrollTarget = cnt
  else:
    cnt.scroll.y = 0

proc scrollBarX(ctx: Ctx, cnt: Container, body: ptr Rect, contentSize: Vec2) =
  # only add scrollbar if content size is larger than body
  let maxScroll = contentSize.x - body.w
  if maxScroll > 0 and body.w > 0:
    let id = ctx.getId(cstring "!scrollBarX")

    # get sizing / positioning
    var base = body[]
    base.y += body.h
    base.h = ctx.style.scrollbarSize

    # handle input
    ctx.updateControl(id, base)
    if ctx.focus == id and ctx.lmbDown:
      cnt.scroll.x += (ctx.mouseDelta.x * contentSize.x) div base.w

    # clamp scroll to limits
    cnt.scroll.x = clamp(cnt.scroll.x, 0, maxScroll)

    # draw base and thumb
    ctx.drawFrame(ctx, base, Colors.ScrollBase.int32)
    var thumb = base
    thumb.w = max(ctx.style.thumbSize, (base.w * body.w) div contentSize.x)
    thumb.x += (cnt.scroll.x * (base.w - thumb.w)) div maxScroll
    ctx.drawFrame(ctx, thumb, Colors.ScrollThumb.int32)

    # set this as the scrollTarget (will get scrolled on mousewheel)
    # if the mouse is over it
    if ctx.mouseOver(body[]):
      ctx.scrollTarget = cnt
  else:
    cnt.scroll.x = 0

proc scrollBars(ctx: Ctx, cnt: Container, body: ptr Rect) =
  let sz = ctx.style.scrollbarSize
  var cs = cnt.contentSize
  cs.x += ctx.style.padding * 2
  cs.y += ctx.style.padding * 2
  ctx.pushClipRect body[]
  # resize body to make room for scrollbars
  if cs.y > cnt.body.h:
    body.w -= sz
  if cs.x > cnt.body.w:
    body.h -= sz
  # to create a horizontal or vertical scrollbar almost-identical code is used
  # only the references to `x|y` `w|h` need to be switched
  ctx.scrollBarY(cnt, body, cs)
  ctx.scrollBarX(cnt, body, cs)
  ctx.popClipRect

proc pushContainerBody(ctx: Ctx, cnt: Container, body: Rect, opt: OptionSet): void = 
  if Option.NoScroll notin opt:
    scrollBars(ctx, cnt, body.addr)
  ctx.pushLayout(expandRect(body, -ctx.style.padding), cnt.scroll)
  cnt.body = body

proc beginWindow*(ctx: Ctx, title: cstring, rect: Rect, opt: OptionSet = {}): bool =
  var id = ctx.getId(title)
  var cnt = ctx.getContainerBase(id, opt)
  if cnt.isNil or not cnt.open:
    return false
  ctx.idStack.push id

  if cnt.rect.w == 0:
    cnt.rect = rect
  ctx.beginRootContainer(cnt)
  var body = cnt.rect
  var rec = cnt.rect

  # draw frame
  if Option.NoFrame notin opt:
    ctx.drawFrame(ctx, rec, Colors.WindowBg.int32)

  # draw title bar
  if Option.NoTitle notin opt:
    var tr = rec
    tr.h = ctx.style.titleHeight
    ctx.drawFrame(ctx, tr, Colors.TitleBg.int32)

    # draw title text
    if Option.NoTitle notin opt:
      var id = ctx.getId(cstring "!title")
      ctx.updateControl(id, tr, opt)
      ctx.drawControlText(title, tr, Colors.TitleText, opt)
      if id == ctx.focus and ctx.lmbDown:
        cnt.rect.x += ctx.mouseDelta.x
        cnt.rect.y += ctx.mouseDelta.y
      body.y += tr.h
      body.h -= tr.h

    # draw `close` button
    if Option.NoClose notin opt:
      var id = ctx.getId(cstring "!close")
      var r = rect(tr.x + tr.w - tr.h, tr.y, tr.h, tr.h)
      tr.w -= r.w
      ctx.drawIcon(Icon.Close.int32, r, ctx.style.colors[Colors.TitleText.int])
      ctx.updateControl(id, r, opt)
      if ctx.lmbPressed and id == ctx.focus:
        cnt.open = false

  ctx.pushContainerBody(cnt, body, opt)

  # draw `resize` handle
  if Option.NoResize notin opt:
    var sz = ctx.style.titleHeight
    var id = ctx.getId(cstring "!resize")
    var r = rect(rec.x + rec.w - sz, rec.y + rec.h - sz, sz, sz)
    ctx.updateControl(id, r, opt)
    if ctx.lmbDown and id == ctx.focus:
      cnt.rect.w = max(96, cnt.rect.w + ctx.mouseDelta.x)
      cnt.rect.h = max(64, cnt.rect.h + ctx.mouseDelta.y)

  # resize to content size
  if Option.AutoSize in opt:
    var r = ctx.getLayout.body
    cnt.rect.w = cnt.contentSize.x + (cnt.rect.w - r.w)
    cnt.rect.h = cnt.contentSize.y + (cnt.rect.h - r.h)

  # close if this is a popup window and elsewhere was clicked
  if Option.Popup in opt and
    ctx.mousePressed.len > 0 and
    ctx.hoverRoot != cnt:
    cnt.open = false

  ctx.pushClipRect cnt.body
  true

proc endWindow*(ctx: Ctx) =
  ctx.popClipRect
  ctx.endRootContainer

proc openPopup*(ctx: Ctx, name: cstring) =
  let cnt = ctx.getContainer(name)
  # set as hover root so popup isn't closed in beginWindow()
  ctx.hoverRoot = cnt
  ctx.nextHoverRoot = cnt
  # position at mouse cursor, open and bring-to-front
  cnt.rect = rect(ctx.mousePos.x, ctx.mousePos.y, 1, 1)
  cnt.open = true
  ctx.bringToFront(cnt)

proc beginPopup*(ctx: Ctx, name: cstring): bool =
  ctx.beginWindow(
    name, rect(0, 0, 0, 0),
    {Option.Popup, Option.AutoSize, Option.NoResize,
    Option.NoScroll, Option.NoTitle, Option.Closed}
  )

proc endPopup*(ctx: Ctx) =
  ctx.endWindow

proc beginPanel*(ctx: Ctx, name: cstring, opt: OptionSet = {}) =
  ctx.pushId(addr name[0], name.len.int32)
  let cnt = ctx.getContainerBase(ctx.lastId, opt)
  cnt.rect = ctx.layoutNext
  if Option.NoFrame notin opt:
    ctx.drawFrame(ctx, cnt.rect, Colors.PanelBg.int32)
  ctx.containerStack.push cnt
  ctx.pushContainerBody(cnt, cnt.rect, opt)
  ctx.pushClipRect cnt.body

proc endPanel*(ctx: Ctx) =
  ctx.popClipRect
  ctx.popContainer
