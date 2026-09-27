	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010D98
sub_08010D98: @ 0x08010D98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010DC0 @ =0x08B91F84
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x34]
	movs r1, #0xff
	ands r1, r6
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010DC0: .4byte 0x08B91F84
