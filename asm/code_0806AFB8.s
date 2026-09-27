	.include "macro.inc"

	.syntax unified

	thumb_func_start PutBanimBgTSA
PutBanimBgTSA: @ 0x0806AFB8
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _0806AFF0 @ =0x08BDCA64
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0806AFF4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AFF8 @ =0x02024460
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AFF0: .4byte 0x08BDCA64
_0806AFF4: .4byte 0x02019784
_0806AFF8: .4byte 0x02024460
