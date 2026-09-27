	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteGlobalSaveInfoNoChecksum
WriteGlobalSaveInfoNoChecksum: @ 0x0809E598
	push {lr}
	ldr r1, _0809E5A8 @ =0x08CE3B58
	ldr r1, [r1]
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_0809E5A8: .4byte 0x08CE3B58
