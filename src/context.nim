import
  math,
  hashes,
  shapes,
  enums,
  style,
  type_shorthands

const
  PoolSize* = 48
  MaxWidths* = 16
  MaxFmt* = 127

type
  Id* = Hash
  
  PoolItem* = object
    id*: Id
    lastUpdate*: i32

  Layout* = object
    body*: Rect
    next*: Rect
    position*: Vec2
    size*: Vec2
    max*: Vec2
    widths*: array[MaxWidths, i32]
    items*: i32
    itemIndex*: i32
    nextRow*: i32
    nextType*: LayoutType
    indent*: i32
  
  JumpCommand* = object
    typ*: Commands
    dst*: int
  
  ClipCommand* = object
    typ*: Commands
    rect*: Rect
  
  RectCommand* = object
    typ*: Commands
    rect*: Rect
    color*: Color
  
  TextCommand* = object
    typ*: Commands
    font*: Font
    pos*: Vec2
    color*: Color
    strLoc*: i32
  
  IconCommand* = object
    typ*: Commands
    rect*: Rect
    strLoc*: i32
    color*: Color

  CommandObj* {.union.} = object
    typ*: Commands
    jump*: JumpCommand
    clip*: ClipCommand
    rect*: RectCommand
    text*: TextCommand
    icon*: IconCommand
  
  Command* = ref CommandObj
  
  ContainerBase* = object
    head*, tail* = -1
    rect*, body*: Rect
    contentSize*, scroll*: Vec2
    zindex*: i32
    open*: bool
  
  Container* = ptr ContainerBase

  CtxObj* = object
    # callbacks:
    textWidth*: proc(font: Font, str: string, len: i32): i32
    textHeight*: proc(font: Font): i32
    drawFrame*: proc(ctx: Ctx, rect: Rect, colorId: Colors)
    # coreState:
    style*: Style
    hover*: Id
    focus*: Id
    lastId*: Id
    lastRect*: Rect
    lastZIndex*: i32
    updatedFocus*: bool
    frame*: i32
    hoverRoot*: Container
    nextHoverRoot*: Container
    scrollTarget*: Container
    numberEditBuf* = newStringOfCap(MaxFmt)
    numberEdit*: Id
    # stacks:
    commandList* = newSeqOfCap[Command](1024)
    rootList* = newSeqOfCap[Container](32)
    containerStack* = newSeqOfCap[Container](32)
    clipStack* = newSeqOfCap[Rect](32)
    idStack* = newSeqOfCap[Id](32)
    layoutStack* = newSeqOfCap[Layout](16)
    # retainedStatePools:
    containerPool* = newSeq[PoolItem](PoolSize)
    containers* = newSeq[ContainerBase](PoolSize)
    treeNodePool* = newSeq[PoolItem](PoolSize)
    # inputState:
    mousePos*: Vec2
    lastMousePos*: Vec2
    mouseDelta*: Vec2
    scrollDelta*: Vec2
    mouseDown*: MouseSet
    mousePressed*: MouseSet
    keyDown*: KeySet
    keyPressed*: KeySet
    inputText* = newStringOfCap(32)
    stringBuffer* = newStringOfCap(2^16)
  
  Ctx* = ref CtxObj

template rm*(stk: typed) =
  stk.setLen stk.len - 1

proc getStr*(ctx: Ctx, cmd: TextCommand): string =
  for i in cmd.strLoc+1..<ctx.stringBuffer.len:
    if ctx.stringBuffer[i] == '\0': break
    result.add ctx.stringBuffer[i]

proc getStr*(ctx: Ctx, cmd: IconCommand): string =
  for i in cmd.strLoc+1..<ctx.stringBuffer.len:
    if ctx.stringBuffer[i] == '\0': break
    result.add ctx.stringBuffer[i]

# pool
proc getPool*(ctx: Ctx, items: openArray[PoolItem], id: Id): i32 =
  for i, k in items:
    if k.id == id:
      return i32 i
  -1

proc updatePool*(ctx: Ctx, items: var openArray[PoolItem], idx: i32) =
  items[idx].lastUpdate = ctx.frame

proc initPool*(ctx: Ctx, items: var openArray[PoolItem], id: Id): i32 =
  result = -1

  var f = ctx.frame
  for i, k in items:
    if k.lastUpdate < f:
      f = k.lastUpdate
      result = i32 i
  
  assert result > -1
  items[result].id = id
  ctx.updatePool(items, result)
