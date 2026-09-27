	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitLoadSupports
UnitLoadSupports: @ 0x080179F0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08017A16
	adds r7, r5, #0
	adds r7, #0x32
_08017A04:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitInitialSupportExp
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, r6
	blt _08017A04
_08017A16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
