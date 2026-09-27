	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeFromWhite_OnInit
FadeFromWhite_OnInit: @ 0x08013E84
	push {lr}
	bl FadeFromBlack_OnInit
	ldr r3, _08013EB4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013EB4: .4byte 0x03002870
