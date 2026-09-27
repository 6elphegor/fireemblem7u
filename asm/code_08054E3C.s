	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054E3C
sub_08054E3C: @ 0x08054E3C
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldr r0, _08054E54 @ =0x0000FFFE
	ldrh r1, [r1, #0xe]
	cmp r1, r0
	beq _08054E58
	ldrh r2, [r2, #0xe]
	cmp r2, r0
	beq _08054E58
	movs r0, #0
	b _08054E5A
	.align 2, 0
_08054E54: .4byte 0x0000FFFE
_08054E58:
	movs r0, #1
_08054E5A:
	bx lr
