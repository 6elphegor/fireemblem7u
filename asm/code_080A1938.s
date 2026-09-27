	.include "macro.inc"

	.syntax unified

	thumb_func_start GetNextSuspendSaveId
GetNextSuspendSaveId: @ 0x080A1938
	push {lr}
	bl GetLastSuspendSaveId
	adds r1, r0, #0
	movs r0, #1
	subs r0, r0, r1
	pop {r1}
	bx r1
