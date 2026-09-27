	.include "macro.inc"

	.syntax unified

	thumb_func_start PutStringCentered
PutStringCentered: @ 0x08014634
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, _08014694 @ =0x03000430
	adds r0, r5, #0
	adds r1, r4, #0
	bl InitText
	adds r0, r6, #0
	bl GetStringTextLen
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetCursor
	adds r0, r5, #0
	mov r1, r8
	bl Text_SetColor
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_DrawString
	adds r0, r5, #0
	mov r1, sb
	bl PutText
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014694: .4byte 0x03000430
