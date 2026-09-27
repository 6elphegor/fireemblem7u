	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804BC64
sub_0804BC64: @ 0x0804BC64
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0804BCC0
	ldr r2, _0804BC88 @ =0x0203E0D4
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804BC90
	ldr r0, _0804BC8C @ =0x0203E0D0
	ldrh r0, [r0]
	b _0804BC9E
	.align 2, 0
_0804BC88: .4byte 0x0203E0D4
_0804BC8C: .4byte 0x0203E0D0
_0804BC90:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0804BCA4
	ldr r0, _0804BCC8 @ =0x0203E0D0
	ldrh r0, [r0, #2]
_0804BC9E:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
_0804BCA4:
	ldr r0, _0804BCCC @ =sub_0804BCD0
	str r0, [r1, #0xc]
	movs r4, #0xe5
	lsls r4, r4, #2
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl M4aPlayWithPostionCtrl
_0804BCC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BCC8: .4byte 0x0203E0D0
_0804BCCC: .4byte sub_0804BCD0
