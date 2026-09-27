	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080971E8
sub_080971E8: @ 0x080971E8
	push {lr}
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r1, r0, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowSysHandCursor
	pop {r0}
	bx r0
	.align 2, 0
