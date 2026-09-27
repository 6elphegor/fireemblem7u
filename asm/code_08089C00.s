	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08089C00
sub_08089C00: @ 0x08089C00
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _08089C88
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08089C50
_08089C32:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08089C78 @ =0x02022C60
	bl sub_0808AD00
	adds r4, #1
	ldrh r1, [r5, #0x3e]
	lsrs r0, r1, #4
	adds r0, #6
_08089C50:
	cmp r4, r0
	bge _08089C5C
	ldr r0, _08089C7C @ =0x0200E668
	ldrb r0, [r0]
	cmp r4, r0
	blt _08089C32
_08089C5C:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _08089C80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089C9C
	ldr r0, _08089C84 @ =0x0000038A
	bl m4aSongNumStart
	b _08089C9C
	.align 2, 0
_08089C78: .4byte 0x02022C60
_08089C7C: .4byte 0x0200E668
_08089C80: .4byte 0x0202BBF8
_08089C84: .4byte 0x0000038A
_08089C88:
	ldr r0, _08089CA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08089C9C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_08089C9C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089CA4: .4byte 0x0202BBF8
