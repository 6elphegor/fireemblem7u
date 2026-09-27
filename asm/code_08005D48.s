	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSpriteTextGlyph
DrawSpriteTextGlyph: @ 0x08005D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08005EF4 @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	adds r7, r0, #0
	movs r0, #7
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ands r2, r0
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0xc]
	ldrb r0, [r1, #3]
	bl GetColorLut
	mov r8, r0
	movs r0, #0xff
	mov sb, r0
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	str r1, [sp, #0x10]
	movs r2, #7
	mov sl, r2
_08005D8C:
	ldr r3, [sp, #0xc]
	ldm r3!, {r0}
	str r3, [sp, #0xc]
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r2, r3, #1
	bl sub_080BFC18
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08005D8C
	ldr r0, _08005EF4 @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r0, r2
	movs r3, #0xff
	mov sb, r3
	movs r0, #7
	mov sl, r0
_08005E3E:
	ldr r2, [sp, #0xc]
	ldm r2!, {r0}
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x10]
	bl sub_080BFC18
	adds r6, r1, #0
	adds r5, r0, #0
	mov r3, sb
	ands r3, r5
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7]
	orrs r0, r1
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsls r4, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r4, #0
	orrs r0, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x20]
	orrs r0, r1
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r3, sb
	ands r3, r0
	lsls r3, r3, #1
	add r3, r8
	lsrs r0, r6, #8
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r2, [r2]
	lsls r1, r2, #0x10
	ldrh r3, [r3]
	orrs r1, r3
	ldr r0, [r7, #0x40]
	orrs r0, r1
	str r0, [r7, #0x40]
	adds r7, #4
	movs r3, #1
	rsbs r3, r3, #0
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _08005E3E
	ldr r1, [sp]
	ldrb r2, [r1, #2]
	ldr r1, [sp, #4]
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	ldr r2, [sp]
	strb r0, [r2, #2]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005EF4: .4byte 0x02028D70
