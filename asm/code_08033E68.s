	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleForecast_LoopDisplay
BattleForecast_LoopDisplay: @ 0x08033E68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08033EB0
	bl GetBattleForecastPanelSide
	adds r1, r0, #0
	cmp r1, #0
	beq _08033EA0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08033EA0
	adds r0, r4, #0
	bl Proc_Break
	b _08033ECC
_08033EA0:
	adds r0, r4, #0
	bl DrawBattleForecastContents
	adds r0, r4, #0
	bl PutBattleForecastTilemaps
	bl InitBattleForecastFramePalettes
_08033EB0:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #1
	bne _08033ECC
	adds r0, r4, #0
	bl PutBattleForecastWeaponTriangleArrows
	adds r0, r4, #0
	bl PutBattleForecastMultipliers
	adds r0, r4, #0
	bl UpdateBattleForecastEffectivenessPalettes
_08033ECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
