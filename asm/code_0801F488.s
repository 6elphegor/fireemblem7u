	.include "macro.inc"

	.syntax unified

	thumb_func_start PutScreenFogEffectOverlayed
PutScreenFogEffectOverlayed: @ 0x0801F488
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0x82
	lsls r0, r0, #7
	mov r8, r0
	ldr r1, _0801F568 @ =0x00004110
	str r1, [sp, #0xc]
	movs r2, #0
	ldr r6, _0801F56C @ =0x02023C60
_0801F4A2:
	movs r5, #0
	adds r0, r2, #0
	adds r0, #0x10
	adds r3, r2, #0
	adds r3, #8
	adds r4, r2, #0
	adds r4, #0x18
	adds r7, r2, #1
	str r7, [sp, #8]
	lsls r2, r2, #5
	str r2, [sp]
	adds r2, #0x1f
	lsls r0, r0, #5
	mov sl, r0
	mov r1, sl
	adds r1, #0x1f
	lsls r3, r3, #5
	mov sb, r3
	mov r0, sb
	adds r0, #0x1f
	lsls r4, r4, #5
	mov ip, r4
	mov r3, ip
	adds r3, #0x1f
	str r3, [sp, #4]
	lsls r0, r0, #1
	adds r4, r0, r6
	lsls r1, r1, #1
	adds r3, r1, r6
	lsls r2, r2, #1
	adds r2, r2, r6
_0801F4E0:
	ldr r0, [sp]
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	strh r1, [r0]
	strh r1, [r2]
	mov r0, sl
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	strh r1, [r3]
	mov r0, sb
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r7, r0
	ldr r7, [sp, #0x10]
	strh r1, [r7]
	strh r1, [r4]
	mov r0, ip
	adds r0, #0xf
	subs r0, r0, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	ldr r7, [sp, #4]
	subs r0, r7, r5
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r1, [r0]
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	subs r4, #2
	subs r3, #2
	subs r2, #2
	adds r5, #1
	cmp r5, #0xf
	ble _0801F4E0
	movs r3, #0x10
	add r8, r3
	adds r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [sp, #8]
	cmp r2, #7
	ble _0801F4A2
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F568: .4byte 0x00004110
_0801F56C: .4byte 0x02023C60
