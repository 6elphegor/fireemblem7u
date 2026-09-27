	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08027E9C
sub_08027E9C: @ 0x08027E9C
	push {r4, lr}
	ldr r0, _08027EBC @ =0x08B95BD8
	ldr r1, _08027EC0 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08027EC4 @ =0x0000072C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027EBC: .4byte 0x08B95BD8
_08027EC0: .4byte StaffSelectOnSelect
_08027EC4: .4byte 0x0000072C
