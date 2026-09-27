	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFenrirOBJ
StartSubSpell_efxFenrirOBJ: @ 0x0805C5E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0805C630 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C634 @ =0x08BA2E58
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _0805C638 @ =0x08BBB5C0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805C63C @ =0x082572A4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C640 @ =0x08256728
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C630: .4byte 0x0201774C
_0805C634: .4byte 0x08BA2E58
_0805C638: .4byte 0x08BBB5C0
_0805C63C: .4byte 0x082572A4
_0805C640: .4byte 0x08256728
