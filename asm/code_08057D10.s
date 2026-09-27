	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxIcebreathOBJ
StartSubSpell_efxIcebreathOBJ: @ 0x08057D10
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08057D4C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057D50 @ =0x08BA1924
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, _08057D54 @ =0x08BAAED8
	ldr r3, _08057D58 @ =0x08BABB08
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08057D5C
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b _08057D60
	.align 2, 0
_08057D4C: .4byte 0x0201774C
_08057D50: .4byte 0x08BA1924
_08057D54: .4byte 0x08BAAED8
_08057D58: .4byte 0x08BABB08
_08057D5C:
	ldrh r0, [r6, #2]
	subs r0, #0x20
_08057D60:
	strh r0, [r6, #2]
	ldr r0, _08057D7C @ =0x081F02E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08057D80 @ =0x081EE51C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057D7C: .4byte 0x081F02E0
_08057D80: .4byte 0x081EE51C
