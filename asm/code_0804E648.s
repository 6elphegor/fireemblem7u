	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E648
sub_0804E648: @ 0x0804E648
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804E6B0 @ =0x0201FB00
	str r1, [r5]
	adds r0, r4, #0
	bl sub_0804E574
	ldr r0, [r5]
	movs r1, #0
	bl EkrDragonTmCpyExt
	ldr r0, [r5]
	bl sub_0804E6DC
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804E68E
	ldr r0, [r5]
	bl sub_080554FC
_0804E68E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804E6CA
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804E6B8
	ldr r1, _0804E6B4 @ =0x02017744
	movs r0, #1
	b _0804E6BC
	.align 2, 0
_0804E6B0: .4byte 0x0201FB00
_0804E6B4: .4byte 0x02017744
_0804E6B8:
	ldr r1, _0804E6D4 @ =0x02017744
	movs r0, #0
_0804E6BC:
	str r0, [r1]
	ldr r1, _0804E6D8 @ =0x02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E6CA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E6D4: .4byte 0x02017744
_0804E6D8: .4byte 0x02017748
