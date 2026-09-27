	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxNormalEffect
NewEfxNormalEffect: @ 0x080626B4
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_SetBG1Position
	ldr r0, _080626D0 @ =0x08BA4254
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080626D0: .4byte 0x08BA4254
