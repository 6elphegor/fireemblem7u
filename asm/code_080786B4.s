	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080786B4
sub_080786B4: @ 0x080786B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080786D4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080786D8
	movs r0, #2
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080786D8
	adds r0, r4, #0
	bl sub_08078650
	b _080786DA
	.align 2, 0
_080786D4: .4byte 0x0202BBF8
_080786D8:
	movs r0, #0
_080786DA:
	pop {r4}
	pop {r1}
	bx r1
