	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxSuperdruidBG3
StartSubSpell_efxSuperdruidBG3: @ 0x08061FDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062024 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062028 @ =0x08BA40FC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806202C @ =0x081E9624
	str r1, [r0, #0x48]
	ldr r1, _08062030 @ =0x08BA413C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08062034 @ =0x08BA4114
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08062038 @ =0x082D8260
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062024: .4byte 0x0201774C
_08062028: .4byte 0x08BA40FC
_0806202C: .4byte 0x081E9624
_08062030: .4byte 0x08BA413C
_08062034: .4byte 0x08BA4114
_08062038: .4byte 0x082D8260
