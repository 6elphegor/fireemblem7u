	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpellAnimFortify
StartSpellAnimFortify: @ 0x0805D6D8
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805D704 @ =0x08BA3180
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D704: .4byte 0x08BA3180
