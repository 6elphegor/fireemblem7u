	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08032770
sub_08032770: @ 0x08032770
	push {lr}
	adds r1, r0, #0
	ldr r0, _08032794 @ =0x08B96A54
	bl Proc_StartBlocking
	movs r1, #0
	str r1, [r0, #0x2c]
	bl InitSubtitleHelpText
	bl sub_08019B40
	ldr r1, _08032798 @ =0x0202BBB8
	ldrh r0, [r1, #0x2a]
	adds r0, #0x10
	strh r0, [r1, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_08032794: .4byte 0x08B96A54
_08032798: .4byte 0x0202BBB8
