	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteGlobalSaveInfo
WriteGlobalSaveInfo: @ 0x0809E570
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x50
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, _0809E594 @ =0x08CE3B58
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E594: .4byte 0x08CE3B58
