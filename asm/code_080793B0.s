	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080793B0
sub_080793B0: @ 0x080793B0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080793EA
_080793BA:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080793E8
	ldrb r0, [r4]
	cmp r5, r0
	bne _080793E8
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _080793E0
	ldr r0, _080793E4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080793E8
_080793E0:
	adds r0, r4, #0
	b _080793F2
	.align 2, 0
_080793E4: .4byte 0x0202BBF8
_080793E8:
	adds r4, #0xc
_080793EA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080793BA
	movs r0, #0
_080793F2:
	pop {r4, r5}
	pop {r1}
	bx r1
