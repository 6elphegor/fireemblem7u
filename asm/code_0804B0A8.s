	.include "macro.inc"

	.syntax unified

	thumb_func_start GetLinkedTargetsNear
GetLinkedTargetsNear: @ 0x0804B0A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _0804B13C @ =0x0203DFF8
	mov sb, r0
	ldr r1, _0804B140 @ =0x0203DCF4
	mov r8, r1
	ldr r3, _0804B144 @ =0x08B9A964
	mov sl, r3
_0804B0C6:
	mov r6, r8
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r4, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	str r2, [sp]
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #1
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	movs r1, #0
	ldr r3, _0804B148 @ =0x0203DCF8
	mov r6, sb
	ldr r0, [r6]
	adds r4, #1
	cmp r1, r0
	bge _0804B120
	mov ip, sb
_0804B0F2:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r6, [sp]
	cmp r6, r0
	bne _0804B114
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _0804B114
	str r5, [r3, #4]
	cmp r5, #0
	beq _0804B10C
	str r3, [r5, #8]
_0804B10C:
	cmp r7, #0
	bne _0804B112
	adds r7, r3, #0
_0804B112:
	adds r5, r3, #0
_0804B114:
	adds r1, #1
	adds r3, #0xc
	mov r6, ip
	ldr r0, [r6]
	cmp r1, r0
	blt _0804B0F2
_0804B120:
	cmp r4, #0xc
	ble _0804B0C6
	str r5, [r7, #4]
	str r7, [r5, #8]
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804B13C: .4byte 0x0203DFF8
_0804B140: .4byte 0x0203DCF4
_0804B144: .4byte 0x08B9A964
_0804B148: .4byte 0x0203DCF8
