	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805764C
sub_0805764C: @ 0x0805764C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, [r6, #0x44]
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, _08057684 @ =0x03002870
	strh r0, [r4, #0x20]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08057688
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	adds r7, r0, #0
	adds r7, #0x1e
	b _0805768E
	.align 2, 0
_08057684: .4byte 0x03002870
_08057688:
	ldrh r4, [r4, #0x20]
	lsrs r0, r4, #3
	subs r7, r0, #1
_0805768E:
	movs r2, #0x1f
	mov r8, r2
	adds r0, r7, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r5, _0805770C @ =0x02023460
	adds r0, r0, r5
	movs r4, #0x80
	lsls r4, r4, #1
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #1
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	adds r0, r7, #2
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	str r4, [sp]
	movs r1, #1
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	movs r0, #2
	bl EnableBgSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057700
	ldr r1, _08057710 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearBG1
	adds r0, r6, #0
	bl Proc_Break
_08057700:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805770C: .4byte 0x02023460
_08057710: .4byte 0x0201774C
