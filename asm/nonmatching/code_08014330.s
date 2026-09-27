	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeCore_Loop
FadeCore_Loop: @ 0x08014330
	push {r4, lr}
	adds r4, r0, #0
	bl FadeCore_Tick
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801434E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08014348
	bl _call_via_r0
_08014348:
	adds r0, r4, #0
	bl Proc_Break
_0801434E:
	pop {r4}
	pop {r0}
	bx r0
