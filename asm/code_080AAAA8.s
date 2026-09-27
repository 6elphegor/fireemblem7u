	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAAA8
sub_080AAAA8: @ 0x080AAAA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _080AAB04 @ =0x08418E18
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r7, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080AAB08 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080AAAD8
	movs r2, #1
_080AAAD8:
	adds r0, r1, #0
	adds r0, #0x84
	adds r0, r0, r2
	ldrb r0, [r0]
	lsrs r4, r0, #1
	cmp r7, #0x2f
	bgt _080AAB14
	cmp r7, #0x2e
	blt _080AAB14
	ldr r0, _080AAB0C @ =0x00001186
	add r4, sp, #0x28
	adds r1, r4, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	ldr r0, _080AAB10 @ =0x0000118B
	adds r1, r4, #0
	b _080AABAA
	.align 2, 0
_080AAB04: .4byte 0x08418E18
_080AAB08: .4byte 0x0202BBF8
_080AAB0C: .4byte 0x00001186
_080AAB10: .4byte 0x0000118B
_080AAB14:
	ldr r0, _080AABC0 @ =0x00001185
	add r6, sp, #0x28
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	cmp r4, #9
	ble _080AAB46
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080AAB46:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r7, #0
	bl GetChapterInfo
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080AABC4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080AAB76
	movs r2, #1
_080AAB76:
	adds r1, #0x84
	adds r1, r1, r2
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080AAB94
	ldr r0, _080AABC8 @ =0x00001188
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
_080AAB94:
	ldr r4, _080AABCC @ =0x0000118B
	adds r0, r4, #0
	adds r1, r6, #0
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
_080AABAA:
	bl DecodeMsgInBuffer
	adds r1, r5, #0
	bl AppendString
	adds r5, r0, #0
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AABC0: .4byte 0x00001185
_080AABC4: .4byte 0x0202BBF8
_080AABC8: .4byte 0x00001188
_080AABCC: .4byte 0x0000118B
