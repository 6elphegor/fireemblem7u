	.include "macro.inc"

	.syntax unified

	thumb_func_start AiSimulateBestBattleAgainstTarget
AiSimulateBestBattleAgainstTarget: @ 0x08038DA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _08038E40 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08038E2E
_08038DBC:
	ldr r0, _08038E40 @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _08038E28
	lsls r6, r5, #2
_08038DCE:
	ldr r0, _08038E44 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038E22
	ldr r0, _08038E48 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08038E22
	ldr r0, _08038E4C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038E0A
	ldr r0, _08038E50 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08038E22
_08038E0A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetCombatPositionScore
	ldr r3, [sp]
	cmp r0, r3
	bls _08038E22
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_08038E22:
	subs r4, #1
	cmp r4, #0
	bge _08038DCE
_08038E28:
	mov r5, r8
	cmp r5, #0
	bge _08038DBC
_08038E2E:
	cmp r3, #0
	beq _08038E54
	adds r0, r7, #0
	bl AiSimulateBattleAgainstTargetAtPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08038E56
	.align 2, 0
_08038E40: .4byte 0x0202E3D8
_08038E44: .4byte 0x0202E3E4
_08038E48: .4byte 0x0202E3E8
_08038E4C: .4byte 0x0202E3DC
_08038E50: .4byte 0x0202BD48
_08038E54:
	movs r0, #0
_08038E56:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
