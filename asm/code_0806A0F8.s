	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrLvupApfx
NewEkrLvupApfx: @ 0x0806A0F8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _0806A144 @ =0x083F34B0
	ldr r1, _0806A148 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0806A14C @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _0806A150 @ =0x083F3450
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806A154 @ =0x08BDB834
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _0806A158 @ =0x02020130
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A144: .4byte 0x083F34B0
_0806A148: .4byte 0x000003FF
_0806A14C: .4byte 0x06010000
_0806A150: .4byte 0x083F3450
_0806A154: .4byte 0x08BDB834
_0806A158: .4byte 0x02020130
