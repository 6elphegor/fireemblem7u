	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA354
sub_080AA354: @ 0x080AA354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA374 @ =0x08CE4C80
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA378 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA374: .4byte 0x08CE4C80
_080AA378: .4byte 0x0000FFFF
