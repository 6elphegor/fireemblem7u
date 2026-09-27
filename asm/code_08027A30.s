	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUsePutTrap
DoUsePutTrap: @ 0x08027A30
	push {r4, r5, lr}
	adds r5, r2, #0
	bl _call_via_r1
	ldr r0, _08027A74 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027A78 @ =0x08B95BB8
	ldr r1, _08027A7C @ =OnSelectPutTrap
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	adds r0, r5, #0
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027A80 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027A6E
	ldr r0, _08027A84 @ =0x0000038A
	bl m4aSongNumStart
_08027A6E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08027A74: .4byte 0x0202E3E4
_08027A78: .4byte 0x08B95BB8
_08027A7C: .4byte OnSelectPutTrap
_08027A80: .4byte 0x0202BBF8
_08027A84: .4byte 0x0000038A
