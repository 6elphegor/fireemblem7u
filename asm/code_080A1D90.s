	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1D90
sub_080A1D90: @ 0x080A1D90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r6, r0, #0
	ldr r0, _080A1E1C @ =0x03005E70
	mov sb, r0
	movs r4, #0xc8
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, sb
	ldr r3, [r1]
	ldr r1, _080A1E20 @ =0x0203ECC8
	movs r2, #0xc8
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A1E24 @ =0x0203ED90
	mov r8, r1
	mov r0, sb
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc8
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A1E20 @ =0x0203ECC8
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1E28 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E1C: .4byte 0x03005E70
_080A1E20: .4byte 0x0203ECC8
_080A1E24: .4byte 0x0203ED90
_080A1E28: .4byte 0x00020112
