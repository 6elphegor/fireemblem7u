	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBonusClaimHelpBox
StartBonusClaimHelpBox: @ 0x080AACB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080AACD4 @ =0x08CE4CF8
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACD4: .4byte 0x08CE4CF8
