	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFenrirOBJ2
StartSubSpell_efxFenrirOBJ2: @ 0x0805C85C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C894 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C898 @ =0x08BA3020
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _0805C89C @ =0x082572C4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C8A0 @ =0x08256728
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C894: .4byte 0x0201774C
_0805C898: .4byte 0x08BA3020
_0805C89C: .4byte 0x082572C4
_0805C8A0: .4byte 0x08256728
