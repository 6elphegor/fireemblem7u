	.include "macro.inc"

	.syntax unified

	thumb_func_start Prep_ShowDeployableTiles
Prep_ShowDeployableTiles: @ 0x0803034C
	push {r4, r5, lr}
	bl sub_08079280
	adds r4, r0, #0
	ldr r5, _080303A0 @ =0x0202E3E8
	ldr r0, [r5]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080303A4 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	bl CalcForceDeployedUnitCounts
	lsls r0, r0, #4
	adds r4, r4, r0
	ldrb r0, [r4]
	cmp r0, #0
	beq _08030394
	adds r3, r5, #0
	movs r2, #1
_0803037C:
	ldr r1, [r3]
	ldrb r5, [r4, #7]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r1, [r4, #6]
	adds r0, r1, r0
	strb r2, [r0]
	adds r4, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803037C
_08030394:
	movs r0, #0x10
	bl DisplayMoveRangeGraphics
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080303A0: .4byte 0x0202E3E8
_080303A4: .4byte 0x0202E3E4
