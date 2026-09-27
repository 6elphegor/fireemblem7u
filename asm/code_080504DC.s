	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_WriteBgMap
SpellFx_WriteBgMap: @ 0x080504DC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080504F8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050500
	ldr r1, _080504FC @ =0x02019784
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _08050508
	.align 2, 0
_080504F8: .4byte 0x0203E02C
_080504FC: .4byte 0x02019784
_08050500:
	ldr r1, _0805052C @ =0x02019784
	adds r0, r2, #0
	bl LZ77UnCompWram
_08050508:
	ldr r5, _0805052C @ =0x02019784
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08050534
	ldr r1, _08050530 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _08050548
	.align 2, 0
_0805052C: .4byte 0x02019784
_08050530: .4byte 0x02023460
_08050534:
	ldr r1, _08050558 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08050548:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050558: .4byte 0x02023460
