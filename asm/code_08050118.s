	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_ClearColorEffects
SpellFx_ClearColorEffects: @ 0x08050118
	ldr r3, _0805013C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0805013C: .4byte 0x03002870
