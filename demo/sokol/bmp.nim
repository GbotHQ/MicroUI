import endians

const headerSize = 54'u32

proc encode*(img: openArray[byte], width, height: uint32): seq[byte] =
  let
    # image data
    channels = img.len.uint32 div (width * height)
    byteWidth = width * 3
    paddedByteWidth = byteWidth + (3 - (byteWidth - 1) mod 4)

    # header data
    magic = 0x4D42'u16
    pixelSize = paddedByteWidth * height
    bmpSize = pixelSize + headerSize
    dataOffset = 40'u32
    colorPlanes = 0x0001'u16
    bitsPerPixel = 24'u16
    compression = 0'u32
  
  assert img.len == int width * height * channels, "img.len must be width * height * channels"
  
  var
    output = newSeq[byte](bmpSize)
    idx = 0

  proc cp(a: uint32) =
    littleEndian32(addr output[idx], addr a)
    idx += 4

  proc cp(a: uint16) =
    littleEndian16(addr output[idx], addr a)
    idx += 2

  # header
  cp magic
  cp bmpSize
  idx += 4
  cp headerSize
  cp dataOffset
  cp width
  cp height
  cp colorPlanes
  cp bitsPerPixel
  cp compression
  cp pixelSize

  # image
  case channels
  of 1:
    for i in 0..<height:
      for j in 0..<width:
        for k in 0..<3'u32:
          output[headerSize + i * paddedByteWidth + j * 3 + k] =
            img[(height - i - 1) * width + j]
  of 3:
    for i in 0..<height:
      let dst = i * paddedByteWidth
      let src = (height - i - 1) * byteWidth
      output[headerSize + dst..<headerSize + dst + byteWidth] =
        img[src..<src + byteWidth]
  else:
    raise newException(ValueError, "Image must have 1 or 3 channels")

  output

proc decode*(buf: seq[byte], grayscale = false): seq[byte] =
  let
    width = cast[uint32](buf[18])
    height = cast[uint32](buf[22])
    outSize = if grayscale: width * height else: width * height * 3

  let paddedByteWidth = width * 3 +
    ((buf.len.uint32 - headerSize) div height - width * 3)

  result = newSeq[byte](outSize)
  if grayscale:
    for i in 0..<height:
      for j in 0..<width:
        result[i * width + j] =
          buf[headerSize + ((height - i - 1) * paddedByteWidth + j * 3)]
  else:
    for i in 0..<height:
      let dst = i * width
      let src = (height - i - 1) * paddedByteWidth
      result[dst * 3..<(dst + width) * 3] =
        buf[headerSize + src..<headerSize + src + width * 3]

proc write*(dst: string, img: openArray[byte], width, height: uint32) =
  let f = open(dst, fmWrite)
  defer: f.close
  let bmp = encode(img, width, height)
  discard f.writeBuffer(addr bmp[0], bmp.len)

proc read*(filename: string, grayscale = false): seq[byte] =
  let
    f = open(filename, fmRead)
    size = f.getFileSize()
  defer: f.close
  var buf = newSeq[byte](size)
  discard f.readBuffer(buf[0].addr, size)
  decode(buf, grayscale)

when isMainModule:
  let
    img = [
      byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
      0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF,
      0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
      0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00,
    ]
    width = 2'u32
    height = 4'u32

  let bmp = decode(encode(img, width, height), grayscale = false)

  assert bmp.len == img.len
  for i in 0..<img.len:
    assert bmp[i] == img[i]
