	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D368
sub_0807D368: @ 0x0807D368
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807D36E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807D3A4
	ldr r3, [r2]
	cmp r3, #0
	beq _0807D3A4
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D3A4
	ldrb r1, [r3, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807D39A
	cmp r1, #0x2d
	bne _0807D3A4
_0807D39A:
	movs r0, #8
	ldrsb r0, [r2, r0]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807D3A4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807D36E
	cmp r5, #0x31
	bhi _0807D3B2
	movs r0, #0
	b _0807D3B4
_0807D3B2:
	movs r0, #1
_0807D3B4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
