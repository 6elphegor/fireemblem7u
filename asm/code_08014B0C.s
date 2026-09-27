	.include "macro.inc"

	.syntax unified

	thumb_func_start CallDelayedArg_OnLoop
CallDelayedArg_OnLoop: @ 0x08014B0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08014B2C
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_08014B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
