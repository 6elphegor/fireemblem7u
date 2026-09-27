	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_PlaySongExt
EvtCmd_PlaySongExt: @ 0x0800E378
	push {lr}
	ldr r2, [r0, #0x30]
	ldrh r3, [r2, #2]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0800E38E
	movs r0, #0
	b _0800E418
_0800E38E:
	ldr r0, [r2, #4]
	subs r0, #1
	cmp r0, #7
	bhi _0800E40C
	lsls r0, r0, #2
	ldr r1, _0800E3A0 @ =_0800E3A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E3A0: .4byte _0800E3A4
_0800E3A4: @ jump table
	.4byte _0800E3C4 @ case 0
	.4byte _0800E3CC @ case 1
	.4byte _0800E3D4 @ case 2
	.4byte _0800E3DC @ case 3
	.4byte _0800E3E4 @ case 4
	.4byte _0800E3EC @ case 5
	.4byte _0800E3F4 @ case 6
	.4byte _0800E3FC @ case 7
_0800E3C4:
	ldr r2, _0800E3C8 @ =0x03005D20
	b _0800E3FE
	.align 2, 0
_0800E3C8: .4byte 0x03005D20
_0800E3CC:
	ldr r2, _0800E3D0 @ =0x03005D60
	b _0800E3FE
	.align 2, 0
_0800E3D0: .4byte 0x03005D60
_0800E3D4:
	ldr r2, _0800E3D8 @ =0x03005E30
	b _0800E3FE
	.align 2, 0
_0800E3D8: .4byte 0x03005E30
_0800E3DC:
	ldr r2, _0800E3E0 @ =0x03005DA0
	b _0800E3FE
	.align 2, 0
_0800E3E0: .4byte 0x03005DA0
_0800E3E4:
	ldr r2, _0800E3E8 @ =0x03005A90
	b _0800E3FE
	.align 2, 0
_0800E3E8: .4byte 0x03005A90
_0800E3EC:
	ldr r2, _0800E3F0 @ =0x03005AD0
	b _0800E3FE
	.align 2, 0
_0800E3F0: .4byte 0x03005AD0
_0800E3F4:
	ldr r2, _0800E3F8 @ =0x03005CE0
	b _0800E3FE
	.align 2, 0
_0800E3F8: .4byte 0x03005CE0
_0800E3FC:
	ldr r2, _0800E408 @ =0x03005DF0
_0800E3FE:
	adds r0, r3, #0
	movs r1, #1
	bl StartBgmExt
	b _0800E416
	.align 2, 0
_0800E408: .4byte 0x03005DF0
_0800E40C:
	ldr r2, _0800E41C @ =0x03005B10
	adds r0, r3, #0
	movs r1, #1
	bl StartBgmExt
_0800E416:
	movs r0, #2
_0800E418:
	pop {r1}
	bx r1
	.align 2, 0
_0800E41C: .4byte 0x03005B10
