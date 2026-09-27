	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateDisplayedTrapDamageTargets
GenerateDisplayedTrapDamageTargets: @ 0x0802C058
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	ldr r4, _0802C068 @ =0x0203A518
	b _0802C148
	.align 2, 0
_0802C068: .4byte 0x0203A518
_0802C06C:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802C146
	ldrb r3, [r4, #2]
	cmp r3, #5
	beq _0802C0C4
	cmp r3, #5
	bgt _0802C084
	cmp r3, #4
	beq _0802C08E
	b _0802C146
_0802C084:
	cmp r3, #6
	beq _0802C12E
	cmp r3, #7
	beq _0802C114
	b _0802C146
_0802C08E:
	ldrb r2, [r4, #1]
	ldr r0, _0802C0C0 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C146
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #4
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802C146
	.align 2, 0
_0802C0C0: .4byte 0x0202E3DC
_0802C0C4:
	ldrb r2, [r4, #3]
	cmp r2, #1
	beq _0802C0E8
	cmp r2, #1
	bgt _0802C0D4
	cmp r2, #0
	beq _0802C0E4
	b _0802C0EA
_0802C0D4:
	cmp r2, #2
	beq _0802C0E0
	cmp r2, #3
	bne _0802C0EA
	movs r5, #0x64
	b _0802C0EA
_0802C0E0:
	movs r5, #0x65
	b _0802C0EA
_0802C0E4:
	movs r5, #0x66
	b _0802C0EA
_0802C0E8:
	movs r5, #0x67
_0802C0EA:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl ShouldSkipGasTrapDisplay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C146
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	adds r3, r5, #0
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
	b _0802C146
_0802C114:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	movs r3, #7
	bl EnlistTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802C146
_0802C12E:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802C138
	ldrb r0, [r4]
	b _0802C13A
_0802C138:
	ldrb r0, [r4, #1]
_0802C13A:
	ldr r1, _0802C154 @ =0x0203A518
	subs r1, r4, r1
	asrs r1, r1, #3
	movs r2, #0
	bl EnlistTarget
_0802C146:
	adds r4, #8
_0802C148:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C06C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C154: .4byte 0x0203A518
