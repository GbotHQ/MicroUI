import
  context,
  shapes,
  enums,
  style,
  type_shorthands

# clip
proc pushClipRect*(ctx: Ctx, rect: Rect) =
  ctx.clipStack.add rect.intersect ctx.clipStack[^1]

proc checkClip*(ctx: Ctx, r: Rect): Clip =
  let cr = ctx.clipStack[^1]
  if r.l > cr.r or r.r < cr.l or
     r.t > cr.b or r.b < cr.t:
    All
  elif r.l >= cr.l and r.r <= cr.r and
     r.t >= cr.t and r.b <= cr.b:
    None
  else:
    Part

# drawing
proc pushCommand*(ctx: Ctx, typ: Commands): Command = 
  result = create CommandBase
  result.typ = typ
  ctx.commandList.add result

iterator iterCommands*(ctx: Ctx): Command =
  var
    cmd: Command
    i = 0
  while i < ctx.commandList.len:
    cmd = ctx.commandList[i]
    yield cmd

    inc i
    if cmd.typ == Commands.Jump:
      i = cmd.jump.dst

proc setRootContainerJump*(ctx: Ctx, n: int) =
  # set root container jump commands
  for i, cnt in ctx.rootList[0..<n]:
    # if this is the first container then make the first command jump to it.
    # otherwise set the previous container's tail to jump to this one
    let jmpLoc = cnt.head + 1
    if i == 0:
      ctx.commandList[0].jump.dst = jmpLoc
    else:
      ctx.commandList[ctx.rootList[i - 1].tail].jump.dst = jmpLoc
    # make the last container's tail jump to the end of command list
    if i == n - 1:
      ctx.commandList[cnt.tail].jump.dst = ctx.commandList.len

proc pushCommandToContainer*(ctx: Ctx) =
  # push tail 'goto' jump command and set head 'skip' command. the final steps
  # on initing these are done in finish()
  let cnt = ctx.containerStack[^1]
  cnt.tail = ctx.commandList.len
  ctx.commandList[cnt.head].jump.dst = ctx.commandList.len + 1
  discard ctx.pushCommand Commands.Jump

proc setClip*(ctx: Ctx, rect: Rect) =
  ctx.pushCommand(Commands.Clip).clip.rect = rect

proc drawRect*(ctx: Ctx, rect: Rect, color: Color) =
  let r = rect.intersect ctx.clipStack[^1]
  if r.w > 0 and r.h > 0:
    let cmd = ctx.pushCommand Commands.Rect
    cmd.rect.rect = r
    cmd.rect.color = color

proc drawBox*(ctx: Ctx, rect: Rect, color: Color) =
  ctx.drawRect(rect(rect.x + 1, rect.y, rect.w - 2, 1), color)
  ctx.drawRect(rect(rect.x + 1, rect.y + rect.h - 1, rect.w - 2, 1), color)
  ctx.drawRect(rect(rect.x, rect.y, 1, rect.h), color)
  ctx.drawRect(rect(rect.x + rect.w - 1, rect.y, 1, rect.h), color)

proc drawText*(ctx: Ctx, font: Font, str: string, len: i32, pos: Vec2, color: Color) =
  let
    rect = rect(pos.x, pos.y, ctx.textWidth(font, str, len), ctx.textHeight(font))
    clipped = ctx.checkClip rect
  case clipped
  of Clip.All: return
  of Clip.Part: ctx.setClip ctx.clipStack[^1]
  else: discard
  # add command
  var length =
    if len < 0: i32 str.len
    else: len
  let cmd = ctx.pushCommand Commands.Text

  # add text to buffer
  let start = ctx.stringBuffer.high
  ctx.stringBuffer.add str[0..<length]
  ctx.stringBuffer.add '\0'
  cmd.text.strLoc = i32 start

  cmd.text.pos = pos
  cmd.text.color = color
  cmd.text.font = font
  # reset clipping if it was set
  if clipped != Clip.None:
    ctx.setClip UnclippedRect

proc drawIcon*(ctx: Ctx, id: Icon, rect: Rect, color: Color) =
  # do clip command if the rect isn't fully contained within the cliprect
  let clipped = ctx.checkClip rect
  case clipped
  of Clip.All:
    return
  of Clip.Part:
    ctx.setClip ctx.clipStack[^1]
  else: discard
  # do icon command
  let cmd = ctx.pushCommand Commands.Icon
  cmd.icon.id = id
  cmd.icon.rect = rect
  cmd.icon.color = color
  # reset clipping if it was set
  if clipped != Clip.None:
    ctx.setClip UnclippedRect

proc drawFrame*(ctx: Ctx, rect: Rect, colorId: Colors) = 
  ctx.drawRect(rect, ctx.style.colors[colorId])
  case colorId:
  of Colors.ScrollBase, Colors.ScrollThumb, Colors.TitleBg:
    return
  else: discard
  if ctx.style.colors[Colors.Border].a != 0:
    ctx.drawBox(rect.expand 1, ctx.style.colors[Colors.Border])

proc bringToFront*(ctx: Ctx, cnt: Container) =
  inc ctx.lastZindex
  cnt.zIndex = ctx.lastZindex
