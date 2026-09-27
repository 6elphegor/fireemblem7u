	.include "macro.inc"

	.syntax unified

	thumb_func_start PutScreenFogEffect
PutScreenFogEffect: @ 0x0801F3B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0x82
	lsls r0, r0, #7
	mov sb, r0
	ldr r1, _0801F480 @ =0x00004110
	mov r8, r1
	movs r6, #0
	ldr r7, _0801F484 @ =0x02024460
	mov sl, r7
_0801F3D0:
	movs r0, #0
	str r0, [sp]
	lsls r5, r6, #5
	adds r2, r6, #0
	adds r2, #0x10
	adds r0, r6, #0
	adds r0, #8
	adds r4, r6, #0
	adds r4, #0x18
	adds r1, r6, #1
	str r1, [sp, #4]
	adds r5, #0x10
	lsls r3, r2, #5
	adds r3, #0x10
	lsls r1, r0, #5
	adds r1, #0x10
	lsls r0, r0, #6
	add r0, sl
	mov ip, r0
	lsls r2, r2, #6
	add r2, sl
	str r2, [sp, #0xc]
	lsls r0, r6, #6
	mov r6, sl
	adds r2, r0, r6
	lsls r0, r4, #5
	adds r0, #0x10
	str r0, [sp, #8]
	lsls r4, r4, #6
	add r4, sl
	lsls r1, r1, #1
	add r1, sl
	lsls r3, r3, #1
	add r3, sl
	lsls r5, r5, #1
	add r5, sl
_0801F418:
	mov r7, sb
	strh r7, [r2]
	mov r0, sb
	strh r0, [r5]
	ldr r6, [sp, #0xc]
	strh r0, [r6]
	strh r0, [r3]
	mov r0, r8
	mov r7, ip
	strh r0, [r7]
	strh r0, [r1]
	strh r0, [r4]
	ldr r6, [sp, #8]
	ldr r7, [sp]
	adds r0, r6, r7
	lsls r0, r0, #1
	add r0, sl
	mov r6, r8
	strh r6, [r0]
	movs r7, #1
	add sb, r7
	movs r0, #1
	add r8, r0
	movs r6, #2
	add ip, r6
	ldr r7, [sp, #0xc]
	adds r7, #2
	str r7, [sp, #0xc]
	adds r2, #2
	adds r4, #2
	adds r1, #2
	adds r3, #2
	adds r5, #2
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	cmp r0, #0xf
	ble _0801F418
	movs r1, #0x10
	add sb, r1
	add r8, r1
	ldr r6, [sp, #4]
	cmp r6, #7
	ble _0801F3D0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F480: .4byte 0x00004110
_0801F484: .4byte 0x02024460
