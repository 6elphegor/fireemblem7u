	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateMagicSealMap
GenerateMagicSealMap: @ 0x0801B148
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B14E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B182
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B182
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B182
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl MapSetInRange
_0801B182:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B14E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
