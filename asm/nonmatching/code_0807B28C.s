	.include "macro.inc"

	.syntax unified

	thumb_func_start PutDragonGateFlame
PutDragonGateFlame: @ 0x0807B28C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0807B2E0 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r4, r0, r4
	movs r1, #0xff
	ands r4, r1
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	subs r5, r0, r5
	ands r5, r1
	ldr r0, _0807B2E4 @ =0x081B9790
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807B2E8 @ =0x081B93C8
	ldr r1, _0807B2EC @ =0x06000800
	bl Decompress
	ldr r0, _0807B2F0 @ =0x02022C60
	ldr r1, _0807B2F4 @ =0x081B97B0
	movs r2, #0x40
	bl sub_080AACD8
	movs r0, #1
	bl EnableBgSync
	adds r1, r4, #0
	adds r2, r5, #0
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B2E0: .4byte 0x0202BBB8
_0807B2E4: .4byte 0x081B9790
_0807B2E8: .4byte 0x081B93C8
_0807B2EC: .4byte 0x06000800
_0807B2F0: .4byte 0x02022C60
_0807B2F4: .4byte 0x081B97B0
