import
  math,
  tables,
  typetraits,
  ../../src/microui as mu,
  bmp
import sokol/[
  log as slog,
  app as sapp,
  gfx as sg,
  glue as sglue,
  gl as sgl,
]

type
  Icon* {.pure.} = enum
    None
    Close
    Check
    Collapsed
    Expanded

  Atlas {.pure, size: sizeof(int32).} = enum
    White = Icon.enumLen
    Font
  
  f32 = float32
  
const
  AtlasWidth* = 128'i32
  AtlasHeight* = 128'i32
  AtlasSize* = AtlasWidth * AtlasHeight

let atlasTexture* = bmp.read("demo/sokol/atlas.bmp", grayscale = true)

# font character bounding boxes
const atlasRects* = {
  Icon.Close.int32: rect(88, 68, 16, 16),
  Icon.Check.int32: rect(0, 0, 18, 18),
  Icon.Expanded.int32: rect(118, 68, 7, 5),
  Icon.Collapsed.int32: rect(113, 68, 5, 7),
  Atlas.White.int32: rect(125, 68, 3, 3),
  Atlas.Font.int32+32: rect(84, 68, 2, 17),
  Atlas.Font.int32+33: rect(39, 68, 3, 17),
  Atlas.Font.int32+34: rect(114, 51, 5, 17),
  Atlas.Font.int32+35: rect(34, 17, 7, 17),
  Atlas.Font.int32+36: rect(28, 34, 6, 17),
  Atlas.Font.int32+37: rect(58, 0, 9, 17),
  Atlas.Font.int32+38: rect(103, 0, 8, 17),
  Atlas.Font.int32+39: rect(86, 68, 2, 17),
  Atlas.Font.int32+40: rect(42, 68, 3, 17),
  Atlas.Font.int32+41: rect(45, 68, 3, 17),
  Atlas.Font.int32+42: rect(34, 34, 6, 17),
  Atlas.Font.int32+43: rect(40, 34, 6, 17),
  Atlas.Font.int32+44: rect(48, 68, 3, 17),
  Atlas.Font.int32+45: rect(51, 68, 3, 17),
  Atlas.Font.int32+46: rect(54, 68, 3, 17),
  Atlas.Font.int32+47: rect(124, 34, 4, 17),
  Atlas.Font.int32+48: rect(46, 34, 6, 17),
  Atlas.Font.int32+49: rect(52, 34, 6, 17),
  Atlas.Font.int32+50: rect(58, 34, 6, 17),
  Atlas.Font.int32+51: rect(64, 34, 6, 17),
  Atlas.Font.int32+52: rect(70, 34, 6, 17),
  Atlas.Font.int32+53: rect(76, 34, 6, 17),
  Atlas.Font.int32+54: rect(82, 34, 6, 17),
  Atlas.Font.int32+55: rect(88, 34, 6, 17),
  Atlas.Font.int32+56: rect(94, 34, 6, 17),
  Atlas.Font.int32+57: rect(100, 34, 6, 17),
  Atlas.Font.int32+58: rect(57, 68, 3, 17),
  Atlas.Font.int32+59: rect(60, 68, 3, 17),
  Atlas.Font.int32+60: rect(106, 34, 6, 17),
  Atlas.Font.int32+61: rect(112, 34, 6, 17),
  Atlas.Font.int32+62: rect(118, 34, 6, 17),
  Atlas.Font.int32+63: rect(119, 51, 5, 17),
  Atlas.Font.int32+64: rect(18, 0, 10, 17),
  Atlas.Font.int32+65: rect(41, 17, 7, 17),
  Atlas.Font.int32+66: rect(48, 17, 7, 17),
  Atlas.Font.int32+67: rect(55, 17, 7, 17),
  Atlas.Font.int32+68: rect(111, 0, 8, 17),
  Atlas.Font.int32+69: rect(0, 35, 6, 17),
  Atlas.Font.int32+70: rect(6, 35, 6, 17),
  Atlas.Font.int32+71: rect(119, 0, 8, 17),
  Atlas.Font.int32+72: rect(18, 17, 8, 17),
  Atlas.Font.int32+73: rect(63, 68, 3, 17),
  Atlas.Font.int32+74: rect(66, 68, 3, 17),
  Atlas.Font.int32+75: rect(62, 17, 7, 17),
  Atlas.Font.int32+76: rect(12, 51, 6, 17),
  Atlas.Font.int32+77: rect(28, 0, 10, 17),
  Atlas.Font.int32+78: rect(67, 0, 9, 17),
  Atlas.Font.int32+79: rect(76, 0, 9, 17),
  Atlas.Font.int32+80: rect(69, 17, 7, 17),
  Atlas.Font.int32+81: rect(85, 0, 9, 17),
  Atlas.Font.int32+82: rect(76, 17, 7, 17),
  Atlas.Font.int32+83: rect(18, 51, 6, 17),
  Atlas.Font.int32+84: rect(24, 51, 6, 17),
  Atlas.Font.int32+85: rect(26, 17, 8, 17),
  Atlas.Font.int32+86: rect(83, 17, 7, 17),
  Atlas.Font.int32+87: rect(38, 0, 10, 17),
  Atlas.Font.int32+88: rect(90, 17, 7, 17),
  Atlas.Font.int32+89: rect(30, 51, 6, 17),
  Atlas.Font.int32+90: rect(36, 51, 6, 17),
  Atlas.Font.int32+91: rect(69, 68, 3, 17),
  Atlas.Font.int32+92: rect(124, 51, 4, 17),
  Atlas.Font.int32+93: rect(72, 68, 3, 17),
  Atlas.Font.int32+94: rect(42, 51, 6, 17),
  Atlas.Font.int32+95: rect(15, 68, 4, 17),
  Atlas.Font.int32+96: rect(48, 51, 6, 17),
  Atlas.Font.int32+97: rect(54, 51, 6, 17),
  Atlas.Font.int32+98: rect(97, 17, 7, 17),
  Atlas.Font.int32+99: rect(0, 52, 5, 17),
  Atlas.Font.int32+100: rect(104, 17, 7, 17),
  Atlas.Font.int32+101: rect(60, 51, 6, 17),
  Atlas.Font.int32+102: rect(19, 68, 4, 17),
  Atlas.Font.int32+103: rect(66, 51, 6, 17),
  Atlas.Font.int32+104: rect(111, 17, 7, 17),
  Atlas.Font.int32+105: rect(75, 68, 3, 17),
  Atlas.Font.int32+106: rect(78, 68, 3, 17),
  Atlas.Font.int32+107: rect(72, 51, 6, 17),
  Atlas.Font.int32+108: rect(81, 68, 3, 17),
  Atlas.Font.int32+109: rect(48, 0, 10, 17),
  Atlas.Font.int32+110: rect(118, 17, 7, 17),
  Atlas.Font.int32+111: rect(0, 18, 7, 17),
  Atlas.Font.int32+112: rect(7, 18, 7, 17),
  Atlas.Font.int32+113: rect(14, 34, 7, 17),
  Atlas.Font.int32+114: rect(23, 68, 4, 17),
  Atlas.Font.int32+115: rect(5, 52, 5, 17),
  Atlas.Font.int32+116: rect(27, 68, 4, 17),
  Atlas.Font.int32+117: rect(21, 34, 7, 17),
  Atlas.Font.int32+118: rect(78, 51, 6, 17),
  Atlas.Font.int32+119: rect(94, 0, 9, 17),
  Atlas.Font.int32+120: rect(84, 51, 6, 17),
  Atlas.Font.int32+121: rect(90, 51, 6, 17),
  Atlas.Font.int32+122: rect(10, 68, 5, 17),
  Atlas.Font.int32+123: rect(31, 68, 4, 17),
  Atlas.Font.int32+124: rect(96, 51, 6, 17),
  Atlas.Font.int32+125: rect(35, 68, 4, 17),
  Atlas.Font.int32+126: rect(102, 51, 6, 17),
  Atlas.Font.int32+127: rect(108, 51, 6, 17),
}.toTable

var
  pip: sgl.Pipeline
  atlasTex: sg.Image
  atlasSmp: sg.Sampler

proc init*() =
  var pixels: array[AtlasSize, uint32]
  for i in 0..<AtlasSize:
    pixels[i] = cast[uint32]([255'u8, 255, 255, atlasTexture[i]])
  
  atlasTex = sg.makeImage(sg.ImageDesc(
    width: AtlasWidth,
    height: AtlasHeight,
    data: sg.ImageData(
      subimage: [[sg.Range(addr: addr pixels, size: sizeof pixels)]]
    )
  ))
  atlasSmp = sg.makeSampler(sg.SamplerDesc(
    minFilter: sg.filterNearest,
    magFilter: sg.filterNearest,
  ))

  pip = sgl.makePipeline(sg.PipelineDesc(
    colors: [sg.ColorTargetState(
      blend: sg.BlendState(
        enabled: true,
        srcFactorRgb: sg.blendFactorSrcAlpha,
        dstFactorRgb: sg.blendFactorOneMinusSrcAlpha,
      )
    )]
  ))

proc begin*() =
  sgl.defaults()
  sgl.pushPipeline()
  sgl.loadPipeline(pip)
  sgl.enableTexture()
  sgl.texture(atlasTex, atlasSmp)
  sgl.matrixModeProjection()
  sgl.pushMatrix()
  sgl.ortho(0, sapp.widthf(), sapp.heightf(), 0, -1, 1)
  sgl.beginQuads()

proc finish*() =
  sgl.end()
  sgl.popMatrix()
  sgl.popPipeline()

proc pushQuad(dst: Rect, src: Rect, color: mu.Color) =
  let
    u0 = f32 src.l / AtlasWidth
    v0 = f32 src.t / AtlasHeight
    u1 = f32 src.r / AtlasWidth
    v1 = f32 src.b / AtlasHeight
    
    x0 = f32 dst.l
    y0 = f32 dst.t
    x1 = f32 dst.r
    y1 = f32 dst.b

  sgl.c4b(color.r, color.g, color.b, color.a)
  sgl.v2fT2f(x0, y0, u0, v0)
  sgl.v2fT2f(x1, y0, u1, v0)
  sgl.v2fT2f(x1, y1, u1, v1)
  sgl.v2fT2f(x0, y1, u0, v1)

proc drawRect*(rect: Rect, color: mu.Color) =
  pushQuad(rect, atlasRects[Atlas.White.int32], color)

proc drawText*(text: string, pos: Vec2, color: mu.Color) =
  var dst = rect(pos.x, pos.y, 0, 0)
  for p in text:
    if (p.uint8 and 0xc0) == 0x80:
      continue
    let idx = Atlas.Font.int32 + min(p.uint8, 127).int32
    let src =
      if idx in atlasRects:
        atlasRects[idx]
      else:
        rect(0, 0, 0, 0)
    dst.w = src.w
    dst.h = src.h
    pushQuad(dst, src, color)
    dst.x += dst.w

proc drawIcon*(icon: string, rect: Rect, color: mu.Color) =
  let id =
    case icon
    of "close-button": Icon.Close
    of "checkbox-checked": Icon.Check
    of "header-collapsed": Icon.Collapsed
    of "header-expanded": Icon.Expanded
    else: Icon.None
  let
    srcRect = atlasRects[id.int32]
    x = rect.x + (rect.w - srcRect.w) div 2
    y = rect.y + (rect.h - srcRect.h) div 2
  pushQuad(rect(x, y, srcRect.w, srcRect.h), srcRect, color)

proc getTextWidth*(text: string, len: int32): int32 =
  for i in 0..<min(text.len, len):
    # skip UTF-8 continuation bytes
    if (text[i].uint8 and 0xc0) == 0x80:
      continue
    let idx = Atlas.Font.int32 + min(text[i].uint8, 127).int32
    if idx in atlasRects:
      result += atlasRects[idx].w

proc getTextHeight*(): int32 =
  18

proc setClipRect*(rect: Rect) =
  sgl.end()
  sgl.scissorRect(rect.x, rect.y, rect.w, rect.h, true)
  sgl.beginQuads()
