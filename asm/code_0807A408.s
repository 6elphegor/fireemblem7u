	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A408
sub_0807A408: @ 0x0807A408
	push {lr}
	bl GetDeadEnemyAmount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0807A41A
	movs r0, #0
	b _0807A41C
_0807A41A:
	movs r0, #1
_0807A41C:
	pop {r1}
	bx r1
