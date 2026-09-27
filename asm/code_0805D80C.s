	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxReserveBG
StartSubSpell_efxReserveBG: @ 0x0805D80C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D848 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D84C @ =0x08BA3198
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805D850 @ =0x081E8DC0
	str r1, [r0, #0x48]
	ldr r1, _0805D854 @ =0x08BA31B0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805D858 @ =0x08269CF8
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D848: .4byte 0x0201774C
_0805D84C: .4byte 0x08BA3198
_0805D850: .4byte 0x081E8DC0
_0805D854: .4byte 0x08BA31B0
_0805D858: .4byte 0x08269CF8
