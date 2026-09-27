	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLockingPaletteFadeFromBlack
StartLockingPaletteFadeFromBlack: @ 0x080AA2E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA304 @ =0x08CE4C50
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA304: .4byte 0x08CE4C50
