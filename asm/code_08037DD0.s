	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037DD0
sub_08037DD0: @ 0x08037DD0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037E20
	ldr r3, _08037E14 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08037EBC
	ldr r2, _08037E18 @ =0x03004690
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08037EBC
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08037E1C @ =0x030013B0
	movs r0, #0
	b _08037EBA
	.align 2, 0
_08037E14: .4byte 0x030013B8
_08037E18: .4byte 0x03004690
_08037E1C: .4byte 0x030013B0
_08037E20:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl AiFindPillageLocation
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08037EB0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r4, _08037EA0 @ =0x0203A97C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiLocationIsPillageTarget
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037EBC
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AiSetDecision
	ldr r3, _08037EA4 @ =0x030013B8
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _08037EBC
	ldr r2, _08037EA8 @ =0x03004690
	ldr r0, [r2]
	adds r0, #0x46
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08037EBC
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08037EAC @ =0x030013B0
	strb r4, [r0]
	b _08037EBC
	.align 2, 0
_08037EA0: .4byte 0x0203A97C
_08037EA4: .4byte 0x030013B8
_08037EA8: .4byte 0x03004690
_08037EAC: .4byte 0x030013B0
_08037EB0:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08037EC4 @ =0x030013B0
	movs r0, #0
_08037EBA:
	strb r0, [r1]
_08037EBC:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037EC4: .4byte 0x030013B0
