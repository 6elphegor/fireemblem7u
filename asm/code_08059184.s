	.include "macro.inc"

	.syntax unified

	thumb_func_start efxThunderstormOBJ_Loop
efxThunderstormOBJ_Loop: @ 0x08059184
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, _080591BC @ =0x08BB7280
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _080591C0 @ =0x081FC634
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080591C4 @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591BC: .4byte 0x08BB7280
_080591C0: .4byte 0x081FC634
_080591C4: .4byte 0x081FC19C
