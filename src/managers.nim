import
  context,
  shapes,
  enums,
  core

template windowWithDefer*(ctx: Ctx, label: string, rect: Rect) =
  if not ctx.beginWindow(label, rect):
    return
  defer: ctx.endWindow

template treenode*(ctx: Ctx, label: string, opt: set[Option], body: untyped) =
  if ctx.beginTreenode(label, opt):
    try:
      body
      discard # needed to support discardable pragma
    finally:
      ctx.endTreenode

template treenode*(ctx: Ctx, label: string, body: untyped) =
  treenode(ctx, label, {}, body)

template column*(ctx: Ctx, body: untyped) =
  ctx.layoutBeginColumn
  try:
    body
    discard # needed to support discardable pragma
  finally:
    ctx.layoutEndColumn

template popup*(ctx: Ctx, label: string, body: untyped) =
  if ctx.beginPopup(label):
    try:
      body
      discard # needed to support discardable pragma
    finally:
      ctx.endPopup
