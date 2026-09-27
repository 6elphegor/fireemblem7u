	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSongOBJ2
NewEfxSongOBJ2: @ 0x08063210
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063270 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063274 @ =0x08BA4494
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08063278 @ =0x08BA6660
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0806327C @ =0x081EB900
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063280 @ =0x081EB78C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063270: .4byte 0x0201774C
_08063274: .4byte 0x08BA4494
_08063278: .4byte 0x08BA6660
_0806327C: .4byte 0x081EB900
_08063280: .4byte 0x081EB78C
