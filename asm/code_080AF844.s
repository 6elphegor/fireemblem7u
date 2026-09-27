	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF844
sub_080AF844: @ 0x080AF844
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080AF860 @ =0x08CE5F48
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AF860: .4byte 0x08CE5F48
