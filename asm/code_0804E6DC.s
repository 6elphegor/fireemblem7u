	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E6DC
sub_0804E6DC: @ 0x0804E6DC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	bne _0804E72C
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _0804E72C
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl SetBgOffset
	lsls r4, r4, #1
	ldr r0, _0804E734 @ =0x0201C906
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _0804E738 @ =0x02023C60
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
_0804E72C:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E734: .4byte 0x0201C906
_0804E738: .4byte 0x02023C60
