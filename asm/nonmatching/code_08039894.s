	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryMoveTowardsEscape
AiTryMoveTowardsEscape: @ 0x08039894
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _08039904 @ =0x03004690
	ldr r0, [r6]
	movs r1, #0x7c
	bl MapFloodUnitMovement
	bl GetEscapePointStructThingMaybe
	adds r4, r0, #0
	cmp r4, #0
	beq _08039930
	ldrb r5, [r4, #1]
	ldr r0, _08039908 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _08039910
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r1, _0803990C @ =0x0203A97C
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl AiSetDecision
	movs r0, #1
	b _08039932
	.align 2, 0
_08039904: .4byte 0x03004690
_08039908: .4byte 0x0202E3E4
_0803990C: .4byte 0x0203A97C
_08039910:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r0, _0803992C @ =0x0203A97C
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08039932
	.align 2, 0
_0803992C: .4byte 0x0203A97C
_08039930:
	movs r0, #0
_08039932:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
