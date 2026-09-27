	.include "macro.inc"

	.syntax unified

	thumb_func_start SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x0808E1B0
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0808E274 @ =0x020106DC
	bl InitUnitStack
	movs r5, #1
_0808E1C2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E1FC
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E1FC
	ldr r0, [r4, #0xc]
	ldr r1, _0808E278 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E1FC
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E1FC
	adds r0, r4, #0
	bl PushUnit
_0808E1FC:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E1C2
	movs r5, #1
_0808E204:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E236
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E236
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E230
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808E236
_0808E230:
	adds r0, r4, #0
	bl PushUnit
_0808E236:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E204
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_0808E242:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E29A
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E29A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E29A
	adds r0, r4, #0
	bl SomeLeftoverFunctionThatReturns0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E280
	ldr r0, [r4, #0xc]
	ldr r1, _0808E27C @ =0x02000008
	b _0808E296
	.align 2, 0
_0808E274: .4byte 0x020106DC
_0808E278: .4byte 0xFDFFFFFF
_0808E27C: .4byte 0x02000008
_0808E280:
	cmp r7, r6
	ble _0808E292
	ldr r0, [r4, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _0808E29A
_0808E292:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0808E296:
	orrs r0, r1
	str r0, [r4, #0xc]
_0808E29A:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808E242
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
