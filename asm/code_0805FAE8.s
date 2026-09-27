	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLunaOBJ
StartSubSpell_efxLunaOBJ: @ 0x0805FAE8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0805FAEE:
	ldr r0, _0805FB18 @ =0x08BA3964
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls _0805FAEE
	ldr r0, _0805FB1C @ =0x082967F4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805FB20 @ =0x082963F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB18: .4byte 0x08BA3964
_0805FB1C: .4byte 0x082967F4
_0805FB20: .4byte 0x082963F4
