import
  context,
  shapes,
  enums,
  type_shorthands

proc inputMouseMove*(ctx: Ctx, x, y: i32) =
  ctx.mousePos = vec2(x, y)

proc inputMouseDown*(ctx: Ctx, x, y: i32, btn: Mouse) =
  ctx.inputMouseMove(x, y)
  ctx.mouseDown = ctx.mouseDown + btn
  ctx.mousePressed = ctx.mousePressed + btn

proc inputMouseUp*(ctx: Ctx, x, y: i32, btn: Mouse) =
  ctx.inputMouseMove(x, y)
  ctx.mouseDown = ctx.mouseDown - btn

proc inputScroll*(ctx: Ctx, x, y: i32) =
  ctx.scrollDelta.x += x
  ctx.scrollDelta.y += y

proc inputKeyDown*(ctx: Ctx, key: KeySet) =
  ctx.keyPressed = ctx.keyPressed + key
  ctx.keyDown = ctx.keyDown + key

proc inputKeyUp*(ctx: Ctx, key: KeySet) =
  ctx.keyDown = ctx.keyDown - key

proc inputText*(ctx: Ctx, text: string) =
  ctx.inputText.add text
