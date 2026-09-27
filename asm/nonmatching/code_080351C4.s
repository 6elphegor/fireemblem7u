	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_BeginUnitMovement
CpPerform_BeginUnitMovement: @ 0x080351C4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _08035228 @ =0x03004690
	ldr r0, [r6]
	bl UnitBeginAction
	ldr r0, [r6]
	bl HideUnitSprite
	ldr r0, [r6]
	bl RevertMapChange
	ldr r0, _0803522C @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r4, _08035230 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	ldr r7, _08035234 @ =0x02033E00
	adds r2, r7, #0
	bl BuildBestMoveScript
	ldr r0, [r6]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl UnitApplyWorkingMovementScript
	ldr r1, _08035238 @ =0x0203A85C
	ldrb r0, [r1, #0xe]
	strb r0, [r4, #2]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #3]
	adds r5, #0x31
	ldrb r0, [r5]
	cmp r0, #0
	beq _08035222
	ldr r0, [r6]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	adds r0, r7, #0
	bl SetAutoMuMoveScript
_08035222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035228: .4byte 0x03004690
_0803522C: .4byte 0x0202E3E4
_08035230: .4byte 0x0203A97C
_08035234: .4byte 0x02033E00
_08035238: .4byte 0x0203A85C
