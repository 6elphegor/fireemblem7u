	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ABD90
sub_080ABD90: @ 0x080ABD90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r1, [r6]
	rsbs r0, r1, #0
	movs r1, #3
	bl __divsi3
	adds r5, r4, #0
	adds r5, #0x3c
	strb r0, [r5]
	ldrb r1, [r6]
	rsbs r0, r1, #0
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	adds r7, r4, #0
	adds r7, #0x3d
	strb r0, [r7]
	ldrb r0, [r6]
	adds r6, #3
	strb r0, [r6]
	ldr r0, _080ABEE0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080ABEE4 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080ABEE8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r4, _080ABEEC @ =0x08CE5480
	ldr r0, [r4]
	movs r1, #2
	mov sl, r1
	str r1, [sp]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #1
	str r1, [sp, #4]
	movs r1, #0x1a
	str r1, [sp, #8]
	movs r1, #6
	mov sb, r1
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #7
	mov r8, r1
	str r1, [sp, #4]
	movs r5, #9
	str r5, [sp, #8]
	movs r1, #4
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r1, #2
	str r1, [sp]
	movs r1, #0xb
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #8
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0xb
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xb
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	movs r1, #0x11
	str r1, [sp, #8]
	movs r1, #0xc
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #7
	movs r3, #1
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	movs r5, #5
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #0x13
	movs r3, #1
	bl sub_080A8838
	ldr r4, _080ABEF0 @ =0x08CE5484
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0xc
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x20
	str r1, [sp, #0xc]
	movs r1, #0xc
	movs r2, #0
	movs r3, #2
	bl sub_080A8838
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #0x16
	str r1, [sp]
	str r5, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	mov r1, sl
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_080A8838
	movs r0, #7
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABEE0: .4byte 0x02022C60
_080ABEE4: .4byte 0x02023460
_080ABEE8: .4byte 0x02023C60
_080ABEEC: .4byte 0x08CE5480
_080ABEF0: .4byte 0x08CE5484
