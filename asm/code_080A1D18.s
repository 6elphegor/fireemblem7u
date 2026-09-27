	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1D18
sub_080A1D18: @ 0x080A1D18
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov sb, r1
	movs r0, #5
	bl GetSaveReadAddr
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r5, r0, #0
	ldr r1, _080A1D84 @ =0x03005E70
	movs r0, #0xc8
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A1D88 @ =0x0203ECC8
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc8
	bl _call_via_r3
	mov r1, r8
	mov r0, sb
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D8C @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D84: .4byte 0x03005E70
_080A1D88: .4byte 0x0203ECC8
_080A1D8C: .4byte 0x00020112
