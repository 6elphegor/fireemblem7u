	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_808F084
CgText_808F084: @ 0x08087B58
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl GetBgTilemap
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0xf
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
