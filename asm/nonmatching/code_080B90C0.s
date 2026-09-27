	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B90C0
sub_080B90C0: @ 0x080B90C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080B9110 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B9114 @ =0x08401404
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B9118 @ =0x083FF780
	ldr r1, _080B911C @ =0x06004000
	bl Decompress
	ldr r0, _080B9120 @ =0x02023C60
	ldr r1, _080B9124 @ =0x081B98E8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9110: .4byte 0x03002870
_080B9114: .4byte 0x08401404
_080B9118: .4byte 0x083FF780
_080B911C: .4byte 0x06004000
_080B9120: .4byte 0x02023C60
_080B9124: .4byte 0x081B98E8
