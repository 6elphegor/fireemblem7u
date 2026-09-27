	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxStatusUnitFlashing
EfxStatusUnitFlashing: @ 0x0804F85C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F8C4
	ldr r0, _0804F8B8 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _0804F8BC @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0804F8C0 @ =0xFFFFFD20
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
	bl CheckInEkrDragon
	cmp r0, #0
	beq _0804F8E6
	mov r0, r8
	bl BanimSetFrontPaletteForDragon
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
	b _0804F8E6
	.align 2, 0
_0804F8B8: .4byte 0x02000054
_0804F8BC: .4byte 0x02022B40
_0804F8C0: .4byte 0xFFFFFD20
_0804F8C4:
	ldr r0, _0804F8F4 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _0804F8F8 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0804F8FC @ =0xFFFFFCE0
	adds r4, r4, r0
	str r5, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r7, #0
	bl EfxPalFlashingInOut
_0804F8E6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F8F4: .4byte 0x02000054
_0804F8F8: .4byte 0x02022B80
_0804F8FC: .4byte 0xFFFFFCE0
