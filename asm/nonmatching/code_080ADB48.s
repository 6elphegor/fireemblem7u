	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADB48
sub_080ADB48: @ 0x080ADB48
	push {lr}
	bl GetOptionMenuLayoutId
	ldr r1, _080ADB74 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080ADB78 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080ADB74: .4byte 0x08CE5868
_080ADB78: .4byte 0x08CE583C
