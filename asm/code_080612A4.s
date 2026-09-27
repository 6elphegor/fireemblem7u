	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxOuraBGCOL
StartSubSpell_efxOuraBGCOL: @ 0x080612A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080612DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080612E0 @ =0x08BA3DC4
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, _080612E4 @ =0x081E9482
	str r0, [r1, #0x48]
	ldr r0, _080612E8 @ =0x0828FD00
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080612DC: .4byte 0x0201774C
_080612E0: .4byte 0x08BA3DC4
_080612E4: .4byte 0x081E9482
_080612E8: .4byte 0x0828FD00
