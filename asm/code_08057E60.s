	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxDarkbreathBG
StartSubSpell_efxDarkbreathBG: @ 0x08057E60
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08057E9C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057EA0 @ =0x08BA195C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08057EA4 @ =0x081E8166
	str r1, [r0, #0x48]
	ldr r1, _08057EA8 @ =0x08BA1974
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08057EAC @ =0x081F0320
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057E9C: .4byte 0x0201774C
_08057EA0: .4byte 0x08BA195C
_08057EA4: .4byte 0x081E8166
_08057EA8: .4byte 0x08BA1974
_08057EAC: .4byte 0x081F0320
