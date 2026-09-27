	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_SetupCtrlUI
AtMenu_SetupCtrlUI: @ 0x0808EA58
	push {r4, lr}
	adds r4, r0, #0
	bl ShowPrepScreenMenuFrozenHand
	adds r0, r4, #0
	bl sub_0808E9A8
	adds r4, #0x2e
	ldrb r4, [r4]
	lsls r1, r4, #4
	adds r1, #0x38
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x2c
	movs r2, #7
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
