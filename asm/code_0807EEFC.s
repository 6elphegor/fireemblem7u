	.include "macro.inc"

	.syntax unified

	thumb_func_start IsAnyLordInCombat
IsAnyLordInCombat: @ 0x0807EEFC
	ldr r0, _0807EF28 @ =0x0203A3F0
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	ldr r0, _0807EF2C @ =0x0203A470
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	subs r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r1, #0x2d
	beq _0807EF24
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0807EF24
	cmp r2, #0x2d
	bne _0807EF30
_0807EF24:
	movs r0, #1
	b _0807EF32
	.align 2, 0
_0807EF28: .4byte 0x0203A3F0
_0807EF2C: .4byte 0x0203A470
_0807EF30:
	movs r0, #0
_0807EF32:
	bx lr
