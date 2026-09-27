	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxOuraBG3
StartSubSpell_efxOuraBG3: @ 0x08061334
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806137C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061380 @ =0x08BA3DE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08061384 @ =0x081E9494
	str r1, [r0, #0x48]
	ldr r1, _08061388 @ =0x08BA3DFC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806138C @ =0x08BA3E2C
	str r1, [r0, #0x54]
	ldr r0, _08061390 @ =0x082AEF60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806137C: .4byte 0x0201774C
_08061380: .4byte 0x08BA3DE4
_08061384: .4byte 0x081E9494
_08061388: .4byte 0x08BA3DFC
_0806138C: .4byte 0x08BA3E2C
_08061390: .4byte 0x082AEF60
