	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsWithinRectDistance
AiIsWithinRectDistance: @ 0x080370C8
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r2
	cmp r1, #0
	bge _080370EA
	subs r1, r2, r0
_080370EA:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r0, r2, r3
	cmp r0, #0
	bge _080370F6
	subs r0, r6, r2
_080370F6:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _08037104
	movs r0, #0
	b _08037106
_08037104:
	movs r0, #1
_08037106:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
