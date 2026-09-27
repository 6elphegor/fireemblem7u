	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteSoundRoomSaveData
WriteSoundRoomSaveData: @ 0x0809F6E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl Checksum16
	strh r0, [r4, #0x20]
	ldr r0, _0809F708 @ =0x08CE3B58
	ldr r1, [r0]
	ldr r0, _0809F70C @ =0x000070FC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F708: .4byte 0x08CE3B58
_0809F70C: .4byte 0x000070FC
