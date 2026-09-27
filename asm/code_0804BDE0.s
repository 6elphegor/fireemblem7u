	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804BDE0
sub_0804BDE0: @ 0x0804BDE0
	adds r1, r0, #0
	ldrh r2, [r1, #0x2c]
	adds r2, #1
	strh r2, [r1, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804BE00
	movs r0, #0
	strh r0, [r1, #0x2c]
	ldr r0, _0804BDFC @ =EkrBattleLvupHanlder
	str r0, [r1, #0xc]
	b _0804BE26
	.align 2, 0
_0804BDFC: .4byte EkrBattleLvupHanlder
_0804BE00:
	ldr r3, _0804BE28 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
_0804BE26:
	bx lr
	.align 2, 0
_0804BE28: .4byte 0x03002870
