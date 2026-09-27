	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_OnHBlank
PrepItemScreen_OnHBlank: @ 0x08091324
	ldr r0, _0809134C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08091334
	movs r2, #0
_08091334:
	cmp r2, #0
	bne _0809133E
	ldr r1, _08091350 @ =0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_0809133E:
	cmp r2, #0x48
	bne _08091348
	ldr r1, _08091350 @ =0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_08091348:
	bx lr
	.align 2, 0
_0809134C: .4byte 0x04000006
_08091350: .4byte 0x04000012
