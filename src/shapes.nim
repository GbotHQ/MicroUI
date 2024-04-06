import type_shorthands

type
  Vec2* = object
    x*, y*: i32
  Rect* = object
    x*, y*, w*, h*: i32
  Color* = object
    r*, g*, b*, a*: u8

proc l*(rect: Rect): i32 = rect.x
proc t*(rect: Rect): i32 = rect.y
proc r*(rect: Rect): i32 = rect.x + rect.w
proc b*(rect: Rect): i32 = rect.y + rect.h

proc vec2*(x, y: i32): Vec2 =
  result.x = x
  result.y = y

proc rect*(x, y, w, h: i32): Rect =
  result.x = x
  result.y = y
  result.w = w
  result.h = h

const UnclippedRect* = rect(0, 0, i32.high, i32.high)

proc color*(r, g, b, a: u8): Color =
  result.r = r
  result.g = g
  result.b = b
  result.a = a

proc expand*(rect: Rect, n: i32): Rect =
  rect(
    rect.x - n,
    rect.y - n,
    rect.w + n * 2,
    rect.h + n * 2,
  )

proc intersect*(r1: Rect, r2: Rect): Rect =
  let
    l = max(r1.l, r2.l)
    t = max(r1.t, r2.t)
    r = min(r1.r, r2.r)
    b = min(r1.b, r2.b)
    
    x = max(r, l)
    y = max(b, t)
  
  rect(l, t, x - l, y - t)

proc overlapsPos*(r: Rect, p: Vec2): bool =
  p.x >= r.l and
  p.x < r.r and
  p.y >= r.t and
  p.y < r.b

proc remap*(value, low1, high1, low2, high2: f32): f32 =
  ## Remap value from [low1, high1] to [low2, high2]
  low2 + (value - low1) * (high2 - low2) / (high1 - low1)
