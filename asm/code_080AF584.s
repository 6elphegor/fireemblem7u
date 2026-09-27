	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF584
sub_080AF584: @ 0x080AF584
	push {lr}
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
