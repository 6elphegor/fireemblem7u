	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013E14
sub_08013E14: @ 0x08013E14
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013E2C @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013E30
	adds r0, r2, #0
	bl Proc_End
	b _08013E50
	.align 2, 0
_08013E2C: .4byte 0x03002870
_08013E30:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08013E4A
	movs r0, #0
	strh r0, [r1]
_08013E4A:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_08013E50:
	pop {r0}
	bx r0
