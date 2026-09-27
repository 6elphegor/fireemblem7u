	.include "macro.inc"

	.syntax unified

	thumb_func_start SioStrCpy
SioStrCpy: @ 0x0803D948
	movs r3, #0
	b _0803D954
_0803D94C:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
_0803D954:
	ldrb r2, [r0]
	cmp r2, #0
	bne _0803D94C
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	bx lr
	.align 2, 0
