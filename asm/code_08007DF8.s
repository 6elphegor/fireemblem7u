	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTalk
InitTalk: @ 0x08007DF8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	ldr r4, _08007E7C @ =0x030000E8
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E80 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl InitTextFont
	bl SetInitTalkTextFont
	ldr r0, _08007E84 @ =0x08B909B8
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08007E4E
	ldr r4, _08007E88 @ =0x030000C8
	adds r5, r6, #0
_08007E36:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _08007E36
_08007E4E:
	cmp r7, #0
	beq _08007E70
	ldr r4, _08007E8C @ =0x083FBD34
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08007E90 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08007E94 @ =0x083FBFD0
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
_08007E70:
	bl ClearTalkFaceRefs
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007E7C: .4byte 0x030000E8
_08007E80: .4byte 0x000003FF
_08007E84: .4byte 0x08B909B8
_08007E88: .4byte 0x030000C8
_08007E8C: .4byte 0x083FBD34
_08007E90: .4byte 0x06000200
_08007E94: .4byte 0x083FBFD0
