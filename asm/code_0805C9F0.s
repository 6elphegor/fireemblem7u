	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C9F0
sub_0805C9F0: @ 0x0805C9F0
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805CA14 @ =0x08BA3070
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CA14: .4byte 0x08BA3070
