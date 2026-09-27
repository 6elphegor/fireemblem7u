	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxTeonoOBJ2
NewEfxTeonoOBJ2: @ 0x08056650
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056690 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056694 @ =0x08BA160C
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, _08056698 @ =0x08BA5264
	ldr r2, _0805669C @ =0x08BA4ECC
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080566A0
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _080566A4
	.align 2, 0
_08056690: .4byte 0x0201774C
_08056694: .4byte 0x08BA160C
_08056698: .4byte 0x08BA5264
_0805669C: .4byte 0x08BA4ECC
_080566A0:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_080566A4:
	strh r0, [r5, #2]
	ldr r0, _080566CC @ =0x081E9D84
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080566D0 @ =0x081E9984
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl NewEfxTeonoSE
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080566CC: .4byte 0x081E9D84
_080566D0: .4byte 0x081E9984
