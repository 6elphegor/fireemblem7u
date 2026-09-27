	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044B08
sub_08044B08: @ 0x08044B08
	ldr r3, _08044B20 @ =0x03001428
	adds r1, r0, #0
	adds r1, #0x1e
	movs r2, #4
_08044B10:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08044B10
	bx lr
	.align 2, 0
_08044B20: .4byte 0x03001428
