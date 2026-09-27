	.include "macro.inc"

	.syntax unified

	thumb_func_start AiMakeMoveRangeUnitPowerMaps
AiMakeMoveRangeUnitPowerMaps: @ 0x080366F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitPower
	cmp r0, #0x14
	bgt _08036706
	adds r0, r4, #0
	bl GetUnitPower
	adds r7, r0, #0
	b _08036708
_08036706:
	movs r7, #0x14
_08036708:
	adds r0, r4, #0
	bl RevertMapChange
	ldr r0, _08036764 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08036768 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803675C
_08036724:
	ldr r0, _08036768 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08036756
_08036732:
	ldr r0, _0803676C @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08036750
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl MapAddInRange
_08036750:
	subs r4, #1
	cmp r4, #0
	bge _08036732
_08036756:
	adds r5, r6, #0
	cmp r5, #0
	bge _08036724
_0803675C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036764: .4byte 0x0202E3E8
_08036768: .4byte 0x0202E3D8
_0803676C: .4byte 0x0202E3E4
