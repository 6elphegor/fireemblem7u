	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057BB8
sub_08057BB8: @ 0x08057BB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057BE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057BE8 @ =0x08BA18EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057BEC @ =0x081E808C
	str r1, [r0, #0x48]
	ldr r1, _08057BF0 @ =0x0827C008
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057BE4: .4byte 0x0201774C
_08057BE8: .4byte 0x08BA18EC
_08057BEC: .4byte 0x081E808C
_08057BF0: .4byte 0x0827C008
