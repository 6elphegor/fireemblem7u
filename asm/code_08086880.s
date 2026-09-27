	.include "macro.inc"

	.syntax unified

	thumb_func_start CountEnemyBossUnits
CountEnemyBossUnits: @ 0x08086880
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08086886:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080868AA
	ldr r1, [r0]
	cmp r1, #0
	beq _080868AA
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080868AA
	adds r5, #1
_080868AA:
	adds r4, #1
	cmp r4, #0xbf
	ble _08086886
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
