	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuButtonDisp_Loop_OnSlideIn
MenuButtonDisp_Loop_OnSlideIn: @ 0x080864E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
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
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08086526
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_08086526:
	pop {r4}
	pop {r0}
	bx r0
