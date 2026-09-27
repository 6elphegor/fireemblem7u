	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB548
sub_080AB548: @ 0x080AB548
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	movs r1, #0xd
	muls r0, r1, r0
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
	ldr r5, _080AB598 @ =0x08CE538C
_080AB55C:
	asrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x50]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AB57C
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, r2
	bne _080AB59C
_080AB57C:
	movs r0, #0xd
	adds r1, r2, #0
	muls r1, r0, r1
	adds r3, r1, #1
	adds r0, r3, #0
	cmp r3, #0
	bge _080AB58E
	adds r0, r1, #0
	adds r0, #0x80
_080AB58E:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r3, r0
	b _080AB55C
	.align 2, 0
_080AB598: .4byte 0x08CE538C
_080AB59C:
	strb r2, [r1]
	lsls r0, r2, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
