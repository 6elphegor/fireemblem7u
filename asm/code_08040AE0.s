	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040AE0
sub_08040AE0: @ 0x08040AE0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08040640
	ldr r1, _08040B38 @ =0x0203DC24
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _08040B3C @ =0x0203D90C
	adds r0, #0xa0
	ldr r1, _08040B40 @ =0x08B98AEC
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _08040B08
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _08040B48
_08040B08:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	bl sub_08040870
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _08040B44 @ =0x000003C6
	movs r1, #1
	bl PutSioText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08040B6C
	.align 2, 0
_08040B38: .4byte 0x0203DC24
_08040B3C: .4byte 0x0203D90C
_08040B40: .4byte 0x08B98AEC
_08040B44: .4byte 0x000003C6
_08040B48:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08040B74
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r2, #9]
	ldrb r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08040B7A
_08040B6C:
	adds r0, r4, #0
	bl Proc_Break
	b _08040B7A
_08040B74:
	adds r0, r4, #0
	bl Proc_Break
_08040B7A:
	pop {r4}
	pop {r0}
	bx r0
