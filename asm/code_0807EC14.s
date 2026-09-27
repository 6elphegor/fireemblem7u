	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_FinalFireDragonReStandUp
EventCall_FinalFireDragonReStandUp: @ 0x0807EC14
	push {lr}
	sub sp, #8
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	add sp, #8
	pop {r0}
	bx r0
