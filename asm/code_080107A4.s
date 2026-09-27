	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080107A4
sub_080107A4: @ 0x080107A4
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r5, [r0, #4]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080107C4
	ldr r4, _080107C0 @ =0x0000FFFF
	ands r4, r1
	b _080107C8
	.align 2, 0
_080107C0: .4byte 0x0000FFFF
_080107C4:
	movs r4, #1
	rsbs r4, r4, #0
_080107C8:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080107DC
	adds r1, r3, #0
_080107DC:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _08010800
	movs r3, #0xa0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08010690
	movs r0, #2
	b _08010802
_08010800:
	movs r0, #0
_08010802:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
