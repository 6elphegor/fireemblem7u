	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintFxBg2_Loop
QuintFxBg2_Loop: @ 0x0807C028
	push {lr}
	ldr r2, [r0, #0x58]
	adds r2, #1
	str r2, [r0, #0x58]
	lsls r1, r2, #0xe
	lsrs r1, r1, #0x10
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0
