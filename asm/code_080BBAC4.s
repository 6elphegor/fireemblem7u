	.include "macro.inc"

	.syntax unified

	thumb_func_start OpAnim_DrawWater
OpAnim_DrawWater: @ 0x080BBAC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BBB14 @ =0x08600544
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BBB18 @ =0x085FF1D4
	ldr r1, _080BBB1C @ =0x06008000
	bl Decompress
	ldr r0, _080BBB20 @ =0x02022C60
	ldr r1, _080BBB24 @ =0x0860029C
	movs r2, #0xe0
	lsls r2, r2, #8
	bl PutCompressedTsa
	ldr r2, _080BBB28 @ =0x03002870
	movs r0, #0x3f
	ldrb r1, [r2, #0xd]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #0xd]
	movs r0, #1
	bl EnableBgSync
	bl InitOpScanlineBuf
	ldr r2, _080BBB2C @ =0x03001620
	ldr r0, [r2]
	movs r1, #1
	orrs r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBB14: .4byte 0x08600544
_080BBB18: .4byte 0x085FF1D4
_080BBB1C: .4byte 0x06008000
_080BBB20: .4byte 0x02022C60
_080BBB24: .4byte 0x0860029C
_080BBB28: .4byte 0x03002870
_080BBB2C: .4byte 0x03001620
