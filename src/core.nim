import
  algorithm,
  hashes,
  context,
  shapes,
  enums,
  style,
  draw,
  type_shorthands

# context managment
proc initCtx*(): Ctx =  
  result = new CtxBase
  result.drawFrame = drawFrame
  result.style = defaultStyle

proc begin*(ctx: Ctx) =
  assert not (ctx.textWidth.isNil or ctx.textHeight.isNil)

  ctx.commandList.setLen 0
  ctx.rootList.setLen 0
  ctx.stringBuffer.setLen 0

  ctx.scrollTarget = nil
  ctx.hoverRoot = ctx.nextHoverRoot
  ctx.nextHoverRoot = nil
  ctx.mouseDelta.x = ctx.mousePos.x - ctx.lastMousePos.x
  ctx.mouseDelta.y = ctx.mousePos.y - ctx.lastMousePos.y
  inc ctx.frame

proc finish*(ctx: Ctx) =
  # check stacks
  assert ctx.containerStack.len == 0
  assert ctx.clipStack.len == 0
  assert ctx.idStack.len == 0
  assert ctx.layoutStack.len == 0

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
  ctx.inputText.setLen 0
  ctx.keyPressed = {}
  ctx.mousePressed = {}
  ctx.scrollDelta = vec2(0, 0)
  ctx.lastMousePos = ctx.mousePos

  # sort root containers by zindex
  proc cmpZindex(a, b: Container): int =
    if a.isNil:
      return -1
    elif b.isNil:
      return 1
    cmp(a.zindex, b.zindex)
  
  let n = ctx.rootList.len
  var subarrayToSort = ctx.rootList[0..<n]
  subarrayToSort.sort(cmpZindex)
  ctx.rootList[0..<n] = subarrayToSort

  ctx.setRootContainerJump n

proc setFocus*(ctx: Ctx, id: Id) =
  ctx.focus = id
  ctx.updatedFocus = true

proc getParentId(ctx: Ctx): Id =
  if ctx.idStack.len > 0:
    result = ctx.idStack[^1]

proc getIdBase(ctx: Ctx, dataHash: Hash): Id =
  result = Id !$(ctx.getParentId !& dataHash)
  ctx.lastId = result

proc getId*(ctx: Ctx, data: ptr): Id =
  ctx.getIdBase hashData(data, data[].sizeof)

proc getId*(ctx: Ctx, data: string): Id =
  ctx.getIdBase hash(data)

proc getContainerBase*(ctx: Ctx, id: Id, opt: OptionSet = {}): Container = 
  # try to get existing container from pool
  var idx = ctx.getPool(ctx.containerPool, id)
  if idx >= 0:
    if ctx.containers[idx].open or Option.Closed notin opt:
      ctx.updatePool(ctx.containerPool, idx)
    return addr ctx.containers[idx]
  if (Option.Closed in opt): return nil

  # container not found in pool: init new container
  idx = ctx.initPool(ctx.containerPool, id)
  ctx.containers[idx] = ContainerBase()
  var cnt = addr ctx.containers[idx]
  cnt.open = true
  ctx.bringToFront cnt
  cnt

# layout
proc popContainer*(ctx: Ctx) =
  let
    cnt = ctx.containerStack[^1]
    layout = addr ctx.layoutStack[^1]
  cnt.contentSize.x = layout.max.x - layout.body.x
  cnt.contentSize.y = layout.max.y - layout.body.y
  
  ctx.containerStack.rm
  ctx.layoutStack.rm
  ctx.idStack.rm

proc layoutRow*(ctx: Ctx, items: i32, widths: openArray[i32], height: i32) =
  let layout = addr ctx.layoutStack[^1]
  if widths.len > 0:
    assert items <= MaxWidths
    layout.widths[0..<items] = widths[0..<items]
  layout.items = items
  layout.position = vec2(layout.indent, layout.nextRow)
  layout.size.y = height
  layout.itemIndex = 0

proc layoutWidth*(ctx: Ctx, width: i32) =
  ctx.layoutStack[^1].size.x = width

proc layoutHeight*(ctx: Ctx, height: i32) =
  ctx.layoutStack[^1].size.y = height

proc pushLayout*(ctx: Ctx, body: Rect, scroll: Vec2) =
  var layout: Layout
  layout.body = rect(body.x - scroll.x, body.y - scroll.y, body.w, body.h)
  layout.max = vec2(i32.low, i32.low)
  ctx.layoutStack.add layout
  ctx.layoutRow(1, [i32 0, -1], 0)

proc layoutSetNext*(ctx: Ctx, rect: Rect, relative: bool) =
  var layout = addr ctx.layoutStack[^1]
  layout.next = rect
  layout.nextType =
    if relative: LayoutType.Relative
    else: LayoutType.Absolute

proc layoutNext*(ctx: Ctx): Rect =
  let
    layout = addr ctx.layoutStack[^1]
    style = addr ctx.style

  var res: Rect
  if layout.nextType != LayoutType.None:
    # handle rect set by `layoutSetNext`
    let typ = layout.nextType
    layout.nextType = LayoutType.None
    res = layout.next
    if typ == LayoutType.Absolute:
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
    if res.w < 0: res.w += layout.body.w - res.x + 1
    if res.h < 0: res.h += layout.body.h - res.y + 1

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
  let b = addr ctx.layoutStack[^1]
  ctx.layoutStack.rm
  # inherit position/nextRow/max from child layout if they are greater
  let a = addr ctx.layoutStack[^1]
  a.position.x = max(a.position.x, b.position.x + b.body.x - a.body.x)
  a.nextRow = max(a.nextRow, b.nextRow + b.body.y - a.body.y)
  a.max.x = max(a.max.x, b.max.x)
  a.max.y = max(a.max.y, b.max.y)

# misc
proc drawControlFrame*(ctx: Ctx, id: Id, rect: Rect, colorId: Colors, opt: OptionSet = {}) =
  if Option.NoFrame in opt:
    return
  var colorId = colorId.i32
  if ctx.focus == id:
    colorId += 2
  elif ctx.hover == id:
    colorId += 1
  ctx.drawFrame(ctx, rect, colorId.Colors)

proc drawControlText*(ctx: Ctx, str: string, rect: Rect, colorId: Colors, opt: OptionSet = {}) =
  let
    font = ctx.style.font
    textWidth = ctx.textWidth(font, str, -1)
  ctx.pushClipRect rect
  var pos = vec2(0, 0)
  pos.y = rect.t + (rect.h - ctx.textHeight(font)) div 2
  if Option.AlignCenter in opt:
    pos.x = rect.l + (rect.w - textWidth) div 2
  elif Option.AlignRight in opt:
    pos.x = rect.r - textWidth - ctx.style.padding
  else:
    pos.x = rect.l + ctx.style.padding
  ctx.drawText(font, str, -1, pos, ctx.style.colors[colorId])
  ctx.clipStack.rm

proc inHoverRoot(ctx: Ctx): bool =
  for i in countdown(ctx.containerStack.high, 0):
    if ctx.containerStack[i] == ctx.hoverRoot:
      return true
    # only root containers have their `head` field set; stop searching if we've
    # reached the current root container
    if ctx.containerStack[i].head != -1:
      break

proc mouseOver*(ctx: Ctx, rect: Rect): bool =
  for i in 0..100_000:
    discard ctx.inHoverRoot
  overlapsPos(rect, ctx.mousePos) and
    overlapsPos(ctx.clipStack[^1], ctx.mousePos) and
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

proc lmbPressed*(ctx: Ctx): bool =
  Mouse.Left in ctx.mousePressed

proc lmbDown*(ctx: Ctx): bool =
  Mouse.Left in ctx.mouseDown

proc handleTextInput*(ctx: Ctx, buf: var string, maxSize: i32): Result =
  # text input
  for k in ctx.inputText:
    if buf.len >= maxSize: break
    buf.add k
    result = Result.Change
  # backspace
  if Key.Backspace in ctx.keyPressed and buf.len > 0:
    buf.rm
    result = Result.Change
  # return
  if Key.Return in ctx.keyPressed:
    ctx.setFocus 0
    result = Result.Submit
