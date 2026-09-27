	.include "macro.inc"

	.syntax unified

	thumb_func_start HideAllAlliesExceptLeader
HideAllAlliesExceptLeader: @ 0x0807A7D8
	push {r4, r5, r6, r7, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0807A7EE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A824
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A824
	cmp r2, r5
	beq _0807A824
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _0807A824
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0807A824
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0807A824
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807A824:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A7EE
	bl RefreshUnitSprites
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
