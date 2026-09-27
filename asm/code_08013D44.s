	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013D44
sub_08013D44: @ 0x08013D44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013D5C @ =0x03002870
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _08013D60
	adds r0, r2, #0
	bl Proc_End
	b _08013D84
	.align 2, 0
_08013D5C: .4byte 0x03002870
_08013D60:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r2, [r1]
	ldrh r0, [r0]
	adds r0, r2, r0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08013D7E
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08013D7E:
	ldrh r1, [r1]
	lsrs r0, r1, #4
	strb r0, [r3]
_08013D84:
	pop {r0}
	bx r0
