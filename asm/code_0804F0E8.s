	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804F0E8
sub_0804F0E8: @ 0x0804F0E8
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
