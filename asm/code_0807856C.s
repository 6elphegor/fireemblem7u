	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807856C
sub_0807856C: @ 0x0807856C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _080785A8
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _080785A8
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _080785AA
_080785A8:
	movs r0, #0
_080785AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
