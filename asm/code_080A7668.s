	.include "macro.inc"

	.syntax unified

	thumb_func_start PutModeSelectCharacterText
PutModeSelectCharacterText: @ 0x080A7668
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _080A76EC @ =0x020000CC
	mov r8, r0
	bl ClearText
	mov r0, r8
	adds r0, #8
	bl ClearText
	movs r1, #0x10
	add r1, r8
	mov sl, r1
	mov r0, sl
	bl ClearText
	ldr r5, _080A76F0 @ =0x08CE48C0
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	bl DecodeMsg
	ldr r6, _080A76F4 @ =0x0202367C
	movs r1, #0
	mov sb, r1
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	bl DecodeMsg
	adds r6, #0x8a
	mov r1, sb
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, sl
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A76EC: .4byte 0x020000CC
_080A76F0: .4byte 0x08CE48C0
_080A76F4: .4byte 0x0202367C
