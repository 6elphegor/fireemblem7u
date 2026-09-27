	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079A5C
sub_08079A5C: @ 0x08079A5C
	push {r4, lr}
	movs r4, #0
	ldr r1, _08079A8C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08079A84
	bl IsTutorialDisabled
	cmp r0, #0
	bne _08079A84
	movs r0, #0x9c
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
_08079A84:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079A8C: .4byte 0x0202BBF8
