	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080489C0
sub_080489C0: @ 0x080489C0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080489E0 @ =0x08B9A530
	adds r1, r3, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080489E0: .4byte 0x08B9A530
