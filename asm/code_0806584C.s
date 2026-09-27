	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDragonDeadFallHeadFx
NewEfxDragonDeadFallHeadFx: @ 0x0806584C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08065890 @ =0x08BD9428
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08065894 @ =0x08BDACB0
	ldr r0, _08065898 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806589C @ =0x082E35CC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterObjGfx
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065890: .4byte 0x08BD9428
_08065894: .4byte 0x08BDACB0
_08065898: .4byte 0x082E4064
_0806589C: .4byte 0x082E35CC
