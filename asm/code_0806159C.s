	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpellBG_IvaldiBG1
StartSpellBG_IvaldiBG1: @ 0x0806159C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080615E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080615EC @ =0x08BA3E74
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080615F0 @ =0x081E9506
	str r1, [r0, #0x48]
	ldr r1, _080615F4 @ =0x08BA3E8C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _080615F8 @ =0x0829DDD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080615FC @ =0x0829E750
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080615E8: .4byte 0x0201774C
_080615EC: .4byte 0x08BA3E74
_080615F0: .4byte 0x081E9506
_080615F4: .4byte 0x08BA3E8C
_080615F8: .4byte 0x0829DDD8
_080615FC: .4byte 0x0829E750
