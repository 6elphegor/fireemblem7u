	.include "macro.inc"

	.syntax unified

	thumb_func_start PutDrawText
PutDrawText: @ 0x08005AD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _08005AEE
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl InitText
_08005AEE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColor
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Text_DrawString
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
