	.include "macro.inc"

	.syntax unified

	thumb_func_start TryMakeCantoUnit
TryMakeCantoUnit: @ 0x0801CB98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801CBE8 @ =0x03004690
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CBE4
	ldr r0, [r2, #0xc]
	ldr r1, _0801CBEC @ =0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801CBE4
	ldr r4, _0801CBF0 @ =0x0203A85C
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801CBE4
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble _0801CBE4
	bl CanActiveUnitStillMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CBF4
_0801CBE4:
	movs r0, #0
	b _0801CC46
	.align 2, 0
_0801CBE8: .4byte 0x03004690
_0801CBEC: .4byte 0x00010044
_0801CBF0: .4byte 0x0203A85C
_0801CBF4:
	ldr r0, _0801CC34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	bl UnitBeginCantoAction
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl EndAllMus
	ldr r0, [r5]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	ldr r0, _0801CC38 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801CC3C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0801CC44
	.align 2, 0
_0801CC34: .4byte 0x0202E3E8
_0801CC38: .4byte 0x0202BBF8
_0801CC3C:
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_0801CC44:
	movs r0, #1
_0801CC46:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
