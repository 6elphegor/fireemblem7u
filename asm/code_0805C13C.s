	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxHazymoonOBJ3
StartSubSpell_efxHazymoonOBJ3: @ 0x0805C13C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C174 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C178 @ =0x08BA2DA8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, _0805C17C @ =0x0822A25C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C180 @ =0x08229664
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C174: .4byte 0x0201774C
_0805C178: .4byte 0x08BA2DA8
_0805C17C: .4byte 0x0822A25C
_0805C180: .4byte 0x08229664
