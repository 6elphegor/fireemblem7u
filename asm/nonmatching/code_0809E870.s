	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSaveWriteAddr
GetSaveWriteAddr: @ 0x0809E870
	cmp r0, #6
	bhi _0809E914
	lsls r0, r0, #2
	ldr r1, _0809E880 @ =_0809E884
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809E880: .4byte _0809E884
_0809E884: @ jump table
	.4byte _0809E8A0 @ case 0
	.4byte _0809E8B4 @ case 1
	.4byte _0809E8C8 @ case 2
	.4byte _0809E8DC @ case 3
	.4byte _0809E8E8 @ case 4
	.4byte _0809E8F8 @ case 5
	.4byte _0809E90C @ case 6
_0809E8A0:
	ldr r0, _0809E8AC @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8B0 @ =0x00003F2C
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8AC: .4byte 0x08CE3B58
_0809E8B0: .4byte 0x00003F2C
_0809E8B4:
	ldr r0, _0809E8C0 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8C4 @ =0x00004CB8
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8C0: .4byte 0x08CE3B58
_0809E8C4: .4byte 0x00004CB8
_0809E8C8:
	ldr r0, _0809E8D4 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E8D8 @ =0x00005A44
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8D4: .4byte 0x08CE3B58
_0809E8D8: .4byte 0x00005A44
_0809E8DC:
	ldr r0, _0809E8E4 @ =0x08CE3B58
	ldr r0, [r0]
	adds r0, #0xd4
	b _0809E916
	.align 2, 0
_0809E8E4: .4byte 0x08CE3B58
_0809E8E8:
	ldr r0, _0809E8F4 @ =0x08CE3B58
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E8F4: .4byte 0x08CE3B58
_0809E8F8:
	ldr r0, _0809E904 @ =0x08CE3B58
	ldr r0, [r0]
	ldr r1, _0809E908 @ =0x000067D0
	adds r0, r0, r1
	b _0809E916
	.align 2, 0
_0809E904: .4byte 0x08CE3B58
_0809E908: .4byte 0x000067D0
_0809E90C:
	ldr r0, _0809E910 @ =0x0E007400
	b _0809E916
	.align 2, 0
_0809E910: .4byte 0x0E007400
_0809E914:
	movs r0, #0
_0809E916:
	bx lr
