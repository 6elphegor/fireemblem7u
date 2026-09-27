	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxThunderOBJ
NewEfxThunderOBJ: @ 0x080582B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080582F8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080582FC @ =0x08BA1A3C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08058300 @ =0x08BB3F30
	ldr r2, _08058304 @ =0x08BB3404
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _08058308 @ =0x081FC634
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805830C @ =0x081FC19C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080582F8: .4byte 0x0201774C
_080582FC: .4byte 0x08BA1A3C
_08058300: .4byte 0x08BB3F30
_08058304: .4byte 0x08BB3404
_08058308: .4byte 0x081FC634
_0805830C: .4byte 0x081FC19C
