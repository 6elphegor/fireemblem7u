	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxRestOBJ
StartSubSpell_efxRestOBJ: @ 0x0805DDE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805DE1C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DE20 @ =0x08BA32B4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0805DE24 @ =0x08BC4044
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805DE28
	ldrh r0, [r6, #2]
	subs r0, #8
	b _0805DE2C
	.align 2, 0
_0805DE1C: .4byte 0x0201774C
_0805DE20: .4byte 0x08BA32B4
_0805DE24: .4byte 0x08BC4044
_0805DE28:
	ldrh r0, [r6, #2]
	adds r0, #8
_0805DE2C:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, _0805DE50 @ =0x08276198
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805DE54 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805DE50: .4byte 0x08276198
_0805DE54: .4byte 0x08275FB0
