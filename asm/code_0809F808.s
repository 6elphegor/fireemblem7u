	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteLinkArenaStruct2
WriteLinkArenaStruct2: @ 0x0809F808
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl Checksum16
	strh r0, [r4, #0x10]
	ldr r0, _0809F82C @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F830 @ =0x00007120
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F82C: .4byte 0x08CE3B58
_0809F830: .4byte 0x00007120
