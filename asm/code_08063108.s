	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxKingPika
NewEfxKingPika: @ 0x08063108
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063120 @ =0x08BA4464
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063120: .4byte 0x08BA4464
