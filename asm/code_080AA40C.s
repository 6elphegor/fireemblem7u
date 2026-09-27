	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AA40C
sub_080AA40C: @ 0x080AA40C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA42C @ =0x08CE4C50
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AA430 @ =0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA42C: .4byte 0x08CE4C50
_080AA430: .4byte 0x0000FFFF
