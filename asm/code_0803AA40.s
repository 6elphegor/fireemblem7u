	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803AA40
sub_0803AA40: @ 0x0803AA40
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
