	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleUnwind
BattleUnwind: @ 0x08028FB0
	push {r4, r5, lr}
	sub sp, #8
	bl ClearBattleHits
	add r4, sp, #4
	mov r0, sp
	adds r1, r4, #0
	bl BattleGetBattleUnitOrder
	ldr r5, _08029024 @ =0x0203A50C
	ldr r1, [r5]
	movs r0, #1
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl BattleGenerateRoundHits
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029010
	ldr r1, [r5]
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl BattleGenerateRoundHits
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08029010
	mov r0, sp
	adds r1, r4, #0
	bl BattleGetFollowUpOrder
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029010
	ldr r1, [r5]
	movs r0, #4
	strh r0, [r1]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl BattleGenerateRoundHits
_08029010:
	ldr r0, _08029024 @ =0x0203A50C
	ldr r1, [r0]
	movs r0, #0x80
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029024: .4byte 0x0203A50C
