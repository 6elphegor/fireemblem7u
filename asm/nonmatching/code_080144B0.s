	.include "macro.inc"

	.syntax unified

	thumb_func_start TemporaryLock_OnLoop
TemporaryLock_OnLoop: @ 0x080144B0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _080144C2
	adds r0, r1, #0
	bl Proc_Break
	b _080144C6
_080144C2:
	subs r0, #1
	str r0, [r1, #0x58]
_080144C6:
	pop {r0}
	bx r0
	.align 2, 0
