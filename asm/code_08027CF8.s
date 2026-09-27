	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027CF8
sub_08027CF8: @ 0x08027CF8
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027D28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027D2C @ =0x08B95B58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027D30 @ =0x0000072D
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027D28: .4byte 0x0202E3E4
_08027D2C: .4byte 0x08B95B58
_08027D30: .4byte 0x0000072D
