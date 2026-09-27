	.include "macro.inc"

	.syntax unified

	thumb_func_start WritePidStats
WritePidStats: @ 0x0809FAEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FB08 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _0809FB0C @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB08: .4byte 0x0203E7A0
_0809FB0C: .4byte 0x0203E79C
