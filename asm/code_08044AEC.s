	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044AEC
sub_08044AEC: @ 0x08044AEC
	adds r1, r0, #0
	adds r1, #0x1e
	ldr r3, _08044B04 @ =0x03001428
	movs r2, #4
_08044AF4:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _08044AF4
	bx lr
	.align 2, 0
_08044B04: .4byte 0x03001428
