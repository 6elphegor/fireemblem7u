	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ADDB4
sub_080ADDB4: @ 0x080ADDB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	bl GetOptionMenuLayoutId
	ldr r1, _080ADE80 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
	ldr r1, _080ADE84 @ =0x08CE58D8
	movs r0, #0x2c
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	lsrs r0, r0, #3
	str r0, [sp, #8]
	ldr r1, _080ADE88 @ =0x08CE583C
	ldr r2, [sp]
	lsls r0, r2, #3
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, [r1]
	adds r0, r0, r5
	bl ClearText
	movs r0, #0
	mov r8, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _080ADE52
	mov sl, r5
_080ADE0C:
	ldr r0, _080ADE88 @ =0x08CE583C
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r6, [r4, #8]
	subs r6, #0x78
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne _080ADE2E
	movs r5, #2
_080ADE2E:
	ldrh r0, [r4, #6]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Text_InsertDrawString
	adds r4, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _080ADE52
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080ADE0C
_080ADE52:
	ldr r0, _080ADE88 @ =0x08CE583C
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #5
	ldr r2, [sp, #8]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080ADE8C @ =0x02023C60
	adds r1, r1, r2
	bl PutText
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE80: .4byte 0x08CE5868
_080ADE84: .4byte 0x08CE58D8
_080ADE88: .4byte 0x08CE583C
_080ADE8C: .4byte 0x02023C60
