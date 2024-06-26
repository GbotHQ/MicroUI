import
  tables,
  strformat,
  strutils,
  colors,
  ../../src/microui,
  ../../src/managers,
  microui_renderer as mr,
  microui_renderer

var ctx: Ctx

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
  if not buttonMap.hasKey button: return
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
  ctx.inputScroll(0, yoffset.int32 * -15)

proc cursorPosCb(window: ptr GlfwWindow, xpos, ypos: cdouble) {.cdecl.} =
  ctx.inputMouseMove(int32 xpos, int32 ypos)

proc textCb(window: ptr GlfwWindow, ch: cuint) {.cdecl.} =
  inputText(ctx, $cast[cstring](addr ch))

var
  window: ptr GlfwWindow
  width = 800'i32
  height = 600'i32

proc initGlfw() =
  assert glfwInit().bool, "Failed to initialize GLFW"

  glfwWindowHint(GLFW_SRGB_CAPABLE, GLFW_TRUE)
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0)
  
  window = glfwCreateWindow(width, height, "Microui Demo", nil, nil)
  assert window != nil, "Failed to create GLFW window"

  glfwSwapInterval(1)
  window.glfwMakeContextCurrent

  assert gladLoadGLLoader(cast[Gladloadproc](glfwGetProcAddress)).bool, "Failed to initialize GLAD"

proc frame() =
  ctx.processFrame

  # render
  mr.clear(color(uint8 bgColR, uint8 bgColG, uint8 bgColB, 255), width, height)
  for cmd in ctx.iterCommands:
    case cmd.typ
    of Commands.Text: mr.drawText(ctx.getStr cmd.text, cmd.text.pos, cmd.text.color)
    of Commands.Rect: mr.drawRect(cmd.rect.rect, cmd.rect.color)
    of Commands.Icon: mr.drawIcon(ctx.getStr cmd.icon, cmd.icon.rect, cmd.icon.color)
    of Commands.Clip: mr.setClipRect(cmd.clip.rect)
    else: discard

  mr.present()
  window.glfwSwapBuffers
  glfwPollEvents()
  window.glfwGetFramebufferSize(addr width, addr height)

proc main() =
  initGlfw()
  defer: glfwTerminate()

  # init renderer
  mr.init()

  # init microui
  ctx = initCtx()
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
    frame()

main()
