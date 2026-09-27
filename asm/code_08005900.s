	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawTextGlyphNoClear
DrawTextGlyphNoClear: @ 0x08005900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005A3C @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl GetColorLut
	mov sl, r0
	ldr r6, [sp]
	ldrb r0, [r6, #3]
	bl GetColorLut
	mov sb, r0
	movs r0, #0xf
	str r0, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_08005948:
	ldr r2, [sp, #0x14]
	ldm r2!, {r0}
	str r2, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl sub_080BFC18
	movs r5, #0xff
	ands r5, r0
	lsls r5, r5, #1
	adds r6, r5, #0
	add r6, sl
	mov r8, r6
	lsls r6, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r6, [sp, #0xc]
	ldr r3, [r6]
	ands r3, r2
	str r3, [r6]
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	stm r6!, {r3}
	str r6, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r5, #0xff
	ands r5, r2
	lsls r5, r5, #1
	adds r2, r5, #0
	add r2, sl
	mov r8, r2
	lsls r6, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r6, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r6, r8
	ldrh r6, [r6]
	orrs r2, r6
	ldr r3, [r7]
	ands r3, r2
	add r5, sb
	add r4, sb
	ldrh r4, [r4]
	lsls r2, r4, #0x10
	ldrh r5, [r5]
	orrs r2, r5
	orrs r3, r2
	str r3, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r2, sl
	adds r5, r4, r2
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r3, sl
	adds r0, r1, r3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	ldrh r5, [r5]
	orrs r0, r5
	ldr r2, [r7, #0x40]
	ands r2, r0
	add r4, sb
	add r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #0x10
	ldrh r4, [r4]
	orrs r0, r4
	orrs r2, r0
	str r2, [r7, #0x40]
	adds r7, #4
	ldr r6, [sp, #8]
	subs r6, #1
	str r6, [sp, #8]
	cmp r6, #0
	bge _08005948
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005A3C: .4byte 0x02028D70
