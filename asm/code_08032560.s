	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubtitleHelp
StartSubtitleHelp: @ 0x08032560
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08032594 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #1
	beq _0803258C
	ldr r0, _08032598 @ =0x08B96A14
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	bl InitSubtitleHelpText
	bl sub_08019B40
	ldr r1, _0803259C @ =0x0202BBB8
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
_0803258C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032594: .4byte 0x0202BBF8
_08032598: .4byte 0x08B96A14
_0803259C: .4byte 0x0202BBB8
