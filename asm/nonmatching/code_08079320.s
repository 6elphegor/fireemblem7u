	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079320
sub_08079320: @ 0x08079320
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0807935A
_0807932A:
	ldr r0, [r4, #8]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079358
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079358
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _08079350
	ldr r0, _08079354 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079358
_08079350:
	adds r0, r4, #0
	b _08079362
	.align 2, 0
_08079354: .4byte 0x0202BBF8
_08079358:
	adds r4, #0xc
_0807935A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807932A
	movs r0, #0
_08079362:
	pop {r4, r5}
	pop {r1}
	bx r1
