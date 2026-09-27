	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpBoxTextInit
StartHelpBoxTextInit: @ 0x08082D7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08082D94 @ =0x08CC29BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082D94: .4byte 0x08CC29BC
