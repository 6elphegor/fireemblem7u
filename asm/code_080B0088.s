	.include "macro.inc"

	.syntax unified

	thumb_func_start StartClassAnimDisplay
StartClassAnimDisplay: @ 0x080B0088
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B00A4 @ =0x08CE5F90
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B00A4: .4byte 0x08CE5F90
