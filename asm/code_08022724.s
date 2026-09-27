	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022724
sub_08022724: @ 0x08022724
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08022784
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08022770 @ =0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08022774 @ =0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _08022778 @ =0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _0802277C @ =0x00FFFFFF
	ands r3, r0
	ldr r0, _08022780 @ =0x08B959B0
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartLockingMenuExt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _0802278E
	.align 2, 0
_08022770: .4byte 0xFFFFFF00
_08022774: .4byte 0xFFFF00FF
_08022778: .4byte 0xFF00FFFF
_0802277C: .4byte 0x00FFFFFF
_08022780: .4byte 0x08B959B0
_08022784:
	ldr r1, _08022794 @ =0x00000739
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_0802278E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022794: .4byte 0x00000739
