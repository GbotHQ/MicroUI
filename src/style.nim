import
  shapes,
  enums,
  type_shorthands

type
  Font* = pointer

  Style* = object
    font*: Font
    size*: Vec2
    padding*: i32
    spacing*: i32
    indent*: i32
    titleHeight*: i32
    scrollbarSize*: i32
    thumbSize*: i32
    colors*: array[Colors, Color]

const defaultStyle* =
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