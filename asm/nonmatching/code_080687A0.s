	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxClasschgFIN
NewEfxClasschgFIN: @ 0x080687A0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08068890 @ =0x08BDB534
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _08068894 @ =0x081F65A0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08068898 @ =0x082739E4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806889C @ =0x08273AE4
	ldr r1, _080688A0 @ =0x02023460
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl EnableBgSync
	bl SpellFx_SetSomeColorEffect
	ldr r0, _080688A4 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0xe
	strb r0, [r1]
	adds r1, #1
	movs r4, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
	mov r6, ip
	adds r6, #0x37
	movs r3, #0x20
	ldrb r1, [r6]
	orrs r1, r3
	movs r0, #0x21
	rsbs r0, r0, #0
	mov r2, ip
	ldrb r2, [r2, #1]
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	mov r7, ip
	strb r0, [r7, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	orrs r1, r4
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r6]
	ldr r0, _080688A8 @ =0x0000FFE0
	ldrh r1, [r7, #0x3c]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080688AC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	mov r0, ip
	adds r0, #0x3d
	ldrb r7, [r0]
	orrs r3, r7
	strb r3, [r0]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldr r0, _080688B0 @ =0x0000F3FF
	ldrh r1, [r5, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068890: .4byte 0x08BDB534
_08068894: .4byte 0x081F65A0
_08068898: .4byte 0x082739E4
_0806889C: .4byte 0x08273AE4
_080688A0: .4byte 0x02023460
_080688A4: .4byte 0x03002870
_080688A8: .4byte 0x0000FFE0
_080688AC: .4byte 0x0000E0FF
_080688B0: .4byte 0x0000F3FF
