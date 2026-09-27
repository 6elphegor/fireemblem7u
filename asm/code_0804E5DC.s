	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E5DC
sub_0804E5DC: @ 0x0804E5DC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _0804E644 @ =0x0201FB00
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
	beq _0804E622
	ldr r0, [r5]
	bl sub_080554FC
_0804E622:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804E63C
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0804E63C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E644: .4byte 0x0201FB00
