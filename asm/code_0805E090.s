	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxSilenceOBJ
StartSubSpell_efxSilenceOBJ: @ 0x0805E090
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E0D4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E0D8 @ =0x08BA334C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E0DC @ =0x08BC4310
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805E0E0 @ =0x08272D9C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E0E4 @ =0x0827287C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E0D4: .4byte 0x0201774C
_0805E0D8: .4byte 0x08BA334C
_0805E0DC: .4byte 0x08BC4310
_0805E0E0: .4byte 0x08272D9C
_0805E0E4: .4byte 0x0827287C
