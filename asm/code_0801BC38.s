	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugContinueMenu_IsManualContinueAvailable
DebugContinueMenu_IsManualContinueAvailable: @ 0x0801BC38
	push {lr}
	movs r0, #4
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0801BC4A
	movs r1, #1
_0801BC4A:
	adds r0, r1, #0
	pop {r1}
	bx r1
