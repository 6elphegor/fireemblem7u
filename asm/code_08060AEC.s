	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060AEC
sub_08060AEC: @ 0x08060AEC
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060B74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060B78 @ =0x08BA3C64
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08060B7C @ =0x0829B1BC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08060B80 @ =0x0829C01C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08060B84 @ =0x0829C15C
	ldr r4, _08060B88 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08060B8C @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r2, _08060B90 @ =0x03002870
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
_08060B74: .4byte 0x0201774C
_08060B78: .4byte 0x08BA3C64
_08060B7C: .4byte 0x0829B1BC
_08060B80: .4byte 0x0829C01C
_08060B84: .4byte 0x0829C15C
_08060B88: .4byte 0x02019784
_08060B8C: .4byte 0x02023460
_08060B90: .4byte 0x03002870
