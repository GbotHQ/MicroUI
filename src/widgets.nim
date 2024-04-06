import
  strutils,
  typetraits,
  context,
  shapes,
  style,
  enums,
  draw,
  core,
  type_shorthands

proc getContainer*(ctx: Ctx, name: string): Container =
  ctx.getContainerBase ctx.getId name

proc text*(ctx: Ctx, text: string) =
  var
    start = 0
    ends = 0
    i = 0
    font = ctx.style.font
    color = ctx.style.colors[Colors.Text]
  
  ctx.layoutBeginColumn
  ctx.layoutRow(1, [i32 -1], ctx.textHeight(font))
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
      w += ctx.textWidth(font, text[word..^1], i32 i - word)
      if w > r.w and ends != start:
        broken = true
        break
      w += ctx.textWidth(font, text[i..^1], 1)
      ends = i
      inc i
    ctx.drawText(font, text[start..^1], i32 ends - start, vec2(r.x, r.y), color)
    i = ends + 1
  ctx.layoutEndColumn

proc label*(ctx: Ctx, text: string) =
  ctx.drawControlText(text, ctx.layoutNext, Colors.Text)

proc button*(ctx: Ctx, label: string, icon = Icon.None, opt = Option.AlignCenter.toSet): bool {.discardable.} =  
  let id =
    if not label.isNil:
      ctx.getId(label)
    else:
      ctx.getId(addr icon)
  let rect = ctx.layoutNext
  ctx.updateControl(id, rect, opt)
  # handle click
  if ctx.lmbPressed and ctx.focus == id:
    result = true
  # draw
  ctx.drawControlFrame(id, rect, Colors.Button, opt)
  if not label.isNil:
    ctx.drawControlText(label, rect, Colors.Text, opt)
  if icon != Icon.None:
    ctx.drawIcon(icon, rect, ctx.style.colors[Colors.Text])

proc checkbox*(ctx: Ctx, label: string, state: var i32): bool {.discardable.} =
  let
    stateAddr = addr state
    id = ctx.getId(addr stateAddr)
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
    ctx.drawIcon(Icon.Check, box, ctx.style.colors[Colors.Text])
  r = rect(r.x + box.w, r.y, r.w - box.w, r.h)
  ctx.drawControlText(label, r, Colors.Text)

proc textboxRaw*(ctx: Ctx, buf: var string, maxSize: i32, id: Id, rect: Rect, opt: OptionSet = {}): Result {.discardable.} =
  ctx.updateControl(id, rect, opt + Option.HoldFocus)

  ctx.drawControlFrame(id, rect, Colors.Base, opt)
  if ctx.focus == id:
    result = ctx.handleTextInput(buf, maxSize)
    let
      color = ctx.style.colors[Colors.Text]
      font = ctx.style.font
      textWidth = ctx.textWidth(font, buf, -1)
      textHeight = ctx.textHeight(font)
      ofx = rect.w - ctx.style.padding - textWidth - 1
      textX = rect.x + min(ofx, ctx.style.padding)
      textY = rect.y + (rect.h - textHeight) div 2
    ctx.pushClipRect rect
    ctx.drawText(font, buf, -1, vec2(textX, textY), color)
    ctx.drawRect(rect(textX + textWidth, textY, 1, textHeight), color)
    ctx.clipStack.rm
  else:
    ctx.drawControlText(buf, rect, Colors.Text, opt)

proc numberTextBox(ctx: Ctx, value: var f32, r: Rect, id: Id): bool = 
  if ctx.lmbPressed and
    Key.Shift in ctx.keyDown and
    ctx.hover == id:
    ctx.numberEdit = id
    let str = $value
    let len = min(str.len, ctx.numberEditBuf.len)
    ctx.numberEditBuf[0..<len] = str[0..<len]
  
  if ctx.numberEdit == id:
    let res = ctx.textboxRaw(ctx.numberEditBuf, 32, id, r)
    if res == Result.Submit or ctx.focus != id:
      try:
        value = parseFloat(ctx.numberEditBuf)
      except: discard
      ctx.numberEdit = 0
    else:
      result = true

proc textbox*(ctx: Ctx, buf: var string, maxSize: i32, opt: OptionSet = {}): Result {.discardable.} =
  let bufAddr = addr buf
  ctx.textboxRaw(buf, maxSize, ctx.getId(addr bufAddr), ctx.layoutNext, opt)

proc sliderFloatFormat*(value: f32, fmt = ffDecimal, fmtPrecision = 2): string =
  if fmtPrecision > 0:
    value.formatFloat(fmt, fmtPrecision)
  else:
    $(int value + 0.5)

proc slider*(ctx: Ctx, value: var f32, low, high: f32, step: f32 = 0, fmtPrecision = 2, fmt = ffDecimal, opt = Option.AlignCenter.toSet): bool {.discardable.} =
  let
    last = value
    valueAddr = addr value
    id = ctx.getId(addr valueAddr)
    base = ctx.layoutNext

  var v = last
  # handle text input mode
  if ctx.numberTextBox(v, base, id):
    return false

  # handle normal mode
  ctx.updateControl(id, base, opt)

  # handle input
  if ctx.focus == id and (ctx.lmbPressed or ctx.lmbDown):
    v = remap(
      ctx.mousePos.x.f32,
      base.x.f32, f32 base.x + base.w,
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
    x = int remap(v, low, high, 0.f32, f32(base.w - w))
    thumb = rect(i32 base.x + x, i32 base.y, i32 w, i32 base.h)
  ctx.drawControlFrame(id, thumb, Colors.Button, opt)
  # draw text
  ctx.drawControlText(v.sliderFloatFormat(fmt, fmtPrecision), base, Colors.Text, opt)

proc number*(ctx: Ctx, value: var f32, step: f32, fmtPrecision = 2, fmt = ffDecimal, opt = Option.AlignCenter.toSet): bool {.discardable.} =
  let
    valueAddr = addr value
    id = ctx.getId(addr valueAddr)
    base = ctx.layoutNext
    last = value

  # handle text input mode
  if ctx.numberTextBox(value, base, id):
    return false

  # handle normal mode
  ctx.updateControl(id, base, opt)

  # handle input
  if ctx.focus == id and ctx.lmbDown:
    value += ctx.mouseDelta.x.f32 * step

  # set flag if value changed
  if value != last:
    result = true

  # draw base
  ctx.drawControlFrame(id, base, Colors.Base, opt)
  # draw text
  ctx.drawControlText(value.sliderFloatFormat(fmt, fmtPrecision), base, Colors.Text, opt)

proc header*(ctx: Ctx, label: string, opt: OptionSet = {}, isTreeNode = false): bool =
  let
    id = ctx.getId(label)
    idx = ctx.getPool(ctx.treenodePool, id)
  
  ctx.layoutRow(1, [i32 -1], 0)

  var
    active = idx >= 0
    expanded =
      if Option.Expanded in opt:
        not active
      else:
        active
  var r = ctx.layoutNext
  ctx.updateControl(id, r)

  # handle click
  active = active xor (ctx.lmbPressed and ctx.focus == id)

  # update pool ref
  if idx >= 0:
    if active:
      ctx.updatePool(ctx.treenodePool, idx)
    else:
      ctx.treenodePool[idx] = PoolItem()
  elif active:
    discard ctx.initPool(ctx.treenodePool, id)

  # draw
  if isTreeNode:
    if ctx.hover == id:
      ctx.drawFrame(ctx, r, Colors.ButtonHover)
  else:
    ctx.drawControlFrame(id, r, Colors.Button)
  ctx.drawIcon(
    if expanded: Icon.Expanded else: Icon.Collapsed,
    rect(r.x, r.y, r.h, r.h), ctx.style.colors[Colors.Text]
  )
  r.x += r.h - ctx.style.padding
  r.w -= r.h - ctx.style.padding
  ctx.drawControlText(label, r, Colors.Text)

  expanded

proc beginTreenode*(ctx: Ctx, label: string, opt: OptionSet = {}): bool =
  result = ctx.header(label, opt, true)
  if result:
    ctx.layoutStack[^1].indent += ctx.style.indent
    ctx.idStack.add ctx.lastId

proc endTreenode*(ctx: Ctx) =
  ctx.layoutStack[^1].indent -= ctx.style.indent
  ctx.idStack.rm

proc beginRootContainer(ctx: Ctx, cnt: Container) = 
  ctx.containerStack.add cnt
  # push container to roots list and push head command
  ctx.rootList.add cnt
  cnt.head = ctx.commandList.len
  discard ctx.pushCommand Commands.Jump
  # set as hover root if the mouse is overlapping this container and it has a
  # higher zindex than the current hover root
  if overlapsPos(cnt.rect, ctx.mousePos) and
     (ctx.nextHoverRoot.isNil or cnt.zindex > ctx.nextHoverRoot.zindex):
    ctx.nextHoverRoot = cnt
  # clipping is reset here in case a root-container is made within
  # another root-containers's begin/end block; this prevents the inner
  # root-container being clipped to the outer
  ctx.clipStack.add UnclippedRect

proc endRootContainer(ctx: Ctx) = 
  ctx.pushCommandToContainer
  # pop base clip rect and container
  ctx.clipStack.rm
  ctx.popContainer

proc scrollBarY(ctx: Ctx, cnt: Container, body: var Rect, contentSize: Vec2) =
  # only add scrollbar if content size is larger than body
  let maxScroll = contentSize.y - body.h
  if maxScroll > 0 and body.h > 0:
    let id = ctx.getId("!scrollBarY")

    # get sizing / positioning
    var base = body
    base.x += body.w
    base.w = ctx.style.scrollbarSize

    # handle input
    ctx.updateControl(id, base)
    if ctx.focus == id and ctx.lmbDown:
      cnt.scroll.y += (ctx.mouseDelta.y * contentSize.y) div base.h

    # clamp scroll to limits
    cnt.scroll.y = clamp(cnt.scroll.y, 0, maxScroll)

    # draw base and thumb
    ctx.drawFrame(ctx, base, Colors.ScrollBase)
    var thumb = base
    thumb.h = max(ctx.style.thumbSize, (base.h * body.h) div contentSize.y)
    thumb.y += (cnt.scroll.y * (base.h - thumb.h)) div maxScroll
    ctx.drawFrame(ctx, thumb.expand -1, Colors.ScrollThumb)

    # set this as the scrollTarget (will get scrolled on mousewheel)
    # if the mouse is over it
    if ctx.mouseOver body:
      ctx.scrollTarget = cnt
  else:
    cnt.scroll.y = 0

proc scrollBarX(ctx: Ctx, cnt: Container, body: var Rect, contentSize: Vec2) =
  # only add scrollbar if content size is larger than body
  let maxScroll = contentSize.x - body.w
  if maxScroll > 0 and body.w > 0:
    let id = ctx.getId("!scrollBarX")

    # get sizing / positioning
    var base = body
    base.y += body.h
    base.h = ctx.style.scrollbarSize

    # handle input
    ctx.updateControl(id, base)
    if ctx.focus == id and ctx.lmbDown:
      cnt.scroll.x += (ctx.mouseDelta.x * contentSize.x) div base.w

    # clamp scroll to limits
    cnt.scroll.x = clamp(cnt.scroll.x, 0, maxScroll)

    # draw base and thumb
    ctx.drawFrame(ctx, base, Colors.ScrollBase)
    var thumb = base
    thumb.w = max(ctx.style.thumbSize, (base.w * body.w) div contentSize.x)
    thumb.x += (cnt.scroll.x * (base.w - thumb.w)) div maxScroll
    ctx.drawFrame(ctx, thumb, Colors.ScrollThumb)

    # set this as the scrollTarget (will get scrolled on mousewheel)
    # if the mouse is over it
    if ctx.mouseOver body:
      ctx.scrollTarget = cnt
  else:
    cnt.scroll.x = 0

proc scrollBars(ctx: Ctx, cnt: Container, body: var Rect) =
  let sz = ctx.style.scrollbarSize
  var cs = cnt.contentSize
  cs.x += ctx.style.padding * 2
  cs.y += ctx.style.padding * 2
  ctx.pushClipRect body
  # resize body to make room for scrollbars
  if cs.y > cnt.body.h:
    body.w -= sz
  if cs.x > cnt.body.w:
    body.h -= sz
  # to create a horizontal or vertical scrollbar almost-identical code is used
  # only the references to `x|y` `w|h` need to be switched
  ctx.scrollBarY(cnt, body, cs)
  ctx.scrollBarX(cnt, body, cs)
  ctx.clipStack.rm

proc pushContainerBody(ctx: Ctx, cnt: Container, body: Rect, opt: OptionSet = {}): void = 
  var body = body
  if Option.NoScroll notin opt:
    scrollBars(ctx, cnt, body)
  ctx.pushLayout(expand(body, -ctx.style.padding), cnt.scroll)
  cnt.body = body

proc beginWindow*(ctx: Ctx, title: string, rect: Rect, opt: OptionSet = {}): bool =
  var
    id = ctx.getId(title)
    cnt = ctx.getContainerBase(id, opt)
  if cnt.isNil or not cnt.open:
    return false
  ctx.idStack.add id

  if cnt.rect.w == 0:
    cnt.rect = rect
  ctx.beginRootContainer cnt
  var
    body = cnt.rect
    rec = cnt.rect

  # draw frame
  if Option.NoFrame notin opt:
    ctx.drawFrame(ctx, rec, Colors.WindowBg)

  # draw title bar
  if Option.NoTitle notin opt:
    var tr = rec
    tr.h = ctx.style.titleHeight
    ctx.drawFrame(ctx, tr, Colors.TitleBg)

    # draw title text
    if Option.NoTitle notin opt:
      let id = ctx.getId("!title")
      ctx.updateControl(id, tr, opt)
      ctx.drawControlText(title, tr, Colors.TitleText, opt)
      if id == ctx.focus and ctx.lmbDown:
        cnt.rect.x += ctx.mouseDelta.x
        cnt.rect.y += ctx.mouseDelta.y
      body.y += tr.h
      body.h -= tr.h

    # draw `close` button
    if Option.NoClose notin opt:
      let
        id = ctx.getId("!close")
        r = rect(tr.x + tr.w - tr.h, tr.y, tr.h, tr.h)
      tr.w -= r.w
      ctx.drawIcon(Icon.Close, r, ctx.style.colors[Colors.TitleText])
      ctx.updateControl(id, r, opt)
      if ctx.lmbPressed and id == ctx.focus:
        cnt.open = false

  ctx.pushContainerBody(cnt, body, opt)

  # draw `resize` handle
  if Option.NoResize notin opt:
    let
      sz = ctx.style.titleHeight
      id = ctx.getId("!resize")
      r = rect(rec.x + rec.w - sz, rec.y + rec.h - sz, sz, sz)
    ctx.updateControl(id, r, opt)
    if ctx.lmbDown and id == ctx.focus:
      cnt.rect.w = max(96, cnt.rect.w + ctx.mouseDelta.x)
      cnt.rect.h = max(64, cnt.rect.h + ctx.mouseDelta.y)

  # resize to content size
  if Option.AutoSize in opt:
    let r = ctx.layoutStack[^1].body
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
  ctx.clipStack.rm
  ctx.endRootContainer

proc openPopup*(ctx: Ctx, name: string) =
  let cnt = ctx.getContainer name
  # set as hover root so popup isn't closed in beginWindow()
  ctx.hoverRoot = cnt
  ctx.nextHoverRoot = cnt
  # position at mouse cursor, open and bring-to-front
  cnt.rect = rect(ctx.mousePos.x, ctx.mousePos.y, 1, 1)
  cnt.open = true
  ctx.bringToFront cnt

proc beginPopup*(ctx: Ctx, name: string): bool =
  ctx.beginWindow(
    name, rect(0, 0, 0, 0),
    {Option.Popup, Option.AutoSize, Option.NoResize,
    Option.NoScroll, Option.NoTitle, Option.Closed}
  )

proc endPopup*(ctx: Ctx) = ctx.endWindow

proc beginPanel*(ctx: Ctx, name: string, opt: OptionSet = {}) =
  ctx.idStack.add ctx.getId(name)
  let cnt = ctx.getContainerBase(ctx.lastId, opt)
  cnt.rect = ctx.layoutNext
  if Option.NoFrame notin opt:
    ctx.drawFrame(ctx, cnt.rect, Colors.PanelBg)
  ctx.containerStack.add cnt
  ctx.pushContainerBody(cnt, cnt.rect, opt)
  ctx.pushClipRect cnt.body

proc endPanel*(ctx: Ctx) =
  ctx.clipStack.rm
  ctx.popContainer
