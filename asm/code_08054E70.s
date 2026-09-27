	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054E70
sub_08054E70: @ 0x08054E70
	ldr r1, [r0, #0x14]
	ldr r0, _08054E80 @ =0x0000FFFF
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	bne _08054E84
	movs r0, #1
	b _08054E86
	.align 2, 0
_08054E80: .4byte 0x0000FFFF
_08054E84:
	movs r0, #0
_08054E86:
	bx lr
