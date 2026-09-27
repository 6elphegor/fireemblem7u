	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_02_ChangeAi
AiScriptCmd_02_ChangeAi: @ 0x08037818
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08037878 @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq _0803783C
	ldr r1, _0803787C @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
_0803783C:
	cmp r4, #0xff
	beq _08037850
	ldr r1, _0803787C @ =0x03004690
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
_08037850:
	ldr r0, _08037880 @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _0803785C
	cmp r6, #0xff
	beq _08037864
_0803785C:
	cmp r0, #1
	bne _0803786A
	cmp r7, #0xff
	bne _0803786A
_08037864:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803786A:
	ldr r0, _08037884 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037878: .4byte 0x030013B8
_0803787C: .4byte 0x03004690
_08037880: .4byte 0x030013B4
_08037884: .4byte 0x0203A8EC
