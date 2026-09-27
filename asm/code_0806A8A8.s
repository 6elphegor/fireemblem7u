	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTriPegasusKnightOBJ
NewEkrTriPegasusKnightOBJ: @ 0x0806A8A8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _0806A8DC @ =0x08BDB8D4
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _0806A8E8
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _0806A8E0 @ =0x0203E0A8
	ldr r6, [r0]
	ldr r3, _0806A8E4 @ =0x08BDBE04
	b _0806A8F2
	.align 2, 0
_0806A8DC: .4byte 0x08BDB8D4
_0806A8E0: .4byte 0x0203E0A8
_0806A8E4: .4byte 0x08BDBE04
_0806A8E8:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _0806A93C @ =0x0203E0A8
	ldr r6, [r0, #4]
	ldr r3, _0806A940 @ =0x08BDC138
_0806A8F2:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldr r4, _0806A944 @ =0x0201A784
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806A948 @ =0x082E8070
	mov r1, r8
	cmp r1, #0
	beq _0806A924
	ldr r0, _0806A94C @ =0x082E93F4
	mov r1, sb
	cmp r1, #0
	bne _0806A924
	ldr r0, _0806A950 @ =0x082E8A28
_0806A924:
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A93C: .4byte 0x0203E0A8
_0806A940: .4byte 0x08BDC138
_0806A944: .4byte 0x0201A784
_0806A948: .4byte 0x082E8070
_0806A94C: .4byte 0x082E93F4
_0806A950: .4byte 0x082E8A28
