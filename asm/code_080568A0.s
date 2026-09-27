	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxArrowOBJ
NewEfxArrowOBJ: @ 0x080568A0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080568E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080568EC @ =0x08BA165C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _080568F0 @ =0x08BA5390
	ldr r2, _080568F4 @ =0x08BA5304
	ldr r3, _080568F8 @ =0x08BA53A0
	ldr r0, _080568FC @ =0x08BA5314
	str r0, [sp]
	adds r0, r5, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _08056900 @ =0x081E9D84
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08056904 @ =0x081E9DA4
	movs r1, #0x60
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080568E8: .4byte 0x0201774C
_080568EC: .4byte 0x08BA165C
_080568F0: .4byte 0x08BA5390
_080568F4: .4byte 0x08BA5304
_080568F8: .4byte 0x08BA53A0
_080568FC: .4byte 0x08BA5314
_08056900: .4byte 0x081E9D84
_08056904: .4byte 0x081E9DA4
