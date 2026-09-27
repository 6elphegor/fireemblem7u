	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_RegisterBgGfx
SpellFx_RegisterBgGfx: @ 0x0805060C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _0805062C @ =0x06002000
	ldr r4, _08050630 @ =0x02017784
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
_0805062C: .4byte 0x06002000
_08050630: .4byte 0x02017784
