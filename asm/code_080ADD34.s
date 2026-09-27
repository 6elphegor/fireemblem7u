	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADD34
sub_080ADD34: @ 0x080ADD34
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov sb, r0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080ADDA4 @ =0x08CE583C
	mov r8, r0
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r0]
	adds r0, r0, r4
	bl ClearText
	ldr r6, _080ADDA8 @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080ADDAC @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, sb
	movs r1, #0x2c
	ldrb r0, [r0]
	muls r0, r1, r0
	adds r0, r0, r6
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	lsls r5, r5, #6
	ldr r1, _080ADDB0 @ =0x02023C68
	adds r5, r5, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDA4: .4byte 0x08CE583C
_080ADDA8: .4byte 0x08CE58D8
_080ADDAC: .4byte 0x08CE5868
_080ADDB0: .4byte 0x02023C68
