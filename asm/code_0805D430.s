	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLiveOBJ
StartSubSpell_efxLiveOBJ: @ 0x0805D430
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805D47C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D480 @ =0x08BA3128
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _0805D484 @ =0x08BBE6B0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805D488 @ =0x0826AC3C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D48C @ =0x0826A9E8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D47C: .4byte 0x0201774C
_0805D480: .4byte 0x08BA3128
_0805D484: .4byte 0x08BBE6B0
_0805D488: .4byte 0x0826AC3C
_0805D48C: .4byte 0x0826A9E8
