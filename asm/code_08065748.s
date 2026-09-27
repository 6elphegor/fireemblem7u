	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDragonDeadFallBody
NewEfxDragonDeadFallBody: @ 0x08065748
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0806578C @ =0x08BD93F8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r4, _08065790 @ =0x08BDABA0
	ldr r0, _08065794 @ =0x082E4064
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08065798 @ =0x082E1A30
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
_0806578C: .4byte 0x08BD93F8
_08065790: .4byte 0x08BDABA0
_08065794: .4byte 0x082E4064
_08065798: .4byte 0x082E1A30
