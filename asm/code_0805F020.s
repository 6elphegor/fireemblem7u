	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxShineBG
StartSubSpell_efxShineBG: @ 0x0805F020
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F060 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F064 @ =0x08BA36C0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F068 @ =0x081E924A
	str r1, [r0, #0x48]
	ldr r1, _0805F06C @ =0x08BA36D8
	str r1, [r0, #0x4c]
	ldr r1, _0805F070 @ =0x08BA36DC
	str r1, [r0, #0x50]
	ldr r1, _0805F074 @ =0x08BA36E0
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F060: .4byte 0x0201774C
_0805F064: .4byte 0x08BA36C0
_0805F068: .4byte 0x081E924A
_0805F06C: .4byte 0x08BA36D8
_0805F070: .4byte 0x08BA36DC
_0805F074: .4byte 0x08BA36E0
