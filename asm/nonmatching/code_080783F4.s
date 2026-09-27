	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080783F4
sub_080783F4: @ 0x080783F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r3, #0xff
	adds r5, r1, #0
	ands r5, r3
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	lsrs r6, r1, #8
	ldr r0, [r2, #0xc]
	adds r1, r0, #0
	ands r1, r3
	cmp r1, #2
	beq _08078434
	cmp r1, #2
	bhi _0807841E
	cmp r1, #1
	beq _08078424
	b _08078450
_0807841E:
	cmp r1, #3
	beq _08078444
	b _08078450
_08078424:
	ldr r0, _08078430 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08078450
	b _0807846E
	.align 2, 0
_08078430: .4byte 0x0202BBF8
_08078434:
	ldr r0, _08078440 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _08078450
	b _0807846E
	.align 2, 0
_08078440: .4byte 0x0202BBF8
_08078444:
	lsrs r0, r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807846E
_08078450:
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _0807845A
	cmp r5, #0
	bne _0807846E
_0807845A:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _0807846E
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078470
_0807846E:
	movs r0, #0
_08078470:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
