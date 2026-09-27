	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrTriArmorKnightOBJ
NewEkrTriArmorKnightOBJ: @ 0x0806AA84
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov sb, r2
	adds r6, r3, #0
	ldr r0, _0806AABC @ =0x08BDB904
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _0806AAC0 @ =0x0203E0A8
	ldr r7, [r0]
	cmp r4, #0
	bne _0806AACC
	ldr r3, _0806AAC4 @ =0x08BDC1D0
	ldr r6, _0806AAC8 @ =0x082E9D9C
	b _0806AAF8
	.align 2, 0
_0806AABC: .4byte 0x08BDB904
_0806AAC0: .4byte 0x0203E0A8
_0806AAC4: .4byte 0x08BDC1D0
_0806AAC8: .4byte 0x082E9D9C
_0806AACC:
	cmp r6, #1
	beq _0806AAE4
	cmp r6, #1
	bhs _0806AAF4
	ldr r3, _0806AADC @ =0x08BDC260
	ldr r6, _0806AAE0 @ =0x082EA0BC
	b _0806AAF8
	.align 2, 0
_0806AADC: .4byte 0x08BDC260
_0806AAE0: .4byte 0x082EA0BC
_0806AAE4:
	ldr r3, _0806AAEC @ =0x08BDC2F0
	ldr r6, _0806AAF0 @ =0x082EA490
	b _0806AAF8
	.align 2, 0
_0806AAEC: .4byte 0x08BDC2F0
_0806AAF0: .4byte 0x082EA490
_0806AAF4:
	ldr r3, _0806AB38 @ =0x08BDC37C
	ldr r6, _0806AB3C @ =0x082EA8C4
_0806AAF8:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _0806AB40 @ =0x00008840
	strh r0, [r1, #8]
	ldr r4, _0806AB44 @ =0x0201A784
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AB48 @ =0x02022B60
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0806AB4C @ =0x0203E0A8
	ldr r7, [r0, #4]
	mov r0, sb
	cmp r0, #0
	bne _0806AB58
	ldr r3, _0806AB50 @ =0x08BDC1D0
	ldr r6, _0806AB54 @ =0x082E9D9C
	b _0806AB84
	.align 2, 0
_0806AB38: .4byte 0x08BDC37C
_0806AB3C: .4byte 0x082EA8C4
_0806AB40: .4byte 0x00008840
_0806AB44: .4byte 0x0201A784
_0806AB48: .4byte 0x02022B60
_0806AB4C: .4byte 0x0203E0A8
_0806AB50: .4byte 0x08BDC1D0
_0806AB54: .4byte 0x082E9D9C
_0806AB58:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _0806AB70
	cmp r0, #1
	bhs _0806AB80
	ldr r3, _0806AB68 @ =0x08BDC260
	ldr r6, _0806AB6C @ =0x082EA0BC
	b _0806AB84
	.align 2, 0
_0806AB68: .4byte 0x08BDC260
_0806AB6C: .4byte 0x082EA0BC
_0806AB70:
	ldr r3, _0806AB78 @ =0x08BDC2F0
	ldr r6, _0806AB7C @ =0x082EA490
	b _0806AB84
	.align 2, 0
_0806AB78: .4byte 0x08BDC2F0
_0806AB7C: .4byte 0x082EA490
_0806AB80:
	ldr r3, _0806ABEC @ =0x08BDC37C
	ldr r6, _0806ABF0 @ =0x082EA8C4
_0806AB84:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _0806ABF4 @ =0x0000A880
	strh r0, [r1, #8]
	ldr r4, _0806ABF8 @ =0x0201AF84
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806ABFC @ =0x02022BA0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _0806AC00 @ =0x06010800
	ldr r0, _0806AC04 @ =0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterDataMove
	bl EnablePalSync
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABEC: .4byte 0x08BDC37C
_0806ABF0: .4byte 0x082EA8C4
_0806ABF4: .4byte 0x0000A880
_0806ABF8: .4byte 0x0201AF84
_0806ABFC: .4byte 0x02022BA0
_0806AC00: .4byte 0x06010800
_0806AC04: .4byte 0xFFFFF800
