	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateTrapDamageTargets
GenerateTrapDamageTargets: @ 0x0802BFEC
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802BFFC @ =0x0203A518
	b _0802C04A
	.align 2, 0
_0802BFFC: .4byte 0x0203A518
_0802C000:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C048
	ldrb r0, [r4, #2]
	cmp r0, #5
	beq _0802C03A
	cmp r0, #5
	bgt _0802C018
	cmp r0, #4
	beq _0802C01E
	b _0802C048
_0802C018:
	cmp r0, #7
	beq _0802C02C
	b _0802C048
_0802C01E:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802C048
_0802C02C:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802C048
_0802C03A:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
_0802C048:
	adds r4, #8
_0802C04A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C000
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
