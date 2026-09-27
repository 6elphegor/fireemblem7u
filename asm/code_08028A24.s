	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitSupportBonuses
ComputeBattleUnitSupportBonuses: @ 0x08028A24
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _08028A90 @ =0x0203A3D8
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028A3E
	ldr r0, _08028A94 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _08028A86
_08028A3E:
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl GetUnitSupportBonuses
	adds r1, r5, #0
	adds r1, #0x5a
	ldrb r0, [r4, #1]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r4, #2]
	ldrh r3, [r1]
	adds r0, r3, r0
	strh r0, [r1]
	adds r1, #4
	ldrb r0, [r4, #3]
	ldrh r2, [r1]
	adds r0, r2, r0
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r2, [r4, #4]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #4
	ldrh r3, [r1]
	ldrb r2, [r4, #5]
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r3, [r1]
	ldrb r4, [r4, #6]
	adds r0, r3, r4
	strh r0, [r1]
_08028A86:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028A90: .4byte 0x0203A3D8
_08028A94: .4byte 0x0202BBF8
