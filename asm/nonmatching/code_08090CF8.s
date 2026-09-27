	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepHbKeyListener_Loop
PrepHbKeyListener_Loop: @ 0x08090CF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08090D1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08090D14
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08090D14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090D1C: .4byte 0x08B857F8
