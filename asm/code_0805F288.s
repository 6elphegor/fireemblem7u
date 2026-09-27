	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxShineOBJRND
StartSubSpell_efxShineOBJRND: @ 0x0805F288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F2C0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F2C4 @ =0x08BA3740
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, _0805F2C8 @ =0x0829162C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2CC @ =0x08291368
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2C0: .4byte 0x0201774C
_0805F2C4: .4byte 0x08BA3740
_0805F2C8: .4byte 0x0829162C
_0805F2CC: .4byte 0x08291368
