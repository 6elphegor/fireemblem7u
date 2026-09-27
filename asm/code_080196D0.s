	.include "macro.inc"

	.syntax unified

	thumb_func_start RenderBmMapColumn
RenderBmMapColumn: @ 0x080196D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _08019744 @ =0x0202BBB8
	ldrh r1, [r4, #0xc]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x14
	adds r1, r0, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r2, [r4, #0xe]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x14
	lsls r2, r1, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldrh r2, [r4, #0x24]
	subs r3, r3, r2
	adds r7, r0, r3
	movs r0, #0xf
	ands r7, r0
	ldrh r0, [r4, #0x26]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r0, #1
	ldrb r4, [r4, #4]
	ands r0, r4
	cmp r0, #0
	bne _0801974C
	movs r6, #0xa
	movs r4, #0xf
_0801971E:
	mov r1, sb
	adds r2, r1, r6
	ands r2, r4
	mov r1, sl
	adds r0, r1, r6
	str r0, [sp]
	ldr r0, _08019748 @ =0x02024460
	adds r1, r7, #0
	mov r3, r8
	bl PutMapMetatile
	subs r6, #1
	cmp r6, #0
	bge _0801971E
	movs r0, #8
	bl EnableBgSync
	b _08019782
	.align 2, 0
_08019744: .4byte 0x0202BBB8
_08019748: .4byte 0x02024460
_0801974C:
	movs r6, #0xa
_0801974E:
	mov r2, sb
	adds r4, r2, r6
	movs r0, #0xf
	ands r4, r0
	mov r0, sl
	adds r5, r0, r6
	str r5, [sp]
	ldr r0, _08019794 @ =0x02024460
	adds r1, r7, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutMapMetatile
	str r4, [sp]
	ldr r0, _08019798 @ =0x02023C60
	mov r1, r8
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutLimitViewSquare
	subs r6, #1
	cmp r6, #0
	bge _0801974E
	movs r0, #0xc
	bl EnableBgSync
_08019782:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019794: .4byte 0x02024460
_08019798: .4byte 0x02023C60
