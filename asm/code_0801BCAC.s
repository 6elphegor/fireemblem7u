	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugContinueMenu_IsContinueChapterAvailable
DebugContinueMenu_IsContinueChapterAvailable: @ 0x0801BCAC
	push {lr}
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BCBE
	movs r1, #1
_0801BCBE:
	adds r0, r1, #0
	pop {r1}
	bx r1
