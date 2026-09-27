	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060298
sub_08060298: @ 0x08060298
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _080602DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080602E0 @ =0x08BA3B4C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _080602E4 @ =0x08296F50
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _080602E8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080602F4
	ldr r0, _080602EC @ =0x0829803C
	ldr r1, _080602F0 @ =0x02019784
	bl LZ77UnCompWram
	b _080602FC
	.align 2, 0
_080602DC: .4byte 0x0201774C
_080602E0: .4byte 0x08BA3B4C
_080602E4: .4byte 0x08296F50
_080602E8: .4byte 0x0203E02C
_080602EC: .4byte 0x0829803C
_080602F0: .4byte 0x02019784
_080602F4:
	ldr r0, _0806031C @ =0x08298470
	ldr r1, _08060320 @ =0x02019784
	bl LZ77UnCompWram
_080602FC:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08060328
	ldr r0, _08060320 @ =0x02019784
	ldr r1, _08060324 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _0806033C
	.align 2, 0
_0806031C: .4byte 0x08298470
_08060320: .4byte 0x02019784
_08060324: .4byte 0x02023460
_08060328:
	ldr r0, _08060370 @ =0x02019784
	ldr r1, _08060374 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_0806033C:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060378 @ =0x03002870
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
_08060370: .4byte 0x02019784
_08060374: .4byte 0x02023460
_08060378: .4byte 0x03002870
