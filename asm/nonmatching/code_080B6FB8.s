	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6FB8
sub_080B6FB8: @ 0x080B6FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x88
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sb, r0
	add r2, sp, #0x80
	str r1, [r2]
	ldr r0, _080B704C @ =0x08CEDDFC
	ldr r0, [r0]
	add r1, sp, #0x84
	str r0, [r1]
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r4, #0
_080B6FDC:
	ldr r0, [r6]
	ldrb r1, [r0]
	cmp r1, #0
	beq _080B7058
	cmp r1, #1
	bne _080B706C
	ldr r0, [r4]
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #1
	bne _080B6FDC
	adds r0, r7, #0
	ldr r1, [r4]
	bl AppendChapterNumberString
	str r0, [r5]
	adds r0, r7, #0
	bl GetChapterInfo
	adds r2, r0, #0
	ldr r0, _080B7050 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B7022
	movs r1, #2
_080B7022:
	adds r0, r2, #0
	adds r0, #0x74
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r4]
	bl AppendString
	str r0, [r5]
	ldr r0, _080B7054 @ =0x0000118B
	mov r1, sp
	bl DecodeMsgInBuffer
	ldr r1, [r5]
	bl AppendString
	str r0, [r5]
	b _080B6FDC
	.align 2, 0
_080B704C: .4byte 0x08CEDDFC
_080B7050: .4byte 0x0202BBF8
_080B7054: .4byte 0x0000118B
_080B7058:
	ldr r0, [r4]
	strb r1, [r0]
	mov r0, r8
	str r0, [r6]
	ldr r0, _080B7068 @ =0x08CEDDFC
	ldr r0, [r0]
	str r0, [r5]
	b _080B7076
	.align 2, 0
_080B7068: .4byte 0x08CEDDFC
_080B706C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CopyTextChar
	b _080B6FDC
_080B7076:
	ldr r1, [r4]
	ldrb r2, [r1]
	cmp r2, #0
	beq _080B709C
	cmp r2, #1
	bne _080B7092
	ldr r0, [r6]
	strb r2, [r0]
	adds r1, #1
	str r1, [r4]
	adds r0, #1
	add r1, sp, #0x80
	str r0, [r1]
	b _080B7076
_080B7092:
	adds r0, r4, #0
	adds r1, r6, #0
	bl CopyTextChar
	b _080B7076
_080B709C:
	ldr r0, [r6]
	ldr r1, [r4]
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
