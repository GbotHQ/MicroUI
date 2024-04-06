import std/[math, tables, typetraits, enumerate]
import ../src/microui
import bmp as bmp


# no idea if this define works
{.emit: "#define GLFW_INCLUDE_NONE".}

when defined(useFuthark):
  import futhark, os
  const srcDir = currentSourcePath.parentDir

  importc:
    outputPath srcDir / "glad.nim"
    path "glad/include/glad"
    "glad.h"

  importc:
    outputPath srcDir / "glfw3.nim"
    path "/usr/local/include/GLFW"
    "glfw3.h"
else:
  include "glad.nim"
  include "glfw3.nim"


# compile C dependencies
{.compile: "demo/glad/src/glad.c".}
{.passC: "-I demo/glad/include".}
{.passC: gorge("pkg-config --cflags glfw3").}

{.passl: gorge("pkg-config --static --libs glfw3").}


type
  Atlas {.pure, size: sizeof(int32).} = enum
    White = Icon.enumLen
    Font
  
  f32 = float32
  
const AtlasWidth* = 128'i32
const AtlasHeight* = 128'i32
const AtlasSize* = AtlasWidth * AtlasHeight

let atlasTexture* = bmp.read("demo/atlas.bmp", grayscale = true)

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


const BufferSize = int32 2 ^ 14

var
  texBuf: array[BufferSize * 8, f32]
  vertBuf: array[BufferSize * 8, f32]
  colorBuf: array[BufferSize * 16, GLubyte]
  indexBuf: array[BufferSize * 6, GLuint]
  
  width: int32
  height: int32
  bufIdx: int32

proc init*() =
  # Initialize GL
  gladglEnable(GlBlend)
  gladglBlendFunc(GlSrcAlpha, GlOneMinusSrcAlpha)
  gladglDisable(GlCullFace)
  gladglDisable(GlDepthTest)
  gladglEnable(GlScissorTest)
  gladglEnable(GlTexture2D)
  gladglEnableClientState(GlVertexArray)
  gladglEnableClientState(GlTextureCoordArray)
  gladglEnableClientState(GlColorArray)
  
  # Initialize texture
  var textureId: uint32
  gladglGenTextures(1, addr textureId)
  gladglBindTexture(GlTexture2D, textureId)
  gladglTexImage2D(
    GlTexture2D, 0, GlAlpha, AtlasWidth, AtlasHeight,
    0, GlAlpha, GlUnsignedByte, addr atlasTexture[0]
  )
  gladglTexParameteri(GlTexture2D, GlTextureMinFilter, GlNearest)
  gladglTexParameteri(GlTexture2D, GlTextureMagFilter, GlNearest)
  assert gladglGetError() == 0

proc flush(): void =
  if bufIdx == 0:
    return

  gladglViewport(0, 0, width, height)
  gladglMatrixMode(GlProjection)
  gladglPushMatrix()
  gladglLoadIdentity()
  gladglOrtho(
    0'f64, width.float64, height.float64, 0'f64, -1'f64, 1'f64
  )
  gladglMatrixMode(GlModelview)
  gladglPushMatrix()
  gladglLoadIdentity()

  gladglTexCoordPointer(2, GlFloat, 0, addr texBuf[0])
  gladglVertexPointer(2, GlFloat, 0, addr vertBuf[0])
  gladglColorPointer(4, GlUnsignedByte, 0, addr colorBuf[0])
  gladglDrawElements(GlTriangles, bufIdx * 6, GlUnsignedInt, addr indexBuf[0])

  gladglMatrixMode(GlModelview)
  gladglPopMatrix()
  gladglMatrixMode(GlProjection)
  gladglPopMatrix()

  bufIdx = 0

proc pushQuad(dst: Rect, src: Rect, color: Color) =
  if bufIdx == BufferSize:
    flush()

  let texVertIdx = bufIdx * 8
  let colorIdx = bufIdx * 16
  let elementIdx = uint32 bufIdx * 4
  let indexIdx = bufIdx * 6
  inc bufIdx

  # update texture buffer
  let x = src.x.f32 / AtlasWidth.f32
  let y = src.y.f32 / AtlasHeight.f32
  let w = src.w.f32 / AtlasWidth.f32
  let h = src.h.f32 / AtlasHeight.f32
  for i, k in enumerate([
    x, y, x + w, y, x, y + h, x + w, y + h
  ]):
    texBuf[texVertIdx + i.int32] = k

  # update vertex buffer
  for i, k in enumerate([
    dst.x, dst.y, dst.x + dst.w, dst.y, dst.x,
    dst.y + dst.h, dst.x + dst.w, dst.y + dst.h
  ]):
    vertBuf[texVertIdx + i.int32] = k.f32

  # update color buffer
  for k in [0, 4, 8, 12]:
    colorBuf[colorIdx + k..<colorIdx + k + 4] = [color.r, color.g, color.b, color.a]

  # update index buffer
  for i, k in enumerate([
    uint32 0, 1, 2, 2, 3, 1
  ]):
    indexBuf[indexIdx + i.int32] = elementIdx + k

proc drawRect*(rect: Rect, color: Color) =
  pushQuad(rect, atlasRects[Atlas.White.int32], color)

proc drawText*(text: cstring, pos: Vec2, color: Color) =
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

proc drawIcon*(id: cint, rect: Rect, color: Color) =
  let srcRect = atlasRects[id]
  let x = rect.x + (rect.w - srcRect.w) div 2
  let y = rect.y + (rect.h - srcRect.h) div 2
  pushQuad(rect(x, y, srcRect.w, srcRect.h), srcRect, color)

proc getTextWidth*(text: cstring, len: cint): cint =
  for i in 0..<min(text.len, len):
    if (text[i].uint8 and 0xc0) == 0x80:
      continue
    let idx = Atlas.Font.int32 + min(text[i].uint8, 127).int32
    if idx in atlasRects:
      result += atlasRects[idx].w

proc getTextHeight*(): cint =
  18

proc setClipRect*(rect: Rect) =
  flush()
  gladGlScissor(
    rect.x.int32, height - rect.y.int32 - rect.h.int32,
    rect.w.int32, rect.h.int32
  )

proc clear*(color: Color, w, h: cint) =
  width = w
  height = h
  flush()
  gladGlScissor(
    0, 0,
    width, height
  )
  gladGlClearColor(
    color.r.f32 / 255,
    color.g.f32 / 255,
    color.b.f32 / 255,
    color.a.f32 / 255
  )
  gladGlClear(GlColorBufferBit)

proc present*() =
  flush()
