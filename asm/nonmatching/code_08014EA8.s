	.include "macro.inc"

	.syntax unified

	thumb_func_start PutDrawTextCentered
PutDrawTextCentered: @ 0x08014EA8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov sb, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl GetStringTextLen
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl Text_SetCursor
	adds r0, r6, #0
	mov r1, r8
	bl Text_DrawString
	lsls r5, r5, #5
	add r5, sb
	lsls r5, r5, #1
	ldr r0, _08014EF4 @ =0x02022C60
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014EF4: .4byte 0x02022C60
