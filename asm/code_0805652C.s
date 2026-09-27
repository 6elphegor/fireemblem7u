	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxTeonoOBJ
NewEfxTeonoOBJ: @ 0x0805652C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08056570 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08056574 @ =0x08BA15EC
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _08056578 @ =0x08BA51E8
	ldr r2, _0805657C @ =0x08BA4E50
	ldr r3, _08056580 @ =0x08BA5244
	ldr r0, _08056584 @ =0x08BA4EAC
	str r0, [sp]
	adds r0, r4, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056588
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805658C
	.align 2, 0
_08056570: .4byte 0x0201774C
_08056574: .4byte 0x08BA15EC
_08056578: .4byte 0x08BA51E8
_0805657C: .4byte 0x08BA4E50
_08056580: .4byte 0x08BA5244
_08056584: .4byte 0x08BA4EAC
_08056588:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805658C:
	strh r0, [r5, #2]
	ldr r0, _0805659C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080565A0
	movs r0, #0x23
	b _080565A2
	.align 2, 0
_0805659C: .4byte 0x0203E02C
_080565A0:
	movs r0, #0xa
_080565A2:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl NewEfxTeonoSE
	str r0, [r6, #0x64]
	ldr r0, _080565C8 @ =0x081E9D84
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080565CC @ =0x081E9984
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080565C8: .4byte 0x081E9D84
_080565CC: .4byte 0x081E9984
