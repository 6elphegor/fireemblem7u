	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetMuAnims
ResetMuAnims: @ 0x0806CE40
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806CE4A:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806CE52
	b _0806CEAC
_0806CE52:
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806CEA0
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806CEA8 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
_0806CEA0:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806CE4A
	.align 2, 0
_0806CEA8: .4byte 0x030014E8
_0806CEAC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
