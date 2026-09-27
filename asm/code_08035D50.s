	.include "macro.inc"

	.syntax unified

	thumb_func_start AiReachesByBirdsEyeDistance
AiReachesByBirdsEyeDistance: @ 0x08035D50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r3, r1, r0
	cmp r3, #0
	bge _08035D6A
	subs r3, r0, r1
_08035D6A:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	subs r0, r2, r1
	cmp r0, #0
	bge _08035D7A
	subs r0, r1, r2
_08035D7A:
	adds r5, r3, r0
	adds r0, r6, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r5, r1
	ble _08035D9A
	movs r0, #0
	b _08035D9C
_08035D9A:
	movs r0, #1
_08035D9C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
