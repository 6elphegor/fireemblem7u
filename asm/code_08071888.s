	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08071888
sub_08071888: @ 0x08071888
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldrh r0, [r1]
	cmp r0, #2
	bls _08071910
	bl DeleteAllPaletteAnimator
	ldr r0, _08071904 @ =0x083F695C
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	ldr r4, _08071908 @ =0x083F699C
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _0807190C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _080718CE
	adds r0, #7
_080718CE:
	asrs r1, r0, #3
	subs r0, r1, #4
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _080718DE
	adds r1, #7
_080718DE:
	asrs r2, r1, #3
	subs r1, r2, #4
	movs r2, #0
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #8
	movs r3, #0x3c
	bl sub_08071B34
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8c
	bl PlaySeSpacial
	b _080719AA
	.align 2, 0
_08071904: .4byte 0x083F695C
_08071908: .4byte 0x083F699C
_0807190C: .4byte 0x06002800
_08071910:
	ldr r0, _080719B4 @ =0x08C9DA14
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #4]
	ldr r0, _080719B4 @ =0x08C9DA14
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	cmp r0, #0
	bge _0807194E
	adds r0, #7
_0807194E:
	asrs r0, r0, #3
	ldr r2, [r7, #4]
	adds r1, r0, r2
	subs r0, r1, #3
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	adds r1, r2, #0
	cmp r1, #0
	bge _08071962
	adds r1, #7
_08071962:
	asrs r1, r1, #3
	ldr r3, [r7, #8]
	adds r2, r1, r3
	subs r1, r2, #3
	movs r2, #8
	str r2, [sp]
	ldr r2, [r7]
	str r2, [sp, #4]
	movs r2, #6
	movs r3, #0xa
	bl sub_08071B34
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x89
	bl PlaySeSpacial
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x42
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
_080719AA:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080719B4: .4byte 0x08C9DA14
