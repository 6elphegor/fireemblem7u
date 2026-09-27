	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxMoveControl_OnInitBox
HelpBoxMoveControl_OnInitBox: @ 0x08081B8C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08081BA4
	adds r0, r4, #0
	bl _call_via_r1
_08081BA4:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl StartHelpBoxExt
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
