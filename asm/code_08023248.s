	.include "macro.inc"

	.syntax unified

	thumb_func_start BallistaRangeMenuHelpBox
BallistaRangeMenuHelpBox: @ 0x08023248
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _08023278 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023278: .4byte 0x03004690
