	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095508
sub_08095508: @ 0x08095508
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0809546C
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x8c
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
