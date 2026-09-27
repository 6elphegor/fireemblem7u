	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C1C0
sub_0802C1C0: @ 0x0802C1C0
	push {lr}
	movs r0, #3
	bl sub_08024A88
	pop {r0}
	bx r0
