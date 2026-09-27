	.include "macro.inc"

	.syntax unified

	thumb_func_start DoUseRepairStaff
DoUseRepairStaff: @ 0x08027AE8
	push {r4, lr}
	bl MakeTargetListForHammerne
	ldr r0, _08027B28 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _08027B2C @ =0x08B95C58
	bl StartMapSelect
	adds r4, r0, #0
	ldr r0, _08027B30 @ =0x0000072E
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl StartSubtitleHelp
	ldr r0, _08027B34 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08027B22
	ldr r0, _08027B38 @ =0x0000038A
	bl m4aSongNumStart
_08027B22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B28: .4byte 0x0202E3E4
_08027B2C: .4byte 0x08B95C58
_08027B30: .4byte 0x0000072E
_08027B34: .4byte 0x0202BBF8
_08027B38: .4byte 0x0000038A
