	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080609E4
sub_080609E4: @ 0x080609E4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060A6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060A70 @ =0x08BA3C44
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08060A74 @ =0x0829C5B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060A78 @ =0x0829CFA8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08060A7C @ =0x0829D028
	ldr r4, _08060A80 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08060A84 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060A88 @ =0x03002870
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
_08060A6C: .4byte 0x0201774C
_08060A70: .4byte 0x08BA3C44
_08060A74: .4byte 0x0829C5B8
_08060A78: .4byte 0x0829CFA8
_08060A7C: .4byte 0x0829D028
_08060A80: .4byte 0x02019784
_08060A84: .4byte 0x02023460
_08060A88: .4byte 0x03002870
