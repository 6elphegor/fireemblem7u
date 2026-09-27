	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061B68
sub_08061B68: @ 0x08061B68
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl sub_0804FD1C
	bl SpellFx_SetBG1Position
	ldr r0, _08061BA0 @ =0x08BA3F24
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061BA0: .4byte 0x08BA3F24
