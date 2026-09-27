	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFireBG
NewEfxFireBG: @ 0x080584D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058514 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058518 @ =0x08BA1A6C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805851C @ =0x081E829A
	str r1, [r0, #0x48]
	ldr r1, _08058520 @ =0x08BA1A84
	str r1, [r0, #0x4c]
	ldr r1, _08058524 @ =0x08BA1AB4
	str r1, [r0, #0x50]
	ldr r0, _08058528 @ =0x081FD2CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805852C @ =0x081FC6D4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058514: .4byte 0x0201774C
_08058518: .4byte 0x08BA1A6C
_0805851C: .4byte 0x081E829A
_08058520: .4byte 0x08BA1A84
_08058524: .4byte 0x08BA1AB4
_08058528: .4byte 0x081FD2CC
_0805852C: .4byte 0x081FC6D4
