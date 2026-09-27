	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFireOBJ
NewEfxFireOBJ: @ 0x08058588
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _080585CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080585D0 @ =0x08BA1AE4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _080585D4 @ =0x08BB46D0
	ldr r2, _080585D8 @ =0x08BB4348
	ldr r3, _080585DC @ =0x08BB46FC
	ldr r0, _080585E0 @ =0x08BB4374
	str r0, [sp]
	adds r0, r6, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080585E4
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080585E8
	.align 2, 0
_080585CC: .4byte 0x0201774C
_080585D0: .4byte 0x08BA1AE4
_080585D4: .4byte 0x08BB46D0
_080585D8: .4byte 0x08BB4348
_080585DC: .4byte 0x08BB46FC
_080585E0: .4byte 0x08BB4374
_080585E4:
	ldrh r0, [r6, #2]
	adds r0, #8
_080585E8:
	strh r0, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, #8
	strh r0, [r5, #4]
	ldr r0, _0805860C @ =0x081FEE00
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08058610 @ =0x081FE804
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805860C: .4byte 0x081FEE00
_08058610: .4byte 0x081FE804
