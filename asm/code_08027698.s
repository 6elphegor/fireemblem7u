	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUseRescueStaff
DoUseRescueStaff: @ 0x08027698
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _080276C8 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _080276CC @ =0x08B95BD8
	ldr r1, _080276D0 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _080276D4 @ =0x0000072C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080276C8: .4byte 0x0202E3E4
_080276CC: .4byte 0x08B95BD8
_080276D0: .4byte StaffSelectOnSelect
_080276D4: .4byte 0x0000072C
