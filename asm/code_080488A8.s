	.include "macro.inc"

	.syntax unified

	thumb_func_start StartRuleSettingSpriteDrawInteractive
StartRuleSettingSpriteDrawInteractive: @ 0x080488A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080488C8 @ =0x08B9A518
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080488C8: .4byte 0x08B9A518
