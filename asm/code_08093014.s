	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUpdateMenuTsaScroll
PrepUpdateMenuTsaScroll: @ 0x08093014
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08093038 @ =0x02023C80
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_08093038: .4byte 0x02023C80
