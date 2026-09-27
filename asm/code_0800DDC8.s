	.include "macro.inc"

	.syntax unified

	thumb_func_start EventFlashCursor_OnLoop
EventFlashCursor_OnLoop: @ 0x0800DDC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	subs r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0
	bgt _0800DDDC
	adds r0, r4, #0
	bl Proc_Break
_0800DDDC:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl PutMapCursor
	pop {r4}
	pop {r0}
	bx r0
