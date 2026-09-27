	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ABEF4
sub_080ABEF4: @ 0x080ABEF4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	mov sb, r0
	adds r0, #0x3b
	movs r5, #0
	strb r5, [r0]
	ldr r6, _080ABFAC @ =0x08CE5480
	ldr r0, [r6]
	movs r1, #6
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1a
	bl PutUiWindowFrame
	ldr r0, [r6]
	movs r1, #4
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #9
	bl PutUiWindowFrame
	ldr r0, [r6]
	movs r1, #0xb0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, _080ABFB0 @ =0x08414884
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl TmApplyTsa_thm
	ldr r0, [r6]
	movs r1, #0xc
	str r1, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xa
	movs r2, #7
	movs r3, #0x11
	bl PutUiWindowFrame
	ldr r0, [r6]
	ldr r1, _080ABFB4 @ =0x000004D4
	adds r0, r0, r1
	ldr r1, _080ABFB8 @ =0x08414918
	mov r2, r8
	bl TmApplyTsa_thm
	ldr r0, _080ABFBC @ =0x02023C60
	ldr r4, _080ABFC0 @ =0x08CE5484
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, [r4]
	mov r1, sb
	bl sub_080AB75C
	ldr r0, [r6]
	movs r2, #0xc8
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, _080ABFC4 @ =0x08413D90
	mov r2, r8
	bl TmApplyTsa_thm
	bl HideSysHandCursor
	movs r0, #0
	bl SetUiSpinningArrowConfig
	movs r0, #0x3a
	add sb, r0
	mov r1, sb
	strb r5, [r1]
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ABFAC: .4byte 0x08CE5480
_080ABFB0: .4byte 0x08414884
_080ABFB4: .4byte 0x000004D4
_080ABFB8: .4byte 0x08414918
_080ABFBC: .4byte 0x02023C60
_080ABFC0: .4byte 0x08CE5484
_080ABFC4: .4byte 0x08413D90
