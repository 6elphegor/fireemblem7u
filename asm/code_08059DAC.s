	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059DAC
sub_08059DAC: @ 0x08059DAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08059DD4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059DD8 @ =0x08BA221C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059DD4: .4byte 0x0201774C
_08059DD8: .4byte 0x08BA221C
