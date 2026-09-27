	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060444
sub_08060444: @ 0x08060444
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08060488 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806048C @ =0x08BA3B8C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08060490 @ =0x0828EAD8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060494 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080604A0
	ldr r0, _08060498 @ =0x0828FDC0
	ldr r1, _0806049C @ =0x02019784
	bl LZ77UnCompWram
	b _080604A8
	.align 2, 0
_08060488: .4byte 0x0201774C
_0806048C: .4byte 0x08BA3B8C
_08060490: .4byte 0x0828EAD8
_08060494: .4byte 0x0203E02C
_08060498: .4byte 0x0828FDC0
_0806049C: .4byte 0x02019784
_080604A0:
	ldr r0, _080604C8 @ =0x0829021C
	ldr r1, _080604CC @ =0x02019784
	bl LZ77UnCompWram
_080604A8:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080604D4
	ldr r0, _080604CC @ =0x02019784
	ldr r1, _080604D0 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _080604E8
	.align 2, 0
_080604C8: .4byte 0x0829021C
_080604CC: .4byte 0x02019784
_080604D0: .4byte 0x02023460
_080604D4:
	ldr r0, _0806051C @ =0x02019784
	ldr r1, _08060520 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080604E8:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060524 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806051C: .4byte 0x02019784
_08060520: .4byte 0x02023460
_08060524: .4byte 0x03002870
