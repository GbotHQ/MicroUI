type
  Clip* {.pure.} = enum
    None
    Part
    All
  
  LayoutType* {.pure.} = enum
    None
    Absolute
    Relative

  Commands* {.pure.} = enum
    None
    Jump
    Clip
    Rect
    Text
    Icon
  
  Colors* {.pure.} = enum
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
  
  Icon* {.pure.} = enum
    None
    Close
    Check
    Collapsed
    Expanded

  Result* {.pure.} = enum
    Active
    Submit
    Change

  Option* {.pure.} = enum
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
  
  OptionSet* = set[Option]

  Mouse* {.pure.} = enum
    Left
    Right
    Middle
  
  MouseSet* = set[Mouse]

  Key* {.pure.} = enum
    Shift
    Ctrl
    Alt
    Backspace
    Return
  
  KeySet* = set[Key]

template defineSetConverters(T: typedesc) =
  converter toSet*(opt: T): set[T] =
    {opt}

defineSetConverters Option
defineSetConverters Mouse
defineSetConverters Key
