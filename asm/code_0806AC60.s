	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTriArmorKnightOBJ2
NewEkrTriArmorKnightOBJ2: @ 0x0806AC60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0806AC9C @ =0x08BDB91C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _0806ACA4
	ldr r0, _0806ACA0 @ =0x0203E0A8
	ldr r0, [r0]
	b _0806ACA8
	.align 2, 0
_0806AC9C: .4byte 0x08BDB91C
_0806ACA0: .4byte 0x0203E0A8
_0806ACA4:
	ldr r0, _0806ACB4 @ =0x0203E0A8
	ldr r0, [r0, #4]
_0806ACA8:
	mov sb, r0
	cmp r6, #0
	bne _0806ACC0
	ldr r3, _0806ACB8 @ =0x08BDC46C
	ldr r6, _0806ACBC @ =0x082EAC84
	b _0806ACEC
	.align 2, 0
_0806ACB4: .4byte 0x0203E0A8
_0806ACB8: .4byte 0x08BDC46C
_0806ACBC: .4byte 0x082EAC84
_0806ACC0:
	cmp r7, #1
	beq _0806ACD8
	cmp r7, #1
	bhs _0806ACE8
	ldr r3, _0806ACD0 @ =0x08BDC5E4
	ldr r6, _0806ACD4 @ =0x082EB1BC
	b _0806ACEC
	.align 2, 0
_0806ACD0: .4byte 0x08BDC5E4
_0806ACD4: .4byte 0x082EB1BC
_0806ACD8:
	ldr r3, _0806ACE0 @ =0x08BDC738
	ldr r6, _0806ACE4 @ =0x082EB8F8
	b _0806ACEC
	.align 2, 0
_0806ACE0: .4byte 0x08BDC738
_0806ACE4: .4byte 0x082EB8F8
_0806ACE8:
	ldr r3, _0806AD18 @ =0x08BDCA00
	ldr r6, _0806AD1C @ =0x082EC084
_0806ACEC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _0806AD20
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _0806AD36
	.align 2, 0
_0806AD18: .4byte 0x08BDCA00
_0806AD1C: .4byte 0x082EC084
_0806AD20:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_0806AD36:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _0806AD6C @ =0x0201A784
	mov r0, sb
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AD6C: .4byte 0x0201A784
