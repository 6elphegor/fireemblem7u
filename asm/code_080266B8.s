	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitTotalSupportLevel
GetUnitTotalSupportLevel: @ 0x080266B8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bge _080266DA
_080266CA:
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetUnitSupportLevel
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080266CA
_080266DA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
