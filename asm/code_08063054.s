	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxLokmsunaOBJ
NewEfxLokmsunaOBJ: @ 0x08063054
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080630A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080630A4 @ =0x08BA444C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _080630A8 @ =0x08BD91D8
	ldr r3, _080630AC @ =0x08BD92FC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldr r0, _080630B0 @ =0x00000FFF
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080630B4
	movs r1, #0xe0
	lsls r1, r1, #7
	b _080630B8
	.align 2, 0
_080630A0: .4byte 0x0201774C
_080630A4: .4byte 0x08BA444C
_080630A8: .4byte 0x08BD91D8
_080630AC: .4byte 0x08BD92FC
_080630B0: .4byte 0x00000FFF
_080630B4:
	movs r1, #0x90
	lsls r1, r1, #8
_080630B8:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	ldr r0, _080630D4 @ =0x082DE400
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080630D4: .4byte 0x082DE400
