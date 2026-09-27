	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C470
sub_0805C470: @ 0x0805C470
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805C4E4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C4E8 @ =0x08BA2E10
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _0805C4EC @ =0x0824D5E0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0805C4F0 @ =0x0824DF20
	ldr r4, _0805C4F4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0805C4F8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805C4FC @ =0x03002870
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
_0805C4E4: .4byte 0x0201774C
_0805C4E8: .4byte 0x08BA2E10
_0805C4EC: .4byte 0x0824D5E0
_0805C4F0: .4byte 0x0824DF20
_0805C4F4: .4byte 0x02019784
_0805C4F8: .4byte 0x02023460
_0805C4FC: .4byte 0x03002870
