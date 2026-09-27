	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteSaveBlockInfo
WriteSaveBlockInfo: @ 0x0809E7A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r5, #0
	ldr r0, _0809E7D0 @ =0x0000200A
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl GetSaveWriteAddr
	strh r0, [r4, #8]
	cmp r6, #6
	bgt _0809E826
	ldrb r0, [r4, #6]
	cmp r0, #2
	beq _0809E7F4
	cmp r0, #2
	bgt _0809E7D4
	cmp r0, #0
	beq _0809E7DE
	cmp r0, #1
	beq _0809E7E8
	b _0809E826
	.align 2, 0
_0809E7D0: .4byte 0x0000200A
_0809E7D4:
	cmp r0, #3
	beq _0809E800
	cmp r0, #0xff
	beq _0809E808
	b _0809E826
_0809E7DE:
	ldr r0, _0809E7E4 @ =0x00000D8C
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7E4: .4byte 0x00000D8C
_0809E7E8:
	ldr r0, _0809E7F0 @ =0x00001F2C
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7F0: .4byte 0x00001F2C
_0809E7F4:
	ldr r0, _0809E7FC @ =0x00000874
	strh r0, [r4, #0xa]
	b _0809E80E
	.align 2, 0
_0809E7FC: .4byte 0x00000874
_0809E800:
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	b _0809E80E
_0809E808:
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #4]
_0809E80E:
	adds r0, r4, #0
	bl PopulateSaveBlockChecksum
	ldr r0, _0809E82C @ =0x08CE3B58
	lsls r2, r6, #4
	adds r2, #0x64
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
_0809E826:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E82C: .4byte 0x08CE3B58
