	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadLinkArenaFogPlaceholder
LoadLinkArenaFogPlaceholder: @ 0x08044FB8
	push {lr}
	ldr r0, _08044FC8 @ =0x081C7D58
	ldr r1, _08044FCC @ =0x06014800
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08044FC8: .4byte 0x081C7D58
_08044FCC: .4byte 0x06014800
