	.include "macro.inc"

	.syntax unified

	thumb_func_start StartHelpPromptSprite
StartHelpPromptSprite: @ 0x08081FBC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _08081FE4 @ =0x08CC209C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08081FD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_08081FD8:
	str r6, [r0, #0x2c]
	str r7, [r0, #0x30]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081FE4: .4byte 0x08CC209C
