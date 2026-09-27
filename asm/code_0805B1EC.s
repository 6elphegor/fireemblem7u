	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxDivineOBJ
StartSubSpell_efxDivineOBJ: @ 0x0805B1EC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805B22C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B230 @ =0x08BA2B38
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805B234 @ =0x08BBA10C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805B238
	ldrh r0, [r6, #2]
	subs r0, #6
	b _0805B23C
	.align 2, 0
_0805B22C: .4byte 0x0201774C
_0805B230: .4byte 0x08BA2B38
_0805B234: .4byte 0x08BBA10C
_0805B238:
	ldrh r0, [r6, #2]
	adds r0, #6
_0805B23C:
	strh r0, [r6, #2]
	ldr r0, _0805B258 @ =0x082424B4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805B25C @ =0x08242348
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B258: .4byte 0x082424B4
_0805B25C: .4byte 0x08242348
