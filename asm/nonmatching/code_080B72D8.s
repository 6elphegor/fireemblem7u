	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B72D8
sub_080B72D8: @ 0x080B72D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	lsls r4, r4, #1
	cmp r4, #0x1f
	ble _080B72F0
	ldr r5, _080B72EC @ =0x0000FE80
	b _080B72F8
	.align 2, 0
_080B72EC: .4byte 0x0000FE80
_080B72F0:
	cmp r4, #0x13
	ble _080B72F8
	movs r5, #0xa0
	lsls r5, r5, #2
_080B72F8:
	lsls r1, r4, #0xa
	ldr r0, _080B7328 @ =0x00007FFF
	ands r1, r0
	ldr r0, _080B732C @ =0x06008000
	adds r1, r1, r0
	adds r0, r3, #0
	bl Decompress
	movs r0, #0x1f
	ands r0, r4
	lsls r0, r0, #6
	ldr r1, _080B7330 @ =0x02024460
	adds r0, r0, r1
	adds r2, r5, #0
	adds r1, r6, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7328: .4byte 0x00007FFF
_080B732C: .4byte 0x06008000
_080B7330: .4byte 0x02024460
