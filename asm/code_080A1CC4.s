	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1CC4
sub_080A1CC4: @ 0x080A1CC4
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveWriteAddr
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A1D0C @ =0x0203ECC8
	ldr r2, _080A1D10 @ =0x01000064
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc8
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A1D14 @ =0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl WriteSaveBlockInfo
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D0C: .4byte 0x0203ECC8
_080A1D10: .4byte 0x01000064
_080A1D14: .4byte 0x00020112
