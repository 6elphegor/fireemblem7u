	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059160
sub_08059160: @ 0x08059160
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805917C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059180 @ =0x08BA1DAC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805917C: .4byte 0x0201774C
_08059180: .4byte 0x08BA1DAC
