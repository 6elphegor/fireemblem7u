	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxHurtmutOBJ
StartSubSpell_efxHurtmutOBJ: @ 0x08057894
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080578EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080578F0 @ =0x08BA188C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r3, _080578F4 @ =0x08BA7F18
	cmp r0, #0
	bne _080578C4
	ldr r3, _080578F8 @ =0x08BA72B8
_080578C4:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _080578FC @ =0x081EF21C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057900 @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080578EC: .4byte 0x0201774C
_080578F0: .4byte 0x08BA188C
_080578F4: .4byte 0x08BA7F18
_080578F8: .4byte 0x08BA72B8
_080578FC: .4byte 0x081EF21C
_08057900: .4byte 0x081EE51C
