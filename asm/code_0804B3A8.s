	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBattle_Init
EkrBattle_Init: @ 0x0804B3A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804B3C8 @ =0x0201FB00
	movs r0, #0
	str r0, [r1]
	ldr r0, _0804B3CC @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _0804B3DA
	ldr r0, _0804B3D0 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #1
	bne _0804B3D4
	movs r0, #0x20
	rsbs r0, r0, #0
	b _0804B3D8
	.align 2, 0
_0804B3C8: .4byte 0x0201FB00
_0804B3CC: .4byte 0x02017744
_0804B3D0: .4byte 0x0203E02C
_0804B3D4:
	movs r0, #0xf0
	rsbs r0, r0, #0
_0804B3D8:
	str r0, [r1]
_0804B3DA:
	bl InitMainAnims
	bl InitEkrDragonStatus
	ldr r0, _0804B3F4 @ =0x02000024
	movs r1, #1
	str r1, [r0]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0804B3F8
	movs r0, #0
	b _0804B3FA
	.align 2, 0
_0804B3F4: .4byte 0x02000024
_0804B3F8:
	movs r0, #0x1e
_0804B3FA:
	strh r0, [r4, #0x2c]
	ldr r0, _0804B410 @ =0x0203E00C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804B418
	ldr r1, _0804B414 @ =0x0203E09C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	b _0804B41E
	.align 2, 0
_0804B410: .4byte 0x0203E00C
_0804B414: .4byte 0x0203E09C
_0804B418:
	ldr r1, _0804B438 @ =0x0203E09C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
_0804B41E:
	bl CheckBattleTalk
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x54]
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B438: .4byte 0x0203E09C
