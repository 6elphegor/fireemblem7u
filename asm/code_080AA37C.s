	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA37C
sub_080AA37C: @ 0x080AA37C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA39C @ =0x08CE4C50
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA39C: .4byte 0x08CE4C50
