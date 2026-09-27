	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxElfireOBJ
StartSubSpell_efxElfireOBJ: @ 0x0805889C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080588DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080588E0 @ =0x08BA1BF4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080588E4 @ =0x08BB62EC
	ldr r2, _080588E8 @ =0x08BB54CC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080588EC
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080588F0
	.align 2, 0
_080588DC: .4byte 0x0201774C
_080588E0: .4byte 0x08BA1BF4
_080588E4: .4byte 0x08BB62EC
_080588E8: .4byte 0x08BB54CC
_080588EC:
	ldrh r0, [r6, #2]
	adds r0, #8
_080588F0:
	strh r0, [r6, #2]
	ldr r0, [r6, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r6, #0x1c]
	ldr r0, _08058918 @ =0x0820AB9C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805891C @ =0x0820A924
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058918: .4byte 0x0820AB9C
_0805891C: .4byte 0x0820A924
