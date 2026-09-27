	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_ResumeRangeDisplay
PlayerPhase_ResumeRangeDisplay: @ 0x0801CFB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801CFD0 @ =0x03004690
	ldr r2, [r5]
	cmp r2, #0
	bne _0801CFD4
	bl RefreshBMapGraphics
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801D040
	.align 2, 0
_0801CFD0: .4byte 0x03004690
_0801CFD4:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0801D02C @ =0x0202E3DC
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshBMapGraphics
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl GetPlayerSelectKind
	cmp r0, #2
	beq _0801D030
	cmp r0, #3
	beq _0801D038
	b _0801D040
	.align 2, 0
_0801D02C: .4byte 0x0202E3DC
_0801D030:
	ldr r0, [r5]
	bl HideUnitSprite
	b _0801D040
_0801D038:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0801D040:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
