	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057514
sub_08057514: @ 0x08057514
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08057574 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08057578 @ =0x08BA1824
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _0805757C @ =0x081EE054
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08057580 @ =0x081ED194
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08057584 @ =0x081EE154
	ldr r5, _08057588 @ =0x02019784
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08057590
	ldr r1, _0805758C @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBG
	b _080575A4
	.align 2, 0
_08057574: .4byte 0x0201774C
_08057578: .4byte 0x08BA1824
_0805757C: .4byte 0x081EE054
_08057580: .4byte 0x081ED194
_08057584: .4byte 0x081EE154
_08057588: .4byte 0x02019784
_0805758C: .4byte 0x02023460
_08057590:
	ldr r1, _080575CC @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
_080575A4:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, _080575D0 @ =0x03002870
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080575CC: .4byte 0x02023460
_080575D0: .4byte 0x03002870
