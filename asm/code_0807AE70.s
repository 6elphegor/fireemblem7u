	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonGatefx_DistortionHandler
DragonGatefx_DistortionHandler: @ 0x0807AE70
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #8
	movs r3, #3
	bl sub_08076F44
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #3
	bl GetBgXOffset
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #8
	movs r3, #3
	bl sub_08076FC4
	bl SwapScanlineBufs
	adds r4, #0x64
	ldrh r4, [r4]
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
