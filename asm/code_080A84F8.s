	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_Loop_RotateCarousel
ModeSelect_Loop_RotateCarousel: @ 0x080A84F8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x30]
	subs r0, r1, r2
	mov r3, r8
	ldr r6, [r3, #0x34]
	adds r4, r0, #0
	muls r4, r6, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r5, [r3, #0x2c]
	adds r5, #1
	str r5, [r3, #0x2c]
	asrs r4, r4, #2
	movs r0, #0x1e
	subs r0, r0, r5
	adds r1, r4, #0
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xe1
	lsls r1, r1, #2
	bl __divsi3
	subs r4, r4, r0
	lsls r4, r4, #2
	adds r0, r6, #0
	muls r0, r4, r0
	mov r1, r8
	ldrh r1, [r1, #0x30]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r5, #0xd
	bne _080A855A
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl LoadModeSelectChapterGfx
_080A855A:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0xe
	bne _080A8578
	mov r1, r8
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl StartModeSelectFace
	mov r3, r8
	str r0, [r3, #0x3c]
_080A8578:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	cmp r0, #0x14
	bne _080A8590
	adds r1, #0x41
	mov r0, r8
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl PutModeSelectCharacterText
_080A8590:
	mov r2, r8
	ldr r0, [r2, #0x2c]
	cmp r0, #0x1e
	bne _080A85A8
	ldr r0, _080A861C @ =0x00000FFF
	ldrh r3, [r2, #0x32]
	ands r0, r3
	adds r7, r0, #0
	strh r7, [r2, #0x30]
	mov r0, r8
	bl Proc_Break
_080A85A8:
	ldr r4, _080A8620 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	adds r0, r7, #0
	bl sub_080A7C08
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A861C: .4byte 0x00000FFF
_080A8620: .4byte 0x080C5A48
