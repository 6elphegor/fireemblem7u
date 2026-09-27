	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A0A8
sub_0806A0A8: @ 0x0806A0A8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0806A0F4 @ =0x083F3074
	ldrh r4, [r5, #0x2e]
	adds r4, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0806A0EE
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl ApplyPaletteExt
_0806A0EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A0F4: .4byte 0x083F3074
