	.include "macro.inc"

	.syntax unified

	thumb_func_start BuildUnitStandingRangeForReach
BuildUnitStandingRangeForReach: @ 0x0801AC60
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801AC74
	b _0801AE08
_0801AC74:
	lsls r0, r0, #2
	ldr r1, _0801AC80 @ =_0801AC84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801AC80: .4byte _0801AC84
_0801AC84: @ jump table
	.4byte _0801AD04 @ case 0
	.4byte _0801AD1C @ case 1
	.4byte _0801AD0C @ case 2
	.4byte _0801AD44 @ case 3
	.4byte _0801AD6C @ case 4
	.4byte _0801AD30 @ case 5
	.4byte _0801AD14 @ case 6
	.4byte _0801AE08 @ case 7
	.4byte _0801AE08 @ case 8
	.4byte _0801AE08 @ case 9
	.4byte _0801AE08 @ case 10
	.4byte _0801AD58 @ case 11
	.4byte _0801AD9A @ case 12
	.4byte _0801AE08 @ case 13
	.4byte _0801ADC8 @ case 14
	.4byte _0801AE08 @ case 15
	.4byte _0801AE08 @ case 16
	.4byte _0801AE08 @ case 17
	.4byte _0801AE08 @ case 18
	.4byte _0801AE08 @ case 19
	.4byte _0801AE08 @ case 20
	.4byte _0801AE08 @ case 21
	.4byte _0801AE08 @ case 22
	.4byte _0801AE08 @ case 23
	.4byte _0801AE08 @ case 24
	.4byte _0801AE08 @ case 25
	.4byte _0801AE08 @ case 26
	.4byte _0801AE08 @ case 27
	.4byte _0801AE08 @ case 28
	.4byte _0801AE08 @ case 29
	.4byte _0801AE08 @ case 30
	.4byte _0801ADE4 @ case 31
_0801AD04:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADCE
_0801AD0C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADCE
_0801AD14:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801ADCE
_0801AD1C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADDA
_0801AD30:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801ADDA
_0801AD44:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD58:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801AD9A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801ADDA
_0801ADC8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
_0801ADCE:
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801ADDA:
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	b _0801AE08
_0801ADE4:
	adds r0, r2, #0
	bl GetUnitMagRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801AE08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
