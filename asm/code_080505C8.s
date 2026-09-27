	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_RegisterObjGfx
SpellFx_RegisterObjGfx: @ 0x080505C8
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _080505E8 @ =0x06010800
	ldr r4, _080505EC @ =0x0201A784
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080505E8: .4byte 0x06010800
_080505EC: .4byte 0x0201A784
