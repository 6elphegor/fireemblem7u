	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeTargetListForLatona
MakeTargetListForLatona: @ 0x080249FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl BeginTargetList
	bl GetActiveFactionAlliance
	adds r7, r0, #0
	adds r6, r7, #1
	b _08024A74
_08024A1E:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08024A70
	ldr r0, [r5]
	cmp r0, #0
	beq _08024A70
	ldr r0, [r5, #0xc]
	ldr r1, _08024A84 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024A70
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne _08024A5A
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08024A70
_08024A5A:
	cmp r5, r8
	beq _08024A70
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024A70:
	adds r6, #1
	adds r0, r7, #0
_08024A74:
	adds r0, #0x80
	cmp r6, r0
	blt _08024A1E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024A84: .4byte 0x0001000C
