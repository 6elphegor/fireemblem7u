	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080234F4
sub_080234F4: @ 0x080234F4
	push {r4, lr}
	ldr r1, _08023518 @ =0x0203A85C
	movs r0, #0x1e
	strb r0, [r1, #0x11]
	ldr r4, _0802351C @ =0x03004690
	ldr r0, [r4]
	bl RideBallista
	bl EndAllMus
	ldr r0, [r4]
	bl StartMu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023518: .4byte 0x0203A85C
_0802351C: .4byte 0x03004690
