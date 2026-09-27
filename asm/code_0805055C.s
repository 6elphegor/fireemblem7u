	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_WriteBgMapExt
SpellFx_WriteBgMapExt: @ 0x0805055C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08050594 @ =0x02019784
	adds r1, r7, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805059C
	ldr r1, _08050598 @ =0x02023460
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBgHFlip
	b _080505B4
	.align 2, 0
_08050594: .4byte 0x02019784
_08050598: .4byte 0x02023460
_0805059C:
	ldr r1, _080505C4 @ =0x02023460
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBG
_080505B4:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080505C4: .4byte 0x02023460
