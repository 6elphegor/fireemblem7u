	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTriPegasusKnightBG
NewEkrTriPegasusKnightBG: @ 0x0806A7D4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806A7FC @ =0x08BDB8A4
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _0806A808
	ldr r0, _0806A800 @ =0x0203E0A8
	ldr r2, [r0]
	ldr r0, _0806A804 @ =0x082E5C9C
	b _0806A80E
	.align 2, 0
_0806A7FC: .4byte 0x08BDB8A4
_0806A800: .4byte 0x0203E0A8
_0806A804: .4byte 0x082E5C9C
_0806A808:
	ldr r0, _0806A844 @ =0x0203E0A8
	ldr r2, [r0, #4]
	ldr r0, _0806A848 @ =0x082E5CAA
_0806A80E:
	str r0, [r1, #0x48]
	ldr r0, _0806A84C @ =0x08BDB8BC
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _0806A850 @ =0x02017784
	adds r0, r2, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806A854 @ =0x082E5CB8
	cmp r6, #0
	beq _0806A836
	ldr r0, _0806A858 @ =0x082E704C
	cmp r7, #0
	bne _0806A836
	ldr r0, _0806A85C @ =0x082E665C
_0806A836:
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A844: .4byte 0x0203E0A8
_0806A848: .4byte 0x082E5CAA
_0806A84C: .4byte 0x08BDB8BC
_0806A850: .4byte 0x02017784
_0806A854: .4byte 0x082E5CB8
_0806A858: .4byte 0x082E704C
_0806A85C: .4byte 0x082E665C
