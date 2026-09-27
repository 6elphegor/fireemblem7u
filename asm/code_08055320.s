	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055320
sub_08055320: @ 0x08055320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, _08055364 @ =0x08B9B29C
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl sub_08050798
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi _080553B4
	lsls r0, r0, #2
	ldr r1, _08055368 @ =_0805536C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055364: .4byte 0x08B9B29C
_08055368: .4byte _0805536C
_0805536C: @ jump table
	.4byte _08055380 @ case 0
	.4byte _08055388 @ case 1
	.4byte _080553A0 @ case 2
	.4byte _080553B4 @ case 3
	.4byte _08055380 @ case 4
_08055380:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b _080553D4
_08055388:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, _0805539C @ =0x02017744
	ldr r0, [r0]
	movs r5, #4
	rsbs r5, r5, #0
_08055396:
	cmp r0, #1
	bne _080553D6
	b _080553D4
	.align 2, 0
_0805539C: .4byte 0x02017744
_080553A0:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, _080553B0 @ =0x02017744
	ldr r0, [r0]
	movs r5, #0x1e
	rsbs r5, r5, #0
	b _08055396
	.align 2, 0
_080553B0: .4byte 0x02017744
_080553B4:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080553C6
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
_080553C6:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq _080553D4
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
_080553D4:
	movs r5, #0
_080553D6:
	movs r1, #1
	rsbs r1, r1, #0
	mov sb, r1
	lsls r2, r4, #1
	ldr r4, _0805545C @ =0x0201CF78
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, sb
	movs r3, #0x42
	bl EfxTmCpyExt
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, _08055460 @ =0xFFFFFA96
	adds r4, r4, r2
	ldr r2, _08055464 @ =0x02023C60
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl EnableBgSync
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805545C: .4byte 0x0201CF78
_08055460: .4byte 0xFFFFFA96
_08055464: .4byte 0x02023C60
