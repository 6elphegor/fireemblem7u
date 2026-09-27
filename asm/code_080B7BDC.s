	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7BDC
sub_080B7BDC: @ 0x080B7BDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r3, [r4]
	adds r3, #1
	strh r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080B7C06
	ldr r0, _080B7C24 @ =0x08CEDC98
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x11
	adds r3, #0x20
	movs r1, #0
	bl sub_080010F4
_080B7C06:
	ldrh r4, [r4]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x20
	bne _080B7C1E
	adds r1, r5, #0
	adds r1, #0x50
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080B7C1E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7C24: .4byte 0x08CEDC98
