	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4328
sub_080B4328: @ 0x080B4328
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r0, #0
	strh r0, [r4, #0x30]
	ldr r5, _080B4378 @ =0x08CE76B0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x3c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x44
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #2
	strb r6, [r0]
	adds r4, #0x48
	strb r6, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4378: .4byte 0x08CE76B0
