	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5D40
sub_080B5D40: @ 0x080B5D40
	push {r4, r5, r6, lr}
	bl GetCG
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl ApplyPaletteExt
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r4, #0
	ldr r5, _080B5D94 @ =0x06008000
_080B5D62:
	ldr r0, [r6, #4]
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r5, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #9
	ble _080B5D62
	ldr r0, _080B5D98 @ =0x02024460
	ldr r1, [r6, #8]
	movs r2, #0
	bl TmApplyTsa_thm
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D94: .4byte 0x06008000
_080B5D98: .4byte 0x02024460
