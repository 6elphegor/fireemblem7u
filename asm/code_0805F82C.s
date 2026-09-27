	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F82C
sub_0805F82C: @ 0x0805F82C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F890 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F894 @ =0x08BA38A4
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, _0805F898 @ =0x0829226C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805F89C @ =0x082929CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _0805F8A0 @ =0x08292BAC
	ldr r4, _0805F8A4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F8AC
	ldr r1, _0805F8A8 @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBgHFlip
	b _0805F8C0
	.align 2, 0
_0805F890: .4byte 0x0201774C
_0805F894: .4byte 0x08BA38A4
_0805F898: .4byte 0x0829226C
_0805F89C: .4byte 0x082929CC
_0805F8A0: .4byte 0x08292BAC
_0805F8A4: .4byte 0x02019784
_0805F8A8: .4byte 0x02023460
_0805F8AC:
	ldr r1, _0805F8EC @ =0x02023460
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBG
_0805F8C0:
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805F8F0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F8FE
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805F8F4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
	b _0805F8FE
	.align 2, 0
_0805F8EC: .4byte 0x02023460
_0805F8F0: .4byte 0x0203E02C
_0805F8F4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
_0805F8FE:
	ldr r2, _0805F91C @ =0x03002870
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
_0805F91C: .4byte 0x03002870
