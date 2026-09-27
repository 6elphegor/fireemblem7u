	.include "macro.inc"

	.syntax unified

	thumb_func_start RenderBmMapLine
RenderBmMapLine: @ 0x0801979C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019810 @ =0x0202BBB8
	ldrh r1, [r4, #0xc]
	lsls r2, r1, #0x10
	asrs r2, r2, #0x14
	lsls r1, r2, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r1, [r4, #0xe]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r4, #0x24]
	subs r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldrh r1, [r4, #0x26]
	subs r3, r3, r1
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _08019818
	movs r6, #0xf
	movs r4, #0xf
_080197EA:
	mov r0, sb
	adds r1, r0, r6
	ands r1, r4
	mov r0, sl
	adds r3, r0, r6
	mov r0, r8
	str r0, [sp]
	ldr r0, _08019814 @ =0x02024460
	adds r2, r7, #0
	bl PutMapMetatile
	subs r6, #1
	cmp r6, #0
	bge _080197EA
	movs r0, #8
	bl EnableBgSync
	b _08019850
	.align 2, 0
_08019810: .4byte 0x0202BBB8
_08019814: .4byte 0x02024460
_08019818:
	movs r6, #0xf
_0801981A:
	mov r1, sb
	adds r4, r1, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	mov r1, r8
	str r1, [sp]
	ldr r0, _08019860 @ =0x02024460
	adds r1, r4, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl PutMapMetatile
	str r7, [sp]
	ldr r0, _08019864 @ =0x02023C60
	adds r1, r5, #0
	mov r2, r8
	adds r3, r4, #0
	bl PutLimitViewSquare
	subs r6, #1
	cmp r6, #0
	bge _0801981A
	movs r0, #0xc
	bl EnableBgSync
_08019850:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019860: .4byte 0x02024460
_08019864: .4byte 0x02023C60
