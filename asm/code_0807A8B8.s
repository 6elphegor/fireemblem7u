	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A8B8
sub_0807A8B8: @ 0x0807A8B8
	push {r4, r5, r6, lr}
	movs r4, #0x41
_0807A8BC:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A8D4
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A8D4
	adds r0, r1, #0
	bl ClearUnit
_0807A8D4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A8BC
	movs r5, #1
	movs r6, #0
_0807A8DE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807A91E
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A91E
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _0807A934 @ =0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_0807A91E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807A8DE
	bl RefreshEntityMaps
	bl EndAllMus
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A934: .4byte 0x0671E00C
