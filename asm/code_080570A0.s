	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxSongOBJ
StartSubSpell_efxSongOBJ: @ 0x080570A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080570F4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080570F8 @ =0x08BA17AC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, _080570FC @ =0x08BD8FEC
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, _08057100 @ =0x082DCA8C
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057104 @ =0x082DE1F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080570F4: .4byte 0x0201774C
_080570F8: .4byte 0x08BA17AC
_080570FC: .4byte 0x08BD8FEC
_08057100: .4byte 0x082DCA8C
_08057104: .4byte 0x082DE1F0
