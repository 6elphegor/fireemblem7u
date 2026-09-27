	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057F08
sub_08057F08: @ 0x08057F08
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057F34 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057F38 @ =0x08BA19A4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057F3C @ =0x081E81AC
	str r1, [r0, #0x48]
	ldr r1, _08057F40 @ =0x0820D584
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057F34: .4byte 0x0201774C
_08057F38: .4byte 0x08BA19A4
_08057F3C: .4byte 0x081E81AC
_08057F40: .4byte 0x0820D584
