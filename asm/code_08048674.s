	.include "macro.inc"

	.syntax unified

	thumb_func_start ScrollMultiArenaTeamSprites
ScrollMultiArenaTeamSprites: @ 0x08048674
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804868C @ =0x08B9A4C0
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804868C: .4byte 0x08B9A4C0
