	.include "macro.inc"

	.syntax unified

	thumb_func_start TitleFlame_Loop
TitleFlame_Loop: @ 0x080BADA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x66
	ldrh r1, [r4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x11
	cmp r0, #0x10
	bgt _080BADF0
	adds r0, r1, #1
	strh r0, [r4]
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	cmp r0, #0x10
	bgt _080BADDC
	asrs r1, r2, #0x13
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r0, r2, #0x12
	movs r3, #0x34
	rsbs r3, r3, #0
	adds r2, r3, #0
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl SetBgOffset
_080BADDC:
	ldr r3, _080BAE48 @ =0x02000002
	ldrh r4, [r4]
	lsls r1, r4, #0x10
	asrs r2, r1, #0x11
	asrs r1, r1, #0x12
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r2, r2, r0
	strh r2, [r3]
_080BADF0:
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, #0x64
	movs r6, #0
	ldrsh r1, [r5, r6]
	ldr r4, _080BAE4C @ =0x02000004
	movs r7, #4
	ldrsh r2, [r4, r7]
	movs r6, #0
	ldrsh r3, [r4, r6]
	movs r6, #0
	str r6, [sp]
	bl sub_08076FC4
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	movs r7, #0
	ldrsh r1, [r5, r7]
	movs r3, #0xc
	ldrsh r2, [r4, r3]
	movs r7, #8
	ldrsh r3, [r4, r7]
	str r6, [sp]
	bl sub_08076FC4
	bl SwapScanlineBufs
	ldrh r2, [r4, #0x10]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE48: .4byte 0x02000002
_080BAE4C: .4byte 0x02000004
