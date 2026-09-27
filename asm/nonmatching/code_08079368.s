	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079368
sub_08079368: @ 0x08079368
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080793A2
_08079372:
	ldr r0, [r4, #0xc]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080793A0
	ldrb r0, [r4]
	cmp r5, r0
	bne _080793A0
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _08079398
	ldr r0, _0807939C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080793A0
_08079398:
	adds r0, r4, #0
	b _080793AA
	.align 2, 0
_0807939C: .4byte 0x0202BBF8
_080793A0:
	adds r4, #0x10
_080793A2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079372
	movs r0, #0
_080793AA:
	pop {r4, r5}
	pop {r1}
	bx r1
