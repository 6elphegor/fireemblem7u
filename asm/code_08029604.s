	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAutoleveledStatIncrease
GetAutoleveledStatIncrease: @ 0x08029604
	push {r4, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	cmp r4, #0
	bge _08029612
	adds r0, r4, #3
_08029612:
	asrs r0, r0, #2
	bl RandNext
	adds r1, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _08029622
	adds r0, r4, #7
_08029622:
	asrs r0, r0, #3
	subs r0, r1, r0
	adds r0, r4, r0
	bl GetStatIncrease
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
