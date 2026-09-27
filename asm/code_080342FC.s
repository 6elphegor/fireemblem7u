	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080342FC
sub_080342FC: @ 0x080342FC
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl StartFireTrapAnim2
	pop {r0}
	bx r0
	.align 2, 0
