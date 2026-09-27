	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080242E8
sub_080242E8: @ 0x080242E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl BeginTargetList
	mov r7, r8
	b _080243A0
_080242FC:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080243A0
	ldr r0, [r5]
	cmp r0, #0
	beq _080243A0
	ldr r0, [r5, #0xc]
	ldr r1, _080243B4 @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080243A0
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _080243B8 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetTerrainHealAmount
	cmp r0, #0
	beq _08024372
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024372
	adds r0, r6, #0
	bl GetTerrainHealAmount
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl EnlistTarget
_08024372:
	adds r0, r6, #0
	bl GetTerrainHealsStatus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080243A0
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080243A0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	rsbs r3, r3, #0
	bl EnlistTarget
_080243A0:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _080242FC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080243B4: .4byte 0x0001002C
_080243B8: .4byte 0x0202E3E0
