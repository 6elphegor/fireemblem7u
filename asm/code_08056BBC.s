	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056BBC
sub_08056BBC: @ 0x08056BBC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _08056C0C @ =0x08BA1674
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl NewEfxTeyariOBJ
	ldr r0, _08056C10 @ =0x081EB050
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08056C14 @ =0x081EADEC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056C0C: .4byte 0x08BA1674
_08056C10: .4byte 0x081EB050
_08056C14: .4byte 0x081EADEC
