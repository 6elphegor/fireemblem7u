	.include "macro.inc"

	.syntax unified

	thumb_func_start EventCursor_Loop
EventCursor_Loop: @ 0x0800DE64
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r2, [r1, r3]
	lsls r2, r2, #4
	adds r0, #0x66
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r1, r1, #4
	adds r0, r2, #0
	movs r2, #0
	bl PutMapCursor
	pop {r0}
	bx r0
