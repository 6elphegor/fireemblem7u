	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDarkenThenFunc_OnLoop
EventDarkenThenFunc_OnLoop: @ 0x0800B220
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x50]
	bl EventDarkenThenFunc_StepDarken
	ldr r0, _0800B248 @ =0x03002870
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0800B240
	ldr r0, [r4, #0x4c]
	bl _call_via_r5
	adds r0, r4, #0
	bl Proc_Break
_0800B240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B248: .4byte 0x03002870
