	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080096BC
sub_080096BC: @ 0x080096BC
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #2
	ldr r2, _080096D0 @ =0x44444444
	movs r1, #0x1a
	bl CleanTalkObjects
	pop {r0}
	bx r0
	.align 2, 0
_080096D0: .4byte 0x44444444
