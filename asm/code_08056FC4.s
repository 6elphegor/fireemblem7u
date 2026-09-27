	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxSongBG
StartSubSpell_efxSongBG: @ 0x08056FC4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805700C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057010 @ =0x08BA16BC
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08057014 @ =0x081E7FFC
	str r1, [r0, #0x48]
	ldr r1, _08057018 @ =0x08BA16D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805701C @ =0x08BA1740
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, _08057020 @ =0x082DCA8C
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805700C: .4byte 0x0201774C
_08057010: .4byte 0x08BA16BC
_08057014: .4byte 0x081E7FFC
_08057018: .4byte 0x08BA16D4
_0805701C: .4byte 0x08BA1740
_08057020: .4byte 0x082DCA8C
