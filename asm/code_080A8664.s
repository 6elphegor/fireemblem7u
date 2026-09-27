	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A8664
sub_080A8664: @ 0x080A8664
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8678 @ =0x08CE4930
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A8678: .4byte 0x08CE4930
