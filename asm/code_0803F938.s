	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803F938
sub_0803F938: @ 0x0803F938
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803F94C @ =sub_0803F8D8
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0803F94C: .4byte sub_0803F8D8
