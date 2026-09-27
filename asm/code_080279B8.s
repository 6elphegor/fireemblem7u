	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUseWarpStaff
DoUseWarpStaff: @ 0x080279B8
	push {r4, lr}
	bl MakeTargetListForWarp
	ldr r0, _080279FC @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027A00 @ =0x08B95BD8
	ldr r1, _08027A04 @ =WarpOnSelectTarget
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08027A08 @ =0x0000072B
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027A0C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080279F4
	ldr r0, _08027A10 @ =0x0000038A
	bl m4aSongNumStart
_080279F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080279FC: .4byte 0x0202E3E4
_08027A00: .4byte 0x08B95BD8
_08027A04: .4byte WarpOnSelectTarget
_08027A08: .4byte 0x0000072B
_08027A0C: .4byte 0x0202BBF8
_08027A10: .4byte 0x0000038A
