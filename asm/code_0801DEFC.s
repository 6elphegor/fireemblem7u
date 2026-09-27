	.include "macro.inc"

	.syntax unified

	thumb_func_start StartEquipInfoWindow
StartEquipInfoWindow: @ 0x0801DEFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r4, _0801DFB4 @ =0x08B936EC
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _0801DFAA
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x2c]
	adds r0, #0x30
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x32
	movs r0, #3
	strb r0, [r5]
	adds r0, r6, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xc
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0xc
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xc
	bl InitTextDb
	ldrb r1, [r5]
	movs r0, #1
	bl ApplyIconPalette
	ldr r0, [r4, #0x2c]
	movs r1, #1
	rsbs r1, r1, #0
	bl BattleGenerateUiStats
	ldr r3, _0801DFB8 @ =0x0203A470
	ldr r2, _0801DFBC @ =0x0203A3F0
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801DFAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFB4: .4byte 0x08B936EC
_0801DFB8: .4byte 0x0203A470
_0801DFBC: .4byte 0x0203A3F0
