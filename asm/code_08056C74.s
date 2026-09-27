	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08056C74
sub_08056C74: @ 0x08056C74
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SetBG1Position
	ldr r0, _08056CC4 @ =0x08BA1674
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
	ldr r0, _08056CC8 @ =0x081EB530
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08056CCC @ =0x081EB300
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056CC4: .4byte 0x08BA1674
_08056CC8: .4byte 0x081EB530
_08056CCC: .4byte 0x081EB300
