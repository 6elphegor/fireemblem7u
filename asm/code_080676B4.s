	.include "macro.inc"

	.syntax unified

	thumb_func_start StopBGM1
StopBGM1: @ 0x080676B4
	push {lr}
	ldr r0, _080676C0 @ =0x03005B10
	bl MPlayStop_rev01
	pop {r0}
	bx r0
	.align 2, 0
_080676C0: .4byte 0x03005B10
