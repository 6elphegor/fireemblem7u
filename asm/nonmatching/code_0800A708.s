	.include "macro.inc"

	.syntax unified

	thumb_func_start FakeLoadUnit
FakeLoadUnit: @ 0x0800A708
	push {lr}
	movs r2, #0
	movs r3, #0
	bl sub_0800A71C
	bl RefreshEntityMaps
	pop {r0}
	bx r0
	.align 2, 0
