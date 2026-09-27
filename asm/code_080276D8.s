	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUseSpecialDance
DoUseSpecialDance: @ 0x080276D8
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _0802770C @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027710 @ =0x08B95BD8
	ldr r1, _08027714 @ =StaffSelectOnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802770C: .4byte 0x0202E3E4
_08027710: .4byte 0x08B95BD8
_08027714: .4byte StaffSelectOnSelect
