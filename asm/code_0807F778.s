	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUiGauge
DrawUiGauge: @ 0x0807F778
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov sb, r1
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x28]
	mov sl, r0
	ldr r1, _0807F840 @ =0x02020140
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	lsls r2, r6, #4
	ldr r0, _0807F844 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	lsls r4, r6, #3
	mov r0, r8
	adds r1, r4, #0
	mov r2, sb
	bl DrawUiGaugeBitmapEdgeColumn
	mov r0, sb
	adds r2, r0, r5
	adds r2, #3
	mov r0, r8
	adds r1, r4, #0
	bl DrawUiGaugeBitmapEdgeColumn
	movs r4, #0
	adds r5, #2
	cmp r4, r5
	bge _0807F7E0
	mov r7, sb
	adds r7, #1
_0807F7D0:
	adds r2, r4, r7
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapBaseColumn
	adds r4, #1
	cmp r4, r5
	blt _0807F7D0
_0807F7E0:
	movs r4, #0
	ldr r1, [sp, #4]
	lsls r7, r1, #5
	cmp r4, sl
	bge _0807F7FE
	mov r5, sb
	adds r5, #2
_0807F7EE:
	adds r2, r4, r5
	mov r0, r8
	lsls r1, r6, #3
	bl DrawUiGaugeBitmapFilledColumn
	adds r4, #1
	cmp r4, sl
	blt _0807F7EE
_0807F7FE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	ble _0807F820
	mov r0, sb
	adds r0, #2
	mov r1, sl
	adds r5, r1, r0
	ldr r4, [sp, #0x2c]
_0807F80E:
	mov r0, r8
	lsls r1, r6, #3
	adds r2, r5, #0
	bl DrawUiGaugeBitmapBonusColumn
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bne _0807F80E
_0807F820:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r7, r0
	mov r0, r8
	adds r2, r6, #0
	movs r3, #1
	bl ApplyBitmap
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F840: .4byte 0x02020140
_0807F844: .4byte 0x001FFFFF
