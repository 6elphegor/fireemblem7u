	.include "macro.inc"

	.syntax unified

	thumb_func_start AiSimulateBestBallistaBattleAgainstTarget
AiSimulateBestBallistaBattleAgainstTarget: @ 0x08038E64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r3, #0
	ldr r0, _08038F14 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08038F04
_08038E84:
	ldr r0, _08038F14 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _08038EFE
	lsls r6, r5, #2
_08038E96:
	ldr r0, _08038F18 @ =0x0202E3E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0x78
	bhi _08038EF8
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r2, sb
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _08038EF8
	ldr r0, _08038F1C @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08038EF8
	ldr r0, _08038F20 @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08038EE0
	ldr r0, _08038F24 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _08038EF8
_08038EE0:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl AiGetCombatPositionScore
	ldr r3, [sp]
	cmp r0, r3
	bls _08038EF8
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_08038EF8:
	subs r4, #1
	cmp r4, #0
	bge _08038E96
_08038EFE:
	mov r5, r8
	cmp r5, #0
	bge _08038E84
_08038F04:
	cmp r3, #0
	beq _08038F28
	adds r0, r7, #0
	bl AiSimulateBattleAgainstTargetAtPosition
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08038F2A
	.align 2, 0
_08038F14: .4byte 0x0202E3D8
_08038F18: .4byte 0x0202E3E4
_08038F1C: .4byte 0x0202E3E8
_08038F20: .4byte 0x0202E3DC
_08038F24: .4byte 0x0202BD48
_08038F28:
	movs r0, #0
_08038F2A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
