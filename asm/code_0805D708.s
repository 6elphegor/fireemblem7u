	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpellAnimLatona
StartSpellAnimLatona: @ 0x0805D708
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805D734 @ =0x08BA3180
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D734: .4byte 0x08BA3180
