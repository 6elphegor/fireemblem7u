	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A75F0
sub_080A75F0: @ 0x080A75F0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	ldr r5, _080A765C @ =0x020000E4
	adds r0, r5, #0
	bl ClearText
	movs r0, #8
	adds r0, r0, r5
	mov sb, r0
	bl ClearText
	ldr r1, _080A7660 @ =0x08CE48C0
	mov r8, r1
	ldr r0, [r1, #0x24]
	bl DecodeMsg
	ldr r4, _080A7664 @ =0x020235FC
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl DecodeMsg
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A765C: .4byte 0x020000E4
_080A7660: .4byte 0x08CE48C0
_080A7664: .4byte 0x020235FC
