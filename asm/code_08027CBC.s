	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027CBC
sub_08027CBC: @ 0x08027CBC
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08027CEC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027CF0 @ =0x08B95B78
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027CF4 @ =0x0000072A
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027CEC: .4byte 0x0202E3E4
_08027CF0: .4byte 0x08B95B78
_08027CF4: .4byte 0x0000072A
