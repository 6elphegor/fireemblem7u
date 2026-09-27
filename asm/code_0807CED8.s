	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CED8
sub_0807CED8: @ 0x0807CED8
	push {lr}
	movs r0, #0xf
	movs r1, #0x15
	movs r2, #2
	bl UpdateBestGlobalSupportValue
	pop {r0}
	bx r0
