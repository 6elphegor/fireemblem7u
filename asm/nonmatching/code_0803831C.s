	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_18_TryAttackSnagWall
AiScriptCmd_18_TryAttackSnagWall: @ 0x0803831C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _080383A0 @ =0x03004690
	ldr r0, [r0]
	bl sub_0803C058
	ldr r0, _080383A4 @ =0x08B970C4
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_08038218
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _080383BC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_080380A8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080383A8
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	bne _0803837A
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r1, #1
	bl GetTrapAt
	cmp r0, #0
	beq _080383D0
_0803837A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl AiSetDecision
	b _080383CA
	.align 2, 0
_080383A0: .4byte 0x03004690
_080383A4: .4byte 0x08B970C4
_080383A8:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	b _080383CA
_080383BC:
	ldr r0, _080383D8 @ =0x0203A8EC
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _080383DC @ =0x030013B0
	strb r2, [r0]
_080383CA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_080383D0:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080383D8: .4byte 0x0203A8EC
_080383DC: .4byte 0x030013B0
