	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027DD0
sub_08027DD0: @ 0x08027DD0
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027E00 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027E04 @ =0x08B95B18
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027E08 @ =0x00000731
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027E00: .4byte 0x0202E3E4
_08027E04: .4byte 0x08B95B18
_08027E08: .4byte 0x00000731
