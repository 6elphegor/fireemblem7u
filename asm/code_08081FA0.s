	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpPrompt_OnIdle
HelpPrompt_OnIdle: @ 0x08081FA0
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _08081FB8 @ =0x08CC208C
	movs r0, #0
	str r0, [sp]
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08081FB8: .4byte 0x08CC208C
