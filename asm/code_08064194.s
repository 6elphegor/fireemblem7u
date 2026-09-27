	.include "macro.inc"

	.syntax unified

	thumb_func_start CRSpell_RegisterBgGfx
CRSpell_RegisterBgGfx: @ 0x08064194
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl GetMagicEffectBufferFor
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	lsls r5, r0, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r5, r0
	ldr r1, [r4, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r5, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
