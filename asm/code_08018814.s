	.include "macro.inc"

	.syntax unified

	thumb_func_start GetClassSMSId
GetClassSMSId: @ 0x08018814
	adds r1, r0, #0
	cmp r1, #0
	bgt _0801881E
	movs r0, #0
	b _08018826
_0801881E:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _0801882C @ =0x08BE015C
	adds r0, r1, r0
_08018826:
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
_0801882C: .4byte 0x08BE015C
