	.include "macro.inc"

	.syntax unified

	thumb_func_start GoalDisplay_Loop_SlideIn
GoalDisplay_Loop_SlideIn: @ 0x080861C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0808620C @ =0x08CC2D30
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_08086008
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _08086206
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08086206:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808620C: .4byte 0x08CC2D30
