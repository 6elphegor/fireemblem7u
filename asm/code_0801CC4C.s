	.include "macro.inc"

	.syntax unified

	thumb_func_start RunPotentialWaitEvents
RunPotentialWaitEvents: @ 0x0801CC4C
	push {lr}
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CC5C
	movs r0, #1
	b _0801CC62
_0801CC5C:
	bl RunWaitEvents
	movs r0, #0
_0801CC62:
	pop {r1}
	bx r1
	.align 2, 0
