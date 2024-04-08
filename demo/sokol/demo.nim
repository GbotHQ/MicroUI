import
  tables,
  strformat,
  strutils,
  colors,
  unicode,
  ../../src/microui,
  ../../src/managers,
  microui_renderer as mr,
  microui_renderer
import sokol/[
  log as slog,
  app as sapp,
  gfx as sg,
  glue as sglue,
  gl as sgl,
]

var ctx: Ctx

var passAction = PassAction(
  colors: [ ColorAttachmentAction( loadAction: loadActionClear, clearValue: (0, 0, 0, 1)) ]
)

let uiColors = {
  "text:": Colors.Text,
  "border:": Colors.Border,
  "windowbg:": Colors.Windowbg,
  "titlebg:": Colors.Titlebg,
  "titletext:": Colors.Titletext,
  "panelbg:": Colors.Panelbg,
  "button:": Colors.Button,
  "buttonhover:": Colors.Buttonhover,
  "buttonfocus:": Colors.Buttonfocus,
  "base:": Colors.Base,
  "basehover:": Colors.Basehover,
  "basefocus:": Colors.Basefocus,
  "scrollbase:": Colors.Scrollbase,
  "scrollthumb:": Colors.Scrollthumb
}.toOrderedTable

var
  logBuf = newStringOfCap(128)
  logTmp = newStringOfCap(128)
  logUpdated = false

proc write(txt: string) =
  if logbuf.len > 2048: logbuf.setLen 0
  if logbuf.len > 0: logbuf.add '\n'
  logBuf.add txt
  logUpdated = true

proc logWindow(ctx: Ctx) =
  ctx.windowWithDefer("Log Window", rect(350, 40, 300, 200))
  # output text panel
  ctx.layoutRow(1, [int32 -1], -25)
  ctx.beginPanel("Log Output")
  let panel = ctx.containerStack[^1]
  ctx.layoutRow(1, [int32 -1], -1)
  ctx.text(logBuf)
  ctx.endPanel
  if logUpdated:
    panel.scroll.y = panel.content_size.y
    logUpdated = false

  var submitted = false
  ctx.layoutRow(2, [int32 -70, -1], 0)
  if ctx.textbox(logTmp, 128) == Result.Submit:
    ctx.setFocus(ctx.last_id)
    submitted = true
  if ctx.button("Submit"):
    submitted = true
  if submitted:
    write logTmp
    logTmp.setLen 0

var
  checks = [int32 1, 0, 1]

  bgColR = 90'f32
  bgColG = 95'f32
  bgColB = 100'f32

proc testWindow(ctx: Ctx) =
  ctx.windowWithDefer("Test Window", rect(40, 40, 300, 450))
  let win = ctx.containerStack[^1]
  win.rect.w = max(win.rect.w, 240)
  win.rect.h = max(win.rect.h, 300)

  # window info
  if ctx.header("Window Info"):
    let win = ctx.containerStack[^1]
    ctx.layoutRow(2, [int32 54, -1], 0)
    ctx.label("Position:")
    ctx.label(fmt"{win.rect.x}, {win.rect.y}")
    ctx.label("Size:")
    ctx.text(fmt"{win.rect.w}, {win.rect.h}")
  
  # labels + buttons
  if ctx.header("Test Buttons", Option.Expanded.toSet).bool:
    ctx.layoutRow(3, [int32 86, -110, -1], 0)
    ctx.label("Test buttons 1:")
    if ctx.button("Button 1"):
      write "Pressed button 1"
    if ctx.button("Button 2"):
      write "Pressed button 2"
    ctx.label("Test buttons 2:")
    if ctx.button("Button 3"):
      write "Pressed button 3"
    if ctx.button("Popup"):
      ctx.openPopup("Test Popup")
    ctx.popup("Test Popup"):
      ctx.button("Hello")
      ctx.button("World")
  
  # tree
  if ctx.header("Tree and Text", Option.Expanded.toSet):
    ctx.layoutRow(2, [int32 140, -1], 0)
    ctx.column:
      ctx.treenode("Test 1"):
        ctx.treenode("Test 1a"):
          ctx.label("Hello")
          ctx.label("world")
        ctx.treenode("Test 1b"):
          if ctx.button("Button 1"):
            write "Pressed button 1"
          if ctx.button("Button 2"):
            write "Pressed button 2"
      ctx.treenode("Test 2"):
        ctx.layoutRow(2, [int32 54, 54], 0)
        if ctx.button("Button 3"):
          write "Pressed button 3"
        if ctx.button("Button 4"):
          write "Pressed button 4"
        if ctx.button("Button 5"):
          write "Pressed button 5"
        if ctx.button("Button 6"):
          write "Pressed button 6"
      ctx.treenode("Test 3"):
        ctx.checkbox("Checkbox 1", checks[0])
        ctx.checkbox("Checkbox 2", checks[1])
        ctx.checkbox("Checkbox 3", checks[2])

    ctx.column:
      ctx.layoutRow(1, [int32 -1], 0)
      ctx.text("""Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Maecenas lacinia, sem eu lacinia molestie,
mi risus faucibus ipsum, eu varius magna felis a nulla.""".replace("\n", " "))
  
  # background color sliders
  if ctx.header("Background Color", Option.Expanded.toSet):
    ctx.layoutRow(2, [int32 -78, -1], 74)
    # sliders
    ctx.column:
      ctx.layoutRow(2, [int32 46, -1], 0)
      ctx.label("Red:")
      ctx.slider(bgColR, 0, 255)
      ctx.label("Green:")
      ctx.slider(bgColG, 0, 255)
      ctx.label("Blue:")
      ctx.slider(bgColB, 0, 255)

    let r = ctx.layoutNext
    ctx.drawRect(r, color(uint8 bgColR, uint8 bgColG, uint8 bgColB, 255))
    let str = $rgb(uint8 bgColR, uint8 bgColG, uint8 bgColB)
    ctx.drawControlText(str, r, Colors.Text, Option.Aligncenter.toSet)

proc uint8Slider(ctx: Ctx, value: ptr uint8, lowVal, highVal: int): bool {.discardable.} =
  ctx.idStack.add ctx.getId(addr value)
  var tmp = float32 value[]
  result = ctx.slider(tmp, float32 lowVal, float32 highVal, 0, 0)
  value[] = tmp.uint8
  ctx.idStack.rm

proc styleWindow(ctx: Ctx) =
  ctx.windowWithDefer("Style Editor", rect(350, 250, 300, 240))
  let sw = int32 ctx.containerStack[^1].body.w.float * 0.14
  ctx.layoutRow(6, [int32 80, sw, sw, sw, sw, -1], 0)

  for k, v in uiColors:
    ctx.label(k)
    let color = addr ctx.style.colors[v]
    for k in [addr color.r, addr color.g, addr color.b, addr color.a]:
      ctx.uint8Slider(k, 0, 255)
    ctx.drawRect(ctx.layoutNext, ctx.style.colors[v])

proc processFrame(ctx: Ctx) =
  ctx.begin
  ctx.styleWindow
  ctx.logWindow
  ctx.testWindow
  ctx.finish

proc getTextWidth(font: Font, text: string, len: int32): int32 =
  mr.getTextWidth(
    text,
    if len == -1: int32 text.len
    else: len
  )

proc getTextHeight(font: Font): int32 =
  mr.getTextHeight()

const buttonMap = {
  mouseButtonLeft: Mouse.Left,
  mouseButtonRight: Mouse.Right,
  mouseButtonMiddle: Mouse.Middle
}.toTable

const keyMap = {
  keyCodeLeftShift: Key.Shift,
  keyCodeRightShift: Key.Shift,
  keyCodeLeftControl: Key.Ctrl,
  keyCodeRightControl: Key.Ctrl,
  keyCodeLeftAlt: Key.Alt,
  keyCodeRightAlt: Key.Alt,
  keyCodeEnter: Key.Return,
  keyCodeBackspace: Key.Backspace,
}.toTable

proc event(ev: ptr sapp.Event) {.cdecl.} =
  case ev.type
  # mouse
  of sapp.eventTypeMouseDown, sapp.eventTypeMouseUp:
    if buttonMap.hasKey ev.mouseButton:
      let button = buttonMap[ev.mouseButton]
      case ev.type
      of sapp.eventTypeMouseDown:
        ctx.inputMouseDown(int32 ev.mouseX, int32 ev.mouseY, button)
      of sapp.eventTypeMouseUp:
        ctx.inputMouseUp(int32 ev.mouseX, int32 ev.mouseY, button)
      else: discard
  
  of sapp.eventTypeMouseMove:
    ctx.inputMouseMove(int32 ev.mouseX, int32 ev.mouseY)
  
  of sapp.eventTypeMouseScroll:
    ctx.inputScroll(0, ev.scrollY.int32 * -30)
  
  # keyboard
  of sapp.eventTypeKeyDown, sapp.eventTypeKeyUp:
    if keyMap.hasKey ev.keyCode:
      let key = keyMap[ev.keyCode]
      case ev.type
      of sapp.eventTypeKeyDown:
        ctx.inputKeyDown(key)
      of sapp.eventTypeKeyUp:
        ctx.inputKeyUp(key)
      else: discard
  of sapp.eventTypeChar:
    let utf8 = $ev.charCode.Rune
    if utf8 != "\b":
      inputText(ctx, utf8)
  else: discard

proc init() {.cdecl.} =
  sg.setup(sg.Desc(
    environment: sglue.environment(),
    logger: sg.Logger(fn: slog.fn),
  ))
  
  sgl.setup(sgl.Desc(
    logger: sgl.Logger(fn: slog.fn)
  ))

  # init renderer
  mr.init()

  # init microui
  ctx = initCtx()
  ctx.textwidth = getTextWidth
  ctx.textheight = getTextHeight

  # handle input

proc frame() {.cdecl.} =
  # process frame
  ctx.processFrame

  # render
  let clearCol = addr passAction.colors[0].clearValue
  clearCol.r = float32 bgColR / 255
  clearCol.g = float32 bgColG / 255
  clearCol.b = float32 bgColB / 255
  
  mr.begin()
  for cmd in ctx.iterCommands:
    case cmd.typ
    of Commands.Text: mr.drawText(ctx.getStr cmd.text, cmd.text.pos, cmd.text.color)
    of Commands.Rect: mr.drawRect(cmd.rect.rect, cmd.rect.color)
    of Commands.Icon: mr.drawIcon(ctx.getStr cmd.icon, cmd.icon.rect, cmd.icon.color)
    of Commands.Clip: mr.setClipRect(cmd.clip.rect)
    else: discard
  mr.finish()

  sg.beginPass(Pass(action: passAction, swapchain: sglue.swapchain()))
  sgl.draw()
  sg.endPass()
  sg.commit()
  

proc cleanup() {.cdecl.} =
  sgl.shutdown()
  sg.shutdown()

sapp.run(sapp.Desc(
  initCb: init,
  frameCb: frame,
  cleanupCb: cleanup,
  eventCb: event,
  width: 800,
  height: 600,
  sampleCount: 4,
  windowTitle: "Microui Demo",
  icon: IconDesc(sokol_default: true),
  logger: sapp.Logger(fn: slog.fn)
))
