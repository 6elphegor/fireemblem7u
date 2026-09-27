	.include "macro.inc"

	.syntax unified

	thumb_func_start MuExistsActive
MuExistsActive: @ 0x0806C064
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	movs r0, #0
	str r0, [r7, #4]
_0806C06E:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C076
	b _0806C0B6
_0806C076:
	ldr r0, _0806C0A4 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0806C0AE
	ldr r0, _0806C0A4 @ =0x030014E8
	ldr r1, [r7, #4]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3f
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806C0A8
	b _0806C0AA
	.align 2, 0
_0806C0A4: .4byte 0x030014E8
_0806C0A8:
	b _0806C0AE
_0806C0AA:
	movs r0, #1
	b _0806C0C4
_0806C0AE:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806C06E
_0806C0B6:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806C0C0
	movs r0, #0
	b _0806C0C4
_0806C0C0:
	movs r0, #1
	b _0806C0C4
_0806C0C4:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
