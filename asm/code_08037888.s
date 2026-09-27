	.include "macro.inc"

	.syntax unified

	thumb_func_start AiScriptCmd_03_Goto
AiScriptCmd_03_Goto: @ 0x08037888
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _080378A8 @ =0x030013B8
	ldr r0, [r0]
	ldrb r3, [r0, #3]
	movs r2, #0
	ldr r0, _080378AC @ =0x030013B4
	ldr r0, [r0]
	cmp r0, #0
	bne _080378B8
	ldr r1, _080378B0 @ =0x08B989F0
	ldr r0, _080378B4 @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x42
	b _080378C0
	.align 2, 0
_080378A8: .4byte 0x030013B8
_080378AC: .4byte 0x030013B4
_080378B0: .4byte 0x08B989F0
_080378B4: .4byte 0x03004690
_080378B8:
	ldr r1, _080378D8 @ =0x08B989E4
	ldr r0, _080378DC @ =0x03004690
	ldr r0, [r0]
	adds r0, #0x44
_080378C0:
	ldr r1, [r1]
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r3, #0
	beq _08037900
	lsls r0, r2, #4
	adds r0, r0, r1
	ldr r5, _080378E0 @ =0x030013B0
	b _080378EE
	.align 2, 0
_080378D8: .4byte 0x08B989E4
_080378DC: .4byte 0x03004690
_080378E0: .4byte 0x030013B0
_080378E4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r0, r2, #4
	adds r0, r0, r1
_080378EE:
	ldrb r6, [r0]
	cmp r6, #0x1b
	bne _080378E4
	ldrb r0, [r0, #3]
	cmp r0, r3
	bne _080378E4
	adds r0, r2, #1
	strb r0, [r4]
	b _08037904
_08037900:
	strb r3, [r4]
	ldr r5, _08037910 @ =0x030013B0
_08037904:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037910: .4byte 0x030013B0
