	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxFimbulvetrOBJ
StartSubSpell_efxFimbulvetrOBJ: @ 0x08058C94
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08058CE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058CE8 @ =0x08BA1CDC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08058CEC @ =0x08BB91BC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, _08058CF0 @ =0x0826AC3C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058CF4 @ =0x0821C860
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058CE4: .4byte 0x0201774C
_08058CE8: .4byte 0x08BA1CDC
_08058CEC: .4byte 0x08BB91BC
_08058CF0: .4byte 0x0826AC3C
_08058CF4: .4byte 0x0821C860
