	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxPurgeOBJ
StartSubSpell_efxPurgeOBJ: @ 0x0805A36C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805A3C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A3C8 @ =0x08BA2820
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805A3CC @ =0x08BBB964
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _0805A3D0 @ =0x08269CD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805A3D4 @ =0x08269A14
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3C4: .4byte 0x0201774C
_0805A3C8: .4byte 0x08BA2820
_0805A3CC: .4byte 0x08BBB964
_0805A3D0: .4byte 0x08269CD8
_0805A3D4: .4byte 0x08269A14
