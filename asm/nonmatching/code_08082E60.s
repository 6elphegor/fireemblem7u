	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082E60
sub_08082E60: @ 0x08082E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08082E7C @ =0x0203E6D4
	movs r3, #0
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	bl sub_08082FD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082E7C: .4byte 0x0203E6D4
