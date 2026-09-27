	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806873C
sub_0806873C: @ 0x0806873C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08068778 @ =0x08BDB514
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806877C @ =0x08BB7280
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r0, _08068780 @ =0x081FC634
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08068784 @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068778: .4byte 0x08BDB514
_0806877C: .4byte 0x08BB7280
_08068780: .4byte 0x081FC634
_08068784: .4byte 0x081FC19C
