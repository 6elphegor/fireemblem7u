	.include "macro.inc"

	.syntax unified

	thumb_func_start MoveLimitViewChange_OnLoop
MoveLimitViewChange_OnLoop: @ 0x0801D0C8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0801D100 @ =0x08B9356C
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0801D104 @ =0x06005000
	movs r2, #0x80
	bl RegisterDataMove
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0801D0F8
	adds r0, r5, #0
	bl Proc_Break
_0801D0F8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D100: .4byte 0x08B9356C
_0801D104: .4byte 0x06005000
