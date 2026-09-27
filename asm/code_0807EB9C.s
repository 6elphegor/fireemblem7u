	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCall_FireDragonFellWeakly
EventCall_FireDragonFellWeakly: @ 0x0807EB9C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #2
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl PutFireDragonSpritefx
	adds r0, r6, #0
	bl StartEventQuakefx
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
