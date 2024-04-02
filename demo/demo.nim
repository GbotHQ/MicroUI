import std/[tables, enumerate, strformat, strutils, colors]
import ../src/microui as ni
import ../src/microui
import microui_renderer as mr
import microui_renderer

var ctx: Ctx

let uiColors: Table[system.cstring, ni.Colors] = {
  cstring "text:": Colors.Text,
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
}.toTable

var
  logBuf: string
  logInputSize = int32 128
  logTmp = cstring newString(128)
  logUpdated = false

proc write(txt: cstring) =
  if logbuf.len > 2048: logbuf.setLen 0
  if logbuf.len > 0: logbuf.add '\n'
  logBuf.add txt
  logUpdated = true

proc logWindow(ctx: Ctx) =
  if not ctx.beginWindow("Log Window", rect(350, 40, 300, 200)):
    return
  # output text panel
  let textBoxWidths = [int32 -1]
  ctx.layoutRow(1, textBoxWidths, -25)
  ctx.beginPanel("Log Output")
  let panel = ctx.getCurrentContainer
  ctx.layoutRow(1, textBoxWidths, -1)
  ctx.text(cstring logBuf)
  ctx.endPanel
  if logUpdated:
    panel.scroll.y = panel.content_size.y
    logUpdated = false

  var submitted = false
  let widths = [int32 -70, -1]
  ctx.layoutRow(2, widths, 0)
  if ctx.textbox(logTmp, logInputSize) == Result.Submit:
    ctx.setFocus(ctx.last_id)
    submitted = true
  if ctx.button("Submit"):
    submitted = true
  if submitted:
    write logTmp
    # clear
    # logTmp = ""
    logTmp[0] = '\0'
    # logTmp = cstring newString(8)

  ctx.endWindow

var
  checks = [int32 1, 0, 1]

var
  bgColR: cfloat = 90
  bgColG: cfloat = 95
  bgColB: cfloat = 100

# proc setComp(x: var float) =
#   x = x + 50

# setComp bgCol[0]

proc testWindow(ctx: Ctx) =
  if not ctx.beginWindow("Test Window", rect(40, 40, 300, 450)):
    return
  let win = ctx.getCurrentContainer
  win.rect.w = max(win.rect.w, 240);
  win.rect.h = max(win.rect.h, 300);

  # window info
  if ctx.header("Window Info"):
    let win = ctx.getCurrentContainer
    let widths = [int32 54, -1]
    ctx.layoutRow(2, widths, 0)
    ctx.label("Position:")
    ctx.label(cstring fmt"{win.rect.x}, {win.rect.y}")
    ctx.label("Size:")
    ctx.text(cstring fmt"{win.rect.w}, {win.rect.h}")
  
  # labels + buttons
  if ctx.header("Test Buttons", Option.Expanded.toSet):
    let widths = [int32 86, -110, -1]
    ctx.layoutRow(3, widths, 0)
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
    if ctx.beginPopup("Test Popup"):
      ctx.button("Hello")
      ctx.button("World")
      ctx.endPopup
  
  # tree
  if ctx.header("Tree and Text", Option.Expanded.toSet):
    ctx.layoutRow(2, [int32 140, -1], 0)
    ctx.layoutBeginColumn
    if ctx.beginTreenode("Test 1"):
      if ctx.beginTreenode("Test 1a"):
        ctx.label("Hello")
        ctx.label("world")
        ctx.endTreenode
      if ctx.beginTreenode("Test 1b"):
        if ctx.button("Button 1"):
          write "Pressed button 1"
        if ctx.button("Button 2"):
          write "Pressed button 2"
        ctx.endTreenode
      ctx.endTreenode
    if ctx.beginTreenode("Test 2"):
      ctx.layoutRow(2, [int32 54, 54], 0)
      if ctx.button("Button 3"):
        write "Pressed button 3"
      if ctx.button("Button 4"):
        write "Pressed button 4"
      if ctx.button("Button 5"):
        write "Pressed button 5"
      if ctx.button("Button 6"):
        write "Pressed button 6"
      ctx.endTreenode
    if ctx.beginTreenode("Test 3"):
      ctx.checkbox("Checkbox 1", checks[0])
      ctx.checkbox("Checkbox 2", checks[1])
      ctx.checkbox("Checkbox 3", checks[2])
      ctx.endTreenode
    ctx.layoutEndColumn

    ctx.layoutBeginColumn
    ctx.layoutRow(1, [int32 -1], 0)
    ctx.text(cstring """Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Maecenas lacinia, sem eu lacinia molestie,
mi risus faucibus ipsum, eu varius magna felis a nulla.""".replace("\n", " "))
    ctx.layoutEndColumn
  
  # background color sliders
  if ctx.header("Background Color", Option.Expanded.toSet):
    ctx.layoutRow(2, [int32 -78, -1], 74)
    # sliders
    ctx.layoutBeginColumn
    ctx.layoutRow(2, [int32 46, -1], 0)
    ctx.label("Red:")
    ctx.slider(bgColR, 0, 255)
    ctx.label("Green:")
    ctx.slider(bgColG, 0, 255)
    ctx.label("Blue:")
    ctx.slider(bgColB, 0, 255)
    ctx.layoutEndColumn

    let r = ctx.layoutNext
    ctx.drawRect(r, color(uint8 bgColR, uint8 bgColG, uint8 bgColB, 255))
    let cstr = cstring $rgb(uint8 bgColR, uint8 bgColG, uint8 bgColB)
    ctx.drawControlText(cstr, r, Colors.Text, Option.Aligncenter.toSet)

  ctx.endWindow

proc uint8Slider(ctx: Ctx, value: ptr uint8, lowVal, highVal: int): bool {.discardable.} =
  ctx.pushId(addr value, value.sizeof.int32)
  var tmp = cfloat value[]
  result = ctx.slider(tmp, cfloat lowVal, cfloat highVal, 0, 0)
  value[] = tmp.uint8
  ctx.popID

proc styleWindow(ctx: Ctx) =
  if not ctx.beginWindow("Style Editor", rect(350, 250, 300, 240)):
    return
  let sw = int32 ctx.getCurrentContainer.body.w.float * 0.14
  let widths = [int32 80, sw, sw, sw, sw, -1]
  ctx.layoutRow(6, widths, 0)

  for i, k, v in enumerate uiColors:
    ctx.label(k)
    let color = addr ctx.style.colors[i]
    for k in [addr color.r, addr color.g, addr color.b, addr color.a]:
      ctx.uint8Slider(k, 0, 255)
    ctx.drawRect(ctx.layoutNext, ctx.style.colors[i])
  ctx.endWindow

proc processFrame(ctx: Ctx) =
  ctx.begin
  ctx.styleWindow
  ctx.logWindow
  ctx.testWindow
  ctx.finish

proc getTextWidth(font: Font; text: cstring; len: int32): int32 =
  var len = len
  if len == -1:
    len = int32 len(text)
  mr.getTextWidth(text, len)

proc getTextHeight(font: Font): int32 =
  mr.getTextHeight()

let buttonMap = {
  GlfwMouseButtonLeft: Mouse.Left,
  GlfwMouseButtonRight: Mouse.Right,
  GlfwMouseButtonMiddle: Mouse.Middle
}.toTable

const keyMap = {
  GlfwKeyLeftShift: Key.Shift,
  GlfwKeyRightShift: Key.Shift,
  GlfwKeyLeftControl: Key.Ctrl,
  GlfwKeyRightControl: Key.Ctrl,
  GlfwKeyLeftAlt: Key.Alt,
  GlfwKeyRightAlt: Key.Alt,
  GlfwKeyEnter: Key.Return,
  GlfwKeyBackspace: Key.Backspace,
}.toTable

proc mouseButtonCb(window: ptr GlfwWindow, button, action, mods: int32) {.cdecl.} =
  if not buttonMap.hasKey(button): return
  let b = buttonMap[button]
  var x, y: cdouble
  window.glfwGetCursorPos(addr x, addr y)
  case action
  of GlfwPress: ctx.inputMouseDown(int32 x, int32 y, b)
  of GlfwRelease: ctx.inputMouseUp(int32 x, int32 y, b)
  else: discard

proc keyPressCb(window: ptr GlfwWindow, key, scancode, action, mods: int32) {.cdecl.} =
  if not keyMap.hasKey(key): return
  let k = keyMap[key]
  case action
  of GlfwPress, GlfwRepeat: ctx.inputKeyDown(k)
  of GlfwRelease: ctx.inputKeyUp(k)
  else: discard

proc scrollCb(window: ptr GlfwWindow, xoffset, yoffset: cdouble) {.cdecl.} =
  ctx.inputScroll(0, int32 (yoffset * -30))

proc cursorPosCb(window: ptr GlfwWindow, xpos, ypos: cdouble) {.cdecl.} =
  ctx.inputMouseMove(int32 xpos, int32 ypos)

proc textCb(window: ptr GlfwWindow, ch: cuint) {.cdecl.} =
  inputText(ctx, cast[cstring](addr ch))

proc main() =
  # init glfw
  assert glfwInit().bool, "Failed to initialize GLFW"
  defer: glfwTerminate()

  glfwWindowHint(GLFW_SRGB_CAPABLE, GLFW_TRUE)
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0)
  # glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
  # glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE)

  var
    width: cint = 800
    height: cint = 600
  
  let window = glfwCreateWindow(width, height, "Microui Demo", nil, nil)
  assert window != nil, "Failed to create GLFW window"

  glfwSwapInterval(1)
  window.glfwMakeContextCurrent

  assert gladLoadGLLoader(cast[Gladloadproc](glfwGetProcAddress)).bool, "Failed to initialize GLAD"

  # init renderer
  mr.init()

  # init microui
  ctx = create CtxBase
  ctx.init
  ctx.textwidth = getTextWidth
  ctx.textheight = getTextHeight

  # handle input
  discard (
    window.glfwSetKeyCallback(cast[GLFWkeyfun](keyPressCb)),
    window.glfwSetMouseButtonCallback(cast[GLFWmousebuttonfun](mouseButtonCb)),
    window.glfwSetScrollCallback(cast[GLFWscrollfun](scrollCb)),
    window.glfwSetCursorPosCallback(cast[GLFWcursorposfun](cursorPosCb)),
    window.glfwSetCharCallback(cast[GLFWcharfun](textCb))
  )

  # main loop
  while not window.glfwWindowShouldClose.bool:
    glfwPollEvents()
    window.glfwGetFramebufferSize(addr width, addr height)

    # process frame
    ctx.processFrame

    # render
    mr.clear(color(uint8 bgColR, uint8 bgColG, uint8 bgColB, 255), width, height)
    let cmd: Command = nil
    while ctx.nextCommand(addr cmd):
      case cmd.typefield.Commands
      of Commands.Text: mr.drawText(cast[cstring](addr cmd.text.str), cmd.text.pos, cmd.text.color)
      of Commands.Rect: mr.drawRect(cmd.rect.rect, cmd.rect.color)
      of Commands.Icon: mr.drawIcon(cmd.icon.id, cmd.icon.rect, cmd.icon.color)
      of Commands.Clip: mr.setClipRect(cmd.clip.rect)
      else: discard

    mr.present()
    window.glfwSwapBuffers

main()
