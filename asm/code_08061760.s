	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061760
sub_08061760: @ 0x08061760
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080617C4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080617C8 @ =0x08BA3EDC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _080617CC @ =0x08BD53D4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldr r1, _080617D0 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _080617D4 @ =0x082B3D5C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080617D8 @ =0x082B3A2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080617C4: .4byte 0x0201774C
_080617C8: .4byte 0x08BA3EDC
_080617CC: .4byte 0x08BD53D4
_080617D0: .4byte 0x0000F3FF
_080617D4: .4byte 0x082B3D5C
_080617D8: .4byte 0x082B3A2C
