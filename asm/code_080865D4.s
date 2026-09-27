	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuButtonDisp_Loop_OnSlideOut
MenuButtonDisp_Loop_OnSlideOut: @ 0x080865D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl UpdateMenuButtonPos
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl DrawMenuButtonAt
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08086610
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08086610:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
