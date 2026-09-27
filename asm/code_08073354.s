	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073354
sub_08073354: @ 0x08073354
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0xfd
	bl PlaySeSpacial
	bl InitScanlineEffect
	bl sub_0807689C
	ldr r1, _08073420 @ =sub_08076A78
	adds r0, r1, #0
	bl SetOnHBlankA
	bl sub_08073D80
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073424 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073428 @ =0x02023C60
	ldr r1, _0807342C @ =0x02020140
	ldr r2, _08073430 @ =0x00004140
	bl TmApplyTsa_t
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #1
	ldr r3, [r7]
	bl sub_08073EF4
	ldr r1, _08073434 @ =0x08C9E98C
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073420: .4byte sub_08076A78
_08073424: .4byte 0x03002870
_08073428: .4byte 0x02023C60
_0807342C: .4byte 0x02020140
_08073430: .4byte 0x00004140
_08073434: .4byte 0x08C9E98C

	thumb_func_start sub_08073438
sub_08073438: @ 0x08073438
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb
	ble _0807347A
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_0807347A:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	adds r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _080734C0 @ =0x08C9DCDC
	str r3, [sp]
	movs r3, #0xc
	bl sub_08076D8C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734C0: .4byte 0x08C9DCDC

	thumb_func_start sub_080734C4
sub_080734C4: @ 0x080734C4
	push {r4, r5, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bgt _08073506
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	bl Proc_Break
_08073506:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldr r3, [r7]
	ldr r4, [r7]
	adds r2, r4, #0
	adds r4, #0x48
	ldrh r5, [r4]
	subs r2, r5, #1
	adds r4, r3, #0
	adds r3, #0x48
	ldrh r4, [r3]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r2, #0
	orrs r5, r4
	adds r4, r5, #0
	strh r4, [r3]
	lsls r3, r2, #0x10
	asrs r2, r3, #0x10
	ldr r3, _0807354C @ =0x08C9DCDC
	str r3, [sp]
	movs r3, #0xc
	bl sub_08076D8C
	add sp, #8
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807354C: .4byte 0x08C9DCDC

	thumb_func_start sub_08073550
sub_08073550: @ 0x08073550
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080735B0 @ =0x08C9DCE4
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080735B4 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080735B4 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080735B0: .4byte 0x08C9DCE4
_080735B4: .4byte 0x0202BBB8

	thumb_func_start sub_080735B8
sub_080735B8: @ 0x080735B8
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x83
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r4, _080736C4 @ =0x083F8FBC
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080736C8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080736CC @ =0x083F8B7C
	ldr r1, _080736D0 @ =0x06013800
	bl Decompress
	ldr r1, _080736D4 @ =0x083F90CC
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080736D4 @ =0x083F90CC
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080736D8 @ =0x083F90EC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r2, r3, #0
	orrs r2, r4
	ldr r3, _080736DC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E0 @ =0x030028AC
	ldr r1, _080736E0 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080736E4 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E0 @ =0x030028AC
	ldr r1, _080736E0 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080736E8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080736C4: .4byte 0x083F8FBC
_080736C8: .4byte 0x06002800
_080736CC: .4byte 0x083F8B7C
_080736D0: .4byte 0x06013800
_080736D4: .4byte 0x083F90CC
_080736D8: .4byte 0x083F90EC
_080736DC: .4byte 0x000041C0
_080736E0: .4byte 0x030028AC
_080736E4: .4byte 0x0000FFE0
_080736E8: .4byte 0x03002870

	thumb_func_start sub_080736EC
sub_080736EC: @ 0x080736EC
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x84
	bl PlaySeSpacial
	ldr r0, _080737C4 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _0807370C
	adds r1, #7
_0807370C:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _0807371C
	adds r2, #7
_0807371C:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _080737C8 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_080147BC
	movs r0, #4
	bl EnableBgSync
	ldr r0, _080737CC @ =0x030028AC
	ldr r1, _080737CC @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _080737D0 @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080737CC @ =0x030028AC
	ldr r1, _080737CC @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080737D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080737D4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080737C4: .4byte 0x02023C60
_080737C8: .4byte 0x00004140
_080737CC: .4byte 0x030028AC
_080737D0: .4byte 0x0000FFE0
_080737D4: .4byte 0x03002870

	thumb_func_start sub_080737D8
sub_080737D8: @ 0x080737D8
	push {r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [r7]
	ldr r0, _08073874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _08073874 @ =0x03002870
	adds r2, r1, #0
	adds r1, #0x44
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strb r0, [r1]
	ldr r0, _08073874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073874 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _0807386A
	ldr r0, [r7]
	bl Proc_Break
_0807386A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073874: .4byte 0x03002870

	thumb_func_start sub_08073878
sub_08073878: @ 0x08073878
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _080738D8 @ =0x08C9DD24
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _080738DC @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x30]
	ldr r0, [r7, #4]
	ldr r2, [r7]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080738DC @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	asrs r2, r3, #4
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	subs r1, r1, r2
	lsls r2, r1, #1
	adds r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #3
	str r1, [r0, #0x34]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080738D8: .4byte 0x08C9DD24
_080738DC: .4byte 0x0202BBB8

	thumb_func_start sub_080738E0
sub_080738E0: @ 0x080738E0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x88
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl sub_08073D80
	ldr r0, _080739A0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080739A0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080739A0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080739A0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r4, _080739A4 @ =0x083F9224
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _080739A8 @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r1, _080739AC @ =0x0827747C
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080739A0: .4byte 0x03002870
_080739A4: .4byte 0x083F9224
_080739A8: .4byte 0x06002800
_080739AC: .4byte 0x0827747C

	thumb_func_start sub_080739B0
sub_080739B0: @ 0x080739B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, _08073A44 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _080739CC
	adds r1, #7
_080739CC:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _080739DC
	adds r2, #7
_080739DC:
	asrs r3, r2, #3
	adds r2, r3, #0
	subs r2, #8
	ldr r3, _08073A48 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #0xa
	str r4, [sp, #4]
	ldr r4, _08073A4C @ =0x083F9DE0
	str r4, [sp, #8]
	ldr r4, _08073A50 @ =0x083FC5D4
	str r4, [r7, #4]
	ldr r5, [r7]
	adds r6, r5, #0
	adds r5, #0x48
	ldrh r6, [r5]
	adds r4, r6, #1
	mov r8, r4
	mov sb, r8
	mov r4, sb
	strh r4, [r5]
	lsls r6, r6, #0x10
	asrs r5, r6, #0x10
	ldr r6, [r7, #4]
	adds r4, r6, r5
	ldrb r5, [r4]
	str r5, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073A50 @ =0x083FC5D4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _08073A36
	ldr r0, [r7]
	bl Proc_Break
_08073A36:
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073A44: .4byte 0x02023C60
_08073A48: .4byte 0x00004140
_08073A4C: .4byte 0x083F9DE0
_08073A50: .4byte 0x083FC5D4

	thumb_func_start sub_08073A54
sub_08073A54: @ 0x08073A54
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, _08073AB4 @ =0x08C9DD4C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, _08073AB8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x30]
	ldr r0, [r7, #8]
	ldr r1, _08073AB8 @ =0x0202BBB8
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	ldr r2, [r7, #4]
	subs r1, r2, r1
	lsls r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r1, r2, #0
	adds r1, #8
	str r1, [r0, #0x34]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073AB4: .4byte 0x08C9DD4C
_08073AB8: .4byte 0x0202BBB8

	thumb_func_start sub_08073ABC
sub_08073ABC: @ 0x08073ABC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08073AEC @ =0x0203A85C
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r1, _08073AEC @ =0x0203A85C
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	ldr r1, _08073AEC @ =0x0203A85C
	movs r2, #0x14
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	bl StartAvailableDoorTileEvent
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073AEC: .4byte 0x0203A85C

	thumb_func_start sub_08073AF0
sub_08073AF0: @ 0x08073AF0
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08073B10 @ =0x0203A85C
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bics r0, r1
	str r0, [r4, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073B10: .4byte 0x0203A85C

	thumb_func_start sub_08073B14
sub_08073B14: @ 0x08073B14
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #0x10
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x8d
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _08073C28 @ =0x083F70C4
	movs r0, #2
	bl GetBgChrOffset
	ldr r2, _08073C2C @ =0x06002800
	adds r1, r0, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08073C30 @ =0x02023C60
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	cmp r1, #0
	bge _08073B50
	adds r1, #7
_08073B50:
	asrs r2, r1, #3
	subs r1, r2, #2
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	cmp r2, #0
	bge _08073B60
	adds r2, #7
_08073B60:
	asrs r3, r2, #3
	subs r2, r3, #2
	ldr r3, _08073C34 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	ldr r4, _08073C38 @ =0x083F71E4
	str r4, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	bl sub_080149A8
	movs r0, #4
	bl EnableBgSync
	ldr r0, _08073C3C @ =0x083F7050
	ldr r1, _08073C40 @ =0x06013800
	bl Decompress
	ldr r0, _08073C44 @ =0x083F70A4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073C48 @ =0x083F71C4
	ldr r1, [r7]
	str r1, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorReverse
	bl InitScanlineEffect
	bl sub_0807689C
	bl sub_08073D80
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x40
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073C4C @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073C28: .4byte 0x083F70C4
_08073C2C: .4byte 0x06002800
_08073C30: .4byte 0x02023C60
_08073C34: .4byte 0x00004140
_08073C38: .4byte 0x083F71E4
_08073C3C: .4byte 0x083F7050
_08073C40: .4byte 0x06013800
_08073C44: .4byte 0x083F70A4
_08073C48: .4byte 0x083F71C4
_08073C4C: .4byte 0x03002870

	thumb_func_start sub_08073C50
sub_08073C50: @ 0x08073C50
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #8
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08073CFA
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, _08073D04 @ =0x083ECCFC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073D08 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08073D04 @ =0x083ECCFC
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldr r3, _08073D08 @ =0x000041C0
	movs r4, #1
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_08073CFA:
	add sp, #0x10
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073D04: .4byte 0x083ECCFC
_08073D08: .4byte 0x000041C0

	thumb_func_start sub_08073D0C
sub_08073D0C: @ 0x08073D0C
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r0, #0
	ldrsh r3, [r1, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	str r0, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x48
	ldrh r3, [r2]
	adds r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	bl sub_080769CC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1d
	ble _08073D76
	ldr r0, [r7]
	bl Proc_Break
_08073D76:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08073D80
sub_08073D80: @ 0x08073D80
	push {r7, lr}
	mov r7, sp
	ldr r0, _08073EE4 @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _08073EE4 @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _08073EE4 @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _08073EE4 @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _08073EE8 @ =0x030028AC
	ldr r1, _08073EE8 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08073EEC @ =0x0000FFE0
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073EE8 @ =0x030028AC
	ldr r1, _08073EE8 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE8 @ =0x030028AC
	ldr r1, _08073EE8 @ =0x030028AC
	ldrh r2, [r1]
	ldr r3, _08073EF0 @ =0x0000E0FF
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073EE8 @ =0x030028AC
	ldr r1, _08073EE8 @ =0x030028AC
	ldrh r2, [r1]
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08073EE4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073EE4: .4byte 0x03002870
_08073EE8: .4byte 0x030028AC
_08073EEC: .4byte 0x0000FFE0
_08073EF0: .4byte 0x0000E0FF

	thumb_func_start sub_08073EF4
sub_08073EF4: @ 0x08073EF4
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08073F6C @ =0x08C9DDA4
	ldr r1, [r7, #0xc]
	bl SpawnProc
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x58]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x66
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	ldr r0, [r7, #0x10]
	adds r1, r0, #0
	adds r0, #0x68
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x6a
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073F6C: .4byte 0x08C9DDA4

	thumb_func_start sub_08073F70
sub_08073F70: @ 0x08073F70
	push {r7, lr}
	mov r7, sp
	ldr r1, _08073F84 @ =0x08C9DDA4
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073F84: .4byte 0x08C9DDA4

	thumb_func_start sub_08073F88
sub_08073F88: @ 0x08073F88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x58]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r1, [r2]
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x68
	ldrh r2, [r3]
	bl SetBgOffset
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x66
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x68
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x6a
	ldrh r1, [r1]
	ldrh r2, [r3]
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08074008
sub_08074008: @ 0x08074008
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _080740A4 @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r5, _080740A8 @ =0x081DAFEC
	movs r0, #1
	bl GetBgChrOffset
	ldr r2, _080740AC @ =0x06004000
	adds r1, r0, r2
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080740B0 @ =0x081DB238
	ldr r1, _080740B4 @ =0x02020140
	bl Decompress
	ldr r0, _080740B4 @ =0x02020140
	ldr r1, _080740A4 @ =0x02023460
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	bl sub_08014C50
	ldr r1, _080740B8 @ =0x081DB334
	adds r0, r1, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r7, #8]
	lsls r0, r1, #5
	adds r1, r0, #1
	ldr r2, [r7, #4]
	adds r0, r1, r2
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080740BC @ =0x02022C60
	adds r5, r0, r1
	ldr r0, _080740C0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMsg
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl PutString
	movs r0, #0
	str r0, [r7, #0xc]
_0807408E:
	ldr r0, _080740C4 @ =0x08C9DDB4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _080740C8
	b _0807415C
	.align 2, 0
_080740A4: .4byte 0x02023460
_080740A8: .4byte 0x081DAFEC
_080740AC: .4byte 0x06004000
_080740B0: .4byte 0x081DB238
_080740B4: .4byte 0x02020140
_080740B8: .4byte 0x081DB334
_080740BC: .4byte 0x02022C60
_080740C0: .4byte 0x0203E0FC
_080740C4: .4byte 0x08C9DDB4
_080740C8:
	ldr r0, _0807412C @ =0x08C9DDB4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r0, [r7, #8]
	adds r1, r1, r0
	lsls r0, r1, #5
	ldr r1, _0807412C @ =0x08C9DDB4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _08074130 @ =0x02022C60
	adds r5, r0, r1
	ldr r6, _0807412C @ =0x08C9DDB4
	ldr r0, [r7, #0xc]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #2
	adds r4, r0, #0
	ldr r0, _08074134 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl UnitKnowsMagic
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #1
	bne _08074138
	adds r0, r4, #4
	b _0807413A
	.align 2, 0
_0807412C: .4byte 0x08C9DDB4
_08074130: .4byte 0x02022C60
_08074134: .4byte 0x0203E0FC
_08074138:
	adds r0, r4, #0
_0807413A:
	adds r1, r6, #4
	adds r0, r1, r0
	ldr r1, [r0]
	ldr r2, [r1]
	adds r0, r2, #0
	bl GetMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #3
	movs r2, #3
	bl PutStringCentered
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807408E
_0807415C:
	movs r0, #3
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807416C
sub_0807416C: @ 0x0807416C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0x28]
	adds r1, r7, #0
	adds r1, #0x10
	strb r0, [r1]
	ldr r0, _080741EC @ =0x08C9DDB4
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	ldr r2, [r7, #8]
	adds r0, r1, r2
	lsls r1, r0, #5
	adds r0, r1, #4
	ldr r1, _080741EC @ =0x08C9DDB4
	ldr r2, [r7, #0xc]
	adds r5, r2, #0
	lsls r3, r5, #1
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1]
	ldr r3, [r7, #4]
	adds r1, r2, r3
	adds r0, r0, r1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, _080741F0 @ =0x02022C60
	adds r5, r0, r1
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_0807436C
	adds r4, r0, #0
	adds r6, r4, #0
	adds r0, r7, #0
	adds r0, #0x10
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080741DA
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	bl sub_080741F4
	adds r6, r6, r0
_080741DA:
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080741EC: .4byte 0x08C9DDB4
_080741F0: .4byte 0x02022C60

	thumb_func_start sub_080741F4
sub_080741F4: @ 0x080741F4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	cmp r0, #8
	bls _08074206
	b _08074360
_08074206:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _08074214 @ =_08074218
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_08074214: .4byte _08074218
_08074218: @ jump table
	.4byte _0807423C @ case 0
	.4byte _08074240 @ case 1
	.4byte _08074264 @ case 2
	.4byte _08074288 @ case 3
	.4byte _080742AC @ case 4
	.4byte _080742D0 @ case 5
	.4byte _080742F4 @ case 6
	.4byte _08074318 @ case 7
	.4byte _0807433C @ case 8
_0807423C:
	movs r0, #1
	b _08074364
_08074240:
	ldr r0, _08074260 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x73
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074260: .4byte 0x0203E0FC
_08074264:
	ldr r0, _08074284 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x74
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074284: .4byte 0x0203E0FC
_08074288:
	ldr r0, _080742A8 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x75
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742A8: .4byte 0x0203E0FC
_080742AC:
	ldr r0, _080742CC @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x76
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742CC: .4byte 0x0203E0FC
_080742D0:
	ldr r0, _080742F0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x79
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_080742F0: .4byte 0x0203E0FC
_080742F4:
	ldr r0, _08074314 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x77
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074314: .4byte 0x0203E0FC
_08074318:
	ldr r0, _08074338 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x78
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_08074338: .4byte 0x0203E0FC
_0807433C:
	ldr r0, _0807435C @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x7a
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074364
	.align 2, 0
_0807435C: .4byte 0x0203E0FC
_08074360:
	movs r0, #0
	b _08074364
_08074364:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0807436C
sub_0807436C: @ 0x0807436C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080743A8 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl GetUnit
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #8
	bhi _08074454
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #2
	ldr r1, _080743AC @ =_080743B0
	adds r0, r0, r1
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_080743A8: .4byte 0x0203E0FC
_080743AC: .4byte _080743B0
_080743B0: @ jump table
	.4byte _080743D4 @ case 0
	.4byte _080743F8 @ case 1
	.4byte _08074402 @ case 2
	.4byte _0807440C @ case 3
	.4byte _08074416 @ case 4
	.4byte _08074420 @ case 5
	.4byte _0807442A @ case 6
	.4byte _08074434 @ case 7
	.4byte _0807443E @ case 8
_080743D4:
	ldr r0, _080743F4 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #0x70
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r1, #0
	b _08074458
	.align 2, 0
_080743F4: .4byte 0x0203E0FC
_080743F8:
	ldr r0, [r7, #8]
	movs r1, #0x12
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074402:
	ldr r0, [r7, #8]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807440C:
	ldr r0, [r7, #8]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074416:
	ldr r0, [r7, #8]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074420:
	ldr r0, [r7, #8]
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807442A:
	ldr r0, [r7, #8]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_08074434:
	ldr r0, [r7, #8]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	b _08074458
_0807443E:
	ldr r0, [r7, #8]
	ldr r2, [r0, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r7, #8]
	ldr r2, [r0]
	movs r0, #0x13
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08074458
_08074454:
	movs r0, #0
	b _08074458
_08074458:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08074460
sub_08074460: @ 0x08074460
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08074474
sub_08074474: @ 0x08074474
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08074528 @ =0x08C9DE2C
	ldr r1, [r7, #0xc]
	bl SpawnProc
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, _0807452C @ =0x083F34B0
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074530 @ =0x06010000
	adds r1, r2, r3
	bl Decompress
	ldr r0, _08074534 @ =0x083F3450
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x10
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074534 @ =0x083F3450
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r1, #0x11
	adds r2, r1, #0
	lsls r1, r2, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08074538 @ =0x08C9DE3C
	ldr r1, [r7, #0x10]
	bl SpawnProc
	str r0, [r7, #0x14]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074528: .4byte 0x08C9DE2C
_0807452C: .4byte 0x083F34B0
_08074530: .4byte 0x06010000
_08074534: .4byte 0x083F3450
_08074538: .4byte 0x08C9DE3C

	thumb_func_start sub_0807453C
sub_0807453C: @ 0x0807453C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074550 @ =0x08C9DE2C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074550: .4byte 0x08C9DE2C

	thumb_func_start sub_08074554
sub_08074554: @ 0x08074554
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080745D4 @ =0x083F373C
	str r0, [r7, #0x20]
	ldr r1, _080745D8 @ =0x08C9DE2C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x1c]
	ldr r0, [r7, #0x1c]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0x14]
	ldr r1, [r7, #0x1c]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _080745E0
	ldr r0, _080745DC @ =0x083EBE54
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	b _08074734
	.align 2, 0
_080745D4: .4byte 0x083F373C
_080745D8: .4byte 0x08C9DE2C
_080745DC: .4byte 0x083EBE54
_080745E0:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _080745EC
	movs r0, #0
	str r0, [r7, #0x10]
	b _080745F0
_080745EC:
	movs r0, #1
	str r0, [r7, #0x10]
_080745F0:
	ldr r0, _0807473C @ =0x083EBE54
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x1c]
	ldrh r3, [r1, #0x2c]
	ldr r4, [r7, #0x10]
	adds r1, r3, r4
	movs r3, #0xf
	ands r1, r3
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0x14]
	adds r1, r1, r3
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	ldr r1, [r7, #0x10]
	adds r4, r1, #1
	str r4, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _0807473C @ =0x083EBE54
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x18]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	ldr r4, [r7, #0x10]
	adds r5, r4, #3
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #0xc]
	cmp r0, #0
	ble _080746BE
	ldr r0, _0807473C @ =0x083EBE54
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x1c]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x14]
	adds r3, r3, r4
	ldr r4, [r7, #0x1c]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
_080746BE:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _080746E2
	ldr r1, [r7, #0x20]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4c
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074740 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
_080746E2:
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _080746EA
	rsbs r0, r0, #0
_080746EA:
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074740 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08074712
	rsbs r0, r0, #0
_08074712:
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x20]
	adds r0, r1, r2
	ldr r2, [r7, #0x18]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074740 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
_08074734:
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807473C: .4byte 0x083EBE54
_08074740: .4byte 0x06010000

	thumb_func_start sub_08074744
sub_08074744: @ 0x08074744
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, sp, #8
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0807488C @ =0x083F373C
	str r0, [r7, #0x18]
	ldr r1, _08074890 @ =0x08C9DE2C
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7, #0x14]
	ldr r0, [r7, #0x14]
	ldrh r1, [r0, #0x2a]
	str r1, [r7, #0xc]
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x2a]
	ldr r2, [r7, #8]
	subs r1, r2, #1
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7, #4]
	ldr r1, [r7, #0x14]
	ldrh r3, [r1, #0x2c]
	movs r4, #0xf
	adds r1, r3, #0
	ands r1, r4
	adds r4, r1, #0
	lsls r3, r4, #0x10
	lsrs r1, r3, #0x10
	adds r3, r1, #0
	lsls r1, r3, #0xc
	ldr r3, [r7, #0xc]
	adds r1, r1, r3
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2e]
	movs r5, #3
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r5, r4, #0xa
	adds r3, r1, r5
	movs r1, #5
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	ldr r1, [r7]
	bl StartSpriteAnimProc
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7]
	subs r1, r2, #3
	ldr r2, [r7, #4]
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0x10]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #3
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, _08074894 @ =0x083EBE54
	ldr r2, [r7]
	adds r1, r2, #0
	subs r1, #0x12
	ldr r3, [r7, #4]
	subs r2, r3, #4
	ldr r3, [r7, #0x14]
	ldrh r4, [r3, #0x2c]
	movs r5, #0xf
	adds r3, r4, #0
	ands r3, r5
	adds r5, r3, #0
	lsls r4, r5, #0x10
	lsrs r3, r4, #0x10
	adds r4, r3, #0
	lsls r3, r4, #0xc
	ldr r4, [r7, #0xc]
	adds r3, r3, r4
	ldr r4, [r7, #0x14]
	ldrh r5, [r4, #0x2e]
	movs r6, #3
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	adds r5, r4, #0
	lsls r4, r5, #0xa
	adds r3, r3, r4
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r0, [r7, #8]
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x2d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074898 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	lsls r1, r0, #0x16
	lsrs r0, r1, #0x16
	lsls r1, r0, #5
	ldr r2, [r7, #0x18]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	adds r1, #0x4d
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	ldr r3, _08074898 @ =0x06010000
	adds r1, r2, r3
	movs r2, #0x20
	bl VramCopy
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807488C: .4byte 0x083F373C
_08074890: .4byte 0x08C9DE2C
_08074894: .4byte 0x083EBE54
_08074898: .4byte 0x06010000

	thumb_func_start sub_0807489C
sub_0807489C: @ 0x0807489C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _080748CC @ =0x08C9DE54
	ldr r1, [r7, #4]
	bl SpawnProcLocking
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080748CC: .4byte 0x08C9DE54

	thumb_func_start sub_080748D0
sub_080748D0: @ 0x080748D0
	push {r7, lr}
	mov r7, sp
	ldr r0, _080749F0 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080749F0 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080749F0 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x30
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080749F0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080749F0: .4byte 0x03002870

	thumb_func_start sub_080749F4
sub_080749F4: @ 0x080749F4
	push {r7, lr}
	mov r7, sp
	ldr r0, _08074A24 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08074A24 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08074A24 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074A24: .4byte 0x03002870

	thumb_func_start sub_08074A28
sub_08074A28: @ 0x08074A28
	push {r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	bl ResetTextFont
	ldr r1, _08074A5C @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	movs r1, #1
	movs r2, #1
	bl sub_08074008
	movs r0, #0
	str r0, [r7, #4]
_08074A52:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _08074A60
	b _08074A7C
	.align 2, 0
_08074A5C: .4byte 0x02022C60
_08074A60:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #0
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_0807416C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08074A52
_08074A7C:
	movs r0, #1
	bl EnableBgSync
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldrh r1, [r0, #0x32]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	ldr r3, _08074BE4 @ =0x0000FF70
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x32]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #0xc]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xc]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #0x10]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x10]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #0x14]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x14]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #0x18]
	movs r2, #0xfc
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x18]
	ldr r0, _08074BE8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074BE8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074BE8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074BE8 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _08074BE8 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08074BEC @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	ldr r0, [r7]
	movs r3, #0x32
	ldrsh r2, [r0, r3]
	movs r0, #0x20
	subs r3, r0, r2
	ldr r0, _08074BF0 @ =0x00001042
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	bl StartFace
	ldr r1, _08074BF4 @ =0x030041C0
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	movs r1, #3
	movs r2, #1
	ldr r3, [r7]
	bl sub_08074474
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074BE4: .4byte 0x0000FF70
_08074BE8: .4byte 0x03002870
_08074BEC: .4byte 0x0203E0FC
_08074BF0: .4byte 0x00001042
_08074BF4: .4byte 0x030041C0

	thumb_func_start sub_08074BF8
sub_08074BF8: @ 0x08074BF8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #0
	str r1, [r0, #0x54]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08074C10
sub_08074C10: @ 0x08074C10
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08074C38 @ =0x083F3074
	str r0, [r7, #8]
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldr r2, [r1, #0x54]
	adds r1, r2, #1
	str r1, [r0, #0x54]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	movs r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08074C3C
	b _08074C98
	.align 2, 0
_08074C38: .4byte 0x083F3074
_08074C3C:
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	asrs r0, r1, #2
	movs r1, #0xf
	ands r0, r1
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, [r7, #8]
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x40
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r2, r1, #0
	adds r2, #0x11
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	adds r1, #0x12
	movs r2, #0xe
	bl ApplyPaletteExt
_08074C98:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08074CA0
sub_08074CA0: @ 0x08074CA0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	adds r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _08074D10 @ =0x030041C0
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x30
	cmn r1, r0
	blt _08074D08
	ldr r0, [r7]
	bl Proc_Break
_08074D08:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D10: .4byte 0x030041C0

	thumb_func_start sub_08074D14
sub_08074D14: @ 0x08074D14
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	adds r1, r2, #0
	subs r1, #8
	ldrh r2, [r0, #0x32]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x32]
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7]
	ldrh r2, [r0, #0x32]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r1, _08074D84 @ =0x030041C0
	ldr r0, [r1]
	ldr r1, [r7]
	ldrh r2, [r1, #0x32]
	movs r3, #0x20
	subs r1, r3, r2
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x36]
	ldr r0, [r7]
	movs r2, #0x32
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	cmn r1, r0
	bgt _08074D7C
	ldr r0, [r7]
	bl Proc_Break
_08074D7C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D84: .4byte 0x030041C0

	thumb_func_start sub_08074D88
sub_08074D88: @ 0x08074D88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #4
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _08074DC4
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x31
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x31
	ldrb r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x31
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	b _08074EF0
_08074DC4:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	str r0, [r7, #4]
_08074DCE:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _08074DD6
	b _08074DF4
_08074DD6:
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_080741F4
	cmp r0, #0
	beq _08074DEC
	b _08074DF4
_08074DEC:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08074DCE
_08074DF4:
	ldr r0, [r7, #4]
	cmp r0, #8
	ble _08074E02
	ldr r0, [r7]
	bl Proc_Break
	b _08074EF0
_08074E02:
	ldr r1, [r7]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	ldr r3, [r7, #4]
	movs r1, #1
	str r1, [sp]
	movs r1, #1
	movs r2, #1
	bl sub_0807416C
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08074E98 @ =0x08C9DDB4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r4, r1, #0
	adds r4, #0x3e
	ldr r0, _08074E98 @ =0x08C9DDB4
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #1
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	adds r2, r1, #0
	lsls r0, r2, #3
	ldr r1, [r7]
	movs r3, #0x32
	ldrsh r2, [r1, r3]
	adds r1, r2, #0
	subs r1, #0x17
	subs r5, r0, r1
	ldr r6, [r7, #4]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #4]
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_080741F4
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_08074554
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	bne _08074EA4
	ldr r1, _08074E9C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08074E96
	ldr r1, _08074EA0 @ =0x000002CD
	adds r0, r1, #0
	bl m4aSongNumStart
_08074E96:
	b _08074EBC
	.align 2, 0
_08074E98: .4byte 0x08C9DDB4
_08074E9C: .4byte 0x0202BBF8
_08074EA0: .4byte 0x000002CD
_08074EA4:
	ldr r1, _08074EF8 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _08074EBC
	ldr r1, _08074EFC @ =0x00000396
	adds r0, r1, #0
	bl m4aSongNumStart
_08074EBC:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	adds r1, r2, #1
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x14
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_08074EF0:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074EF8: .4byte 0x0202BBF8
_08074EFC: .4byte 0x00000396

	thumb_func_start sub_08074F00
sub_08074F00: @ 0x08074F00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08074F20
sub_08074F20: @ 0x08074F20
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _08075074 @ =0x083F323C
	ldr r1, _08075078 @ =0x06013800
	bl Decompress
	ldr r0, _0807507C @ =0x083F3450
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	ldr r0, _08075080 @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075084 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	adds r0, #0x10
	str r0, [r7, #4]
	ldr r0, _08075080 @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075084 @ =0x0202BBB8
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #3
	adds r0, r1, #0
	subs r0, #8
	str r0, [r7, #8]
	ldr r0, _08075080 @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, _08075084 @ =0x0202BBB8
	movs r3, #0xe
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _08074FDA
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #8]
_08074FDA:
	ldr r0, _08075080 @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075084 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #3
	bgt _0807500C
	movs r0, #0x30
	str r0, [r7, #4]
_0807500C:
	ldr r0, _08075080 @ =0x0203E0FC
	ldr r2, [r7]
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldr r1, _08075084 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	asrs r1, r2, #4
	adds r3, r1, #0
	lsls r2, r3, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	lsls r1, r0, #1
	cmp r1, #0x19
	ble _0807503E
	movs r0, #0xd0
	str r0, [r7, #4]
_0807503E:
	ldr r0, _08075088 @ =0x083EC514
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, _0807508C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807506C
	ldr r1, _08075090 @ =0x0000037B
	adds r0, r1, #0
	bl m4aSongNumStart
_0807506C:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075074: .4byte 0x083F323C
_08075078: .4byte 0x06013800
_0807507C: .4byte 0x083F3450
_08075080: .4byte 0x0203E0FC
_08075084: .4byte 0x0202BBB8
_08075088: .4byte 0x083EC514
_0807508C: .4byte 0x0202BBF8
_08075090: .4byte 0x0000037B

	thumb_func_start sub_08075094
sub_08075094: @ 0x08075094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080750A8
sub_080750A8: @ 0x080750A8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080750C8
sub_080750C8: @ 0x080750C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ClearTalk
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080750DC
sub_080750DC: @ 0x080750DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080750FC
	ldr r1, _080750F8 @ =0x08C9DF14
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
	b _08075106
	.align 2, 0
_080750F8: .4byte 0x08C9DF14
_080750FC:
	ldr r1, _08075110 @ =0x08C9DF14
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
_08075106:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075110: .4byte 0x08C9DF14

	thumb_func_start sub_08075114
sub_08075114: @ 0x08075114
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075134 @ =0x02022920
	ldr r1, _08075138 @ =0x03004990
	movs r2, #0x50
	bl CpuFastSet
	movs r0, #0
	str r0, [r7, #4]
_0807512A:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _0807513C
	b _08075160
	.align 2, 0
_08075134: .4byte 0x02022920
_08075138: .4byte 0x03004990
_0807513C:
	ldr r0, _0807515C @ =0x08B92A28
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0x3c
	ldr r3, [r7]
	bl StartPalFade
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xf
	bl SetPalFadeStop
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0807512A
	.align 2, 0
_0807515C: .4byte 0x08B92A28
_08075160:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08075168
sub_08075168: @ 0x08075168
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08075188
	ldr r1, _08075184 @ =0x08C9DF2C
	adds r0, r1, #0
	ldr r1, [r7]
	bl SpawnProcLocking
	b _08075192
	.align 2, 0
_08075184: .4byte 0x08C9DF2C
_08075188:
	ldr r1, _0807519C @ =0x08C9DF2C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
_08075192:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807519C: .4byte 0x08C9DF2C

	thumb_func_start sub_080751A0
sub_080751A0: @ 0x080751A0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_080751AC:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _080751B4
	b _080751D8
_080751B4:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #5
	ldr r1, _080751D4 @ =0x03004990
	adds r0, r0, r1
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0xf
	ldr r3, [r7]
	bl StartPalFade
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080751AC
	.align 2, 0
_080751D4: .4byte 0x03004990
_080751D8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080751E0
sub_080751E0: @ 0x080751E0
	push {r7, lr}
	mov r7, sp
	ldr r1, _080751F4 @ =0x08C9DF44
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080751F4: .4byte 0x08C9DF44

	thumb_func_start sub_080751F8
sub_080751F8: @ 0x080751F8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08075218
sub_08075218: @ 0x08075218
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	bl RandNextB
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #9
	bl DivRem
	adds r1, r0, #0
	subs r0, r1, #4
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl SetBgOffset
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	adds r3, r2, #0
	strh r3, [r0]
	lsls r1, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	ble _080752C0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r7]
	bl Proc_Break
_080752C0:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080752C8
sub_080752C8: @ 0x080752C8
	push {r7, lr}
	mov r7, sp
	ldr r0, _080752E8 @ =0x083F5188
	ldr r1, _080752EC @ =0x06013800
	bl Decompress
	ldr r0, _080752F0 @ =0x083F51A8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080752E8: .4byte 0x083F5188
_080752EC: .4byte 0x06013800
_080752F0: .4byte 0x083F51A8

	thumb_func_start sub_080752F4
sub_080752F4: @ 0x080752F4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	movs r1, #4
	cmn r0, r1
	bge _08075308
	b _0807533A
_08075308:
	ldr r0, [r7]
	cmp r0, #0xeb
	ble _08075310
	b _0807533A
_08075310:
	ldr r0, [r7, #4]
	movs r1, #4
	cmn r0, r1
	bge _0807531A
	b _0807533A
_0807531A:
	ldr r0, [r7, #4]
	cmp r0, #0x9b
	ble _08075322
	b _0807533A
_08075322:
	ldr r1, [r7]
	subs r0, r1, #4
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	ldr r2, [r7, #4]
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08075344 @ =0x08B905B0
	ldr r3, _08075348 @ =0x000041C0
	bl PutOamHiRam
_0807533A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075344: .4byte 0x08B905B0
_08075348: .4byte 0x000041C0

	thumb_func_start sub_0807534C
sub_0807534C: @ 0x0807534C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080753A8 @ =0x080C5A48
	ldr r1, [r7, #0xc]
	movs r2, #0xff
	ands r1, r2
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r1, r0, #0xc
	ldr r2, [r7]
	adds r0, r1, r2
	ldr r1, _080753A8 @ =0x080C5A48
	ldr r2, [r7, #0xc]
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	adds r3, #0x40
	adds r2, r3, #0
	lsls r3, r2, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #8]
	adds r1, r2, #0
	muls r1, r3, r1
	asrs r2, r1, #0xc
	ldr r3, [r7, #4]
	adds r1, r2, r3
	bl sub_080752F4
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753A8: .4byte 0x080C5A48

	thumb_func_start sub_080753AC
sub_080753AC: @ 0x080753AC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl sub_080752C8
	movs r0, #0
	str r0, [r7, #4]
_080753BC:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _080753C4
	b _08075410
_080753C4:
	ldr r0, _0807540C @ =0x03004910
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807540C @ =0x03004910
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #3
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r1, #0
	lsls r1, r2, #4
	ldrh r2, [r0, #2]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #2]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080753BC
	.align 2, 0
_0807540C: .4byte 0x03004910
_08075410:
	ldr r0, [r7]
	ldrh r1, [r0, #0x36]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldrh r1, [r0, #0x38]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x38]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1, #0x3c]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08075448
sub_08075448: @ 0x08075448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	movs r2, #0x2e
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	movs r3, #0x30
	ldrsh r2, [r0, r3]
	ldr r0, [r7]
	ldrh r3, [r0, #0x3a]
	ldr r0, [r7]
	ldrh r4, [r0, #0x3e]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	lsls r1, r0, #4
	str r1, [r7, #8]
	ldr r0, [r7]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x36]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x36]
	ldr r0, [r7]
	ldr r1, [r7, #8]
	asrs r2, r1, #0x1f
	lsrs r3, r2, #0x1f
	adds r2, r1, r3
	asrs r1, r2, #1
	ldrh r2, [r0, #0x38]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x38]
	movs r0, #0
	str r0, [r7, #4]
_080754A4:
	ldr r0, [r7, #4]
	cmp r0, #0xf
	ble _080754AC
	b _080754F0
_080754AC:
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	ldr r2, [r7]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldrh r2, [r3, #0x36]
	ldr r3, _080754EC @ =0x03004910
	ldr r4, [r7, #4]
	adds r5, r4, #0
	lsls r4, r5, #3
	adds r3, r3, r4
	ldrh r4, [r3]
	adds r3, r2, r4
	asrs r2, r3, #4
	ldr r4, [r7]
	ldrh r3, [r4, #0x38]
	ldr r4, _080754EC @ =0x03004910
	ldr r5, [r7, #4]
	adds r6, r5, #0
	lsls r5, r6, #3
	adds r4, r4, r5
	ldrh r5, [r4, #2]
	adds r4, r3, r5
	asrs r3, r4, #4
	bl sub_0807534C
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080754A4
	.align 2, 0
_080754EC: .4byte 0x03004910
_080754F0:
	ldr r1, [r7]
	ldr r0, [r7]
	ldr r1, [r7]
	ldrh r2, [r1, #0x3a]
	adds r1, r2, #1
	ldrh r2, [r0, #0x3a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x3a]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x40
	ldrh r0, [r0, #0x3a]
	ldrh r1, [r2]
	cmp r0, r1
	bls _08075520
	ldr r0, [r7]
	bl Proc_Break
_08075520:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08075528
sub_08075528: @ 0x08075528
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r1, _080755DC @ =0x08C9DF5C
	adds r0, r1, #0
	movs r1, #3
	bl SpawnProc
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2a]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2a]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #4]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrh r2, [r0, #0x2e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x2e]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrh r2, [r0, #0x30]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x30]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x1c]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3c]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3c]
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x20]
	adds r1, r2, #0
	ldrh r2, [r0, #0x3e]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x3e]
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x24]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080755DC: .4byte 0x08C9DF5C

	thumb_func_start sub_080755E0
sub_080755E0: @ 0x080755E0
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	movs r0, #0x28
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #1
	movs r3, #0xc8
	bl sub_08075528
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807560C
sub_0807560C: @ 0x0807560C
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #0xc
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x3c
	str r0, [sp, #4]
	movs r0, #0x37
	str r0, [sp, #8]
	ldr r0, [r7]
	movs r2, #0xc8
	movs r3, #1
	bl sub_08075528
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08075638
sub_08075638: @ 0x08075638
	push {r7, lr}
	mov r7, sp
	ldr r0, _08075648 @ =0x0203E0FC
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _08075650
	ldr r0, _0807564C @ =0x08C9DF8C
	b _0807565C
	.align 2, 0
_08075648: .4byte 0x0203E0FC
_0807564C: .4byte 0x08C9DF8C
_08075650:
	ldr r0, _08075658 @ =0x0203E0FC
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	b _0807565C
	.align 2, 0
_08075658: .4byte 0x0203E0FC
_0807565C:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08075664
sub_08075664: @ 0x08075664
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075694 @ =0x0203E0FC
	ldr r2, _08075694 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DCB4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075694: .4byte 0x0203E0FC

	thumb_func_start sub_08075698
sub_08075698: @ 0x08075698
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080756C8 @ =0x0203E0FC
	ldr r2, _080756C8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DD30
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756C8: .4byte 0x0203E0FC

	thumb_func_start sub_080756CC
sub_080756CC: @ 0x080756CC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075700 @ =0x0203E0FC
	ldr r2, _08075700 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0x40
	bne _08075708
	ldr r1, _08075704 @ =sub_08075798
	adds r0, r1, #0
	movs r1, #9
	bl CallDelayed
	b _08075712
	.align 2, 0
_08075700: .4byte 0x0203E0FC
_08075704: .4byte sub_08075798
_08075708:
	ldr r1, _08075790 @ =sub_080757DC
	adds r0, r1, #0
	movs r1, #0xc
	bl CallDelayed
_08075712:
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _08075794 @ =0x0203E0FC
	ldr r2, _08075794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #5
	bl SetSpriteAnimId
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075790: .4byte sub_080757DC
_08075794: .4byte 0x0203E0FC

	thumb_func_start sub_08075798
sub_08075798: @ 0x08075798
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _080757D0 @ =0x000002D5
	ldr r1, _080757D4 @ =0x0203E0FC
	ldr r3, _080757D4 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _080757D8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080757D0: .4byte 0x000002D5
_080757D4: .4byte 0x0203E0FC
_080757D8: .4byte 0x0202BBB8

	thumb_func_start sub_080757DC
sub_080757DC: @ 0x080757DC
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08075814 @ =0x000002D6
	ldr r1, _08075818 @ =0x0203E0FC
	ldr r3, _08075818 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _0807581C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075814: .4byte 0x000002D6
_08075818: .4byte 0x0203E0FC
_0807581C: .4byte 0x0202BBB8

	thumb_func_start sub_08075820
sub_08075820: @ 0x08075820
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075878 @ =0x0203E0FC
	ldr r2, _08075878 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _08075878 @ =0x0203E0FC
	ldr r2, _08075878 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075878: .4byte 0x0203E0FC

	thumb_func_start sub_0807587C
sub_0807587C: @ 0x0807587C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080758AC @ =0x0203E0FC
	ldr r2, _080758AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DDD4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080758AC: .4byte 0x0203E0FC

	thumb_func_start sub_080758B0
sub_080758B0: @ 0x080758B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _0807590A
	adds r3, r0, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08075908
	subs r3, #0x10
_08075908:
	b _08075910
_0807590A:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_08075910:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7, #4]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08075972
	adds r3, r1, #0
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08075970
	subs r3, #0x10
_08075970:
	b _08075978
_08075972:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_08075978:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08075994
sub_08075994: @ 0x08075994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r3, #0
	ldrsh r0, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4c
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _080759EE
	adds r3, r0, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4c
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4c
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _080759EC
	subs r3, #0x10
_080759EC:
	b _080759F4
_080759EE:
	adds r4, r0, #0
	adds r4, #0x10
	adds r3, r4, #0
_080759F4:
	adds r4, r2, #0
	adds r2, #0x4c
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	ldr r2, [r7]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r3, #0
	ldrsh r1, [r4, r3]
	ldr r4, [r7]
	adds r3, r4, #0
	adds r4, #0x4e
	movs r5, #0
	ldrsh r3, [r4, r5]
	ldr r5, [r7, #4]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	subs r3, r3, r4
	cmp r3, #0
	bgt _08075A56
	adds r3, r1, #0
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x4e
	movs r6, #0
	ldrsh r4, [r5, r6]
	ldr r6, [r7, #4]
	adds r5, r6, #0
	adds r5, r6, #0
	adds r5, #0x4e
	str r5, [r7, #8]
	ldr r6, [r7, #8]
	movs r5, #0
	ldrsh r6, [r6, r5]
	str r6, [r7, #0xc]
	ldr r6, [r7, #0xc]
	subs r4, r4, r6
	cmp r4, #0
	bge _08075A54
	subs r3, #0x10
_08075A54:
	b _08075A5C
_08075A56:
	adds r4, r1, #0
	adds r4, #0x10
	adds r3, r4, #0
_08075A5C:
	adds r4, r2, #0
	adds r2, #0x4e
	ldrh r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	orrs r3, r5
	adds r4, r3, #0
	strh r4, [r2]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08075A78
sub_08075A78: @ 0x08075A78
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r2, _08075AF8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r2, _08075AF8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
	ldr r1, _08075AF8 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075AF0
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
	ldr r0, _08075AF8 @ =0x0203E0FC
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_080758B0
_08075AF0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075AF8: .4byte 0x0203E0FC

	thumb_func_start sub_08075AFC
sub_08075AFC: @ 0x08075AFC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075B7C @ =0x0203E0FC
	ldr r2, _08075B7C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #4]
	ldr r0, _08075B7C @ =0x0203E0FC
	ldr r2, _08075B7C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_08075994
	ldr r1, _08075B7C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075B74
	ldr r0, _08075B7C @ =0x0203E0FC
	ldr r1, [r0, #0x30]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_08075994
	ldr r0, _08075B7C @ =0x0203E0FC
	ldr r1, [r0, #0x44]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_08075994
_08075B74:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075B7C: .4byte 0x0203E0FC

	thumb_func_start sub_08075B80
sub_08075B80: @ 0x08075B80
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075BCC @ =0x0203E0FC
	ldr r2, _08075BCC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _08075BCC @ =0x0203E0FC
	ldr r3, _08075BCC @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x58
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl CameraMoveWatchPosition
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075BCC: .4byte 0x0203E0FC

	thumb_func_start sub_08075BD0
sub_08075BD0: @ 0x08075BD0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075C1C @ =0x0203E0FC
	ldr r2, _08075C1C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _08075C1C @ =0x0203E0FC
	ldr r3, _08075C1C @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl CameraMoveWatchPosition
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C1C: .4byte 0x0203E0FC

	thumb_func_start sub_08075C20
sub_08075C20: @ 0x08075C20
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08075C88 @ =0x0203E0FC
	ldr r1, _08075C8C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08075C88 @ =0x0203E0FC
	ldr r1, _08075C8C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _08075C88 @ =0x0203E0FC
	adds r0, r1, #0
	adds r2, r1, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r2, _08075C88 @ =0x0203E0FC
	adds r0, r2, #0
	adds r3, r2, #0
	adds r3, #0x61
	ldrb r2, [r3]
	ldr r0, [r7]
	bl CameraMoveWatchPosition
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C88: .4byte 0x0203E0FC
_08075C8C: .4byte 0x0203A470

	thumb_func_start sub_08075C90
sub_08075C90: @ 0x08075C90
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #8]
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075CC8
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #0xc]
	b _08075CD2
	.align 2, 0
_08075CC4: .4byte 0x0203E0FC
_08075CC8:
	ldr r1, _08075D28 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x59
	ldrb r0, [r1]
	str r0, [r7, #0xc]
_08075CD2:
	ldr r0, _08075D28 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocReturnBool
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08075D2C
	ldr r1, _08075D28 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075D26
	ldr r0, _08075D28 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08071424
_08075D26:
	b _0807603E
	.align 2, 0
_08075D28: .4byte 0x0203E0FC
_08075D2C:
	ldr r0, _08075D90 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, _08075D90 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl sub_08076050
	ldr r1, _08075D90 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075D80
	ldr r0, [r7, #8]
	ldr r2, _08075D90 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r2, r1, #0
	adds r1, r2, #0
	bl sub_08076050
_08075D80:
	ldr r1, _08075D90 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08075D94
	b _0807603E
	.align 2, 0
_08075D90: .4byte 0x0203E0FC
_08075D94:
	ldr r1, _08075DE8 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075DF0
	ldr r0, _08075DE8 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08075DEC @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xc8
	bl PlaySeSpacial
	ldr r0, _08075DE8 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08071424
	b _0807603E
	.align 2, 0
_08075DE8: .4byte 0x0203E0FC
_08075DEC: .4byte 0x0202BBB8
_08075DF0:
	ldr r1, _08075E3C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08075E48
	ldr r0, _08075E40 @ =0x000002CE
	ldr r1, _08075E3C @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075E44 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08075E3C @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_080714A0
	b _0807603E
	.align 2, 0
_08075E3C: .4byte 0x0203E0FC
_08075E40: .4byte 0x000002CE
_08075E44: .4byte 0x0202BBB8
_08075E48:
	movs r0, #0
	ldr r1, _08075E88 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x1b
	beq _08075E8C
	ldr r1, _08075E88 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x33
	beq _08075E8C
	b _08075E8E
	.align 2, 0
_08075E88: .4byte 0x0203E0FC
_08075E8C:
	movs r0, #1
_08075E8E:
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08075EF4
	ldr r1, _08075ECC @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08075ED0
	movs r0, #0xaf
	str r0, [r7, #4]
	ldr r0, _08075ECC @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #1
	bl sub_0807151C
	b _08075EEC
	.align 2, 0
_08075ECC: .4byte 0x0203E0FC
_08075ED0:
	movs r0, #0xb0
	str r0, [r7, #4]
	ldr r0, _08075EF0 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl sub_0807151C
_08075EEC:
	b _08075F18
	.align 2, 0
_08075EF0: .4byte 0x0203E0FC
_08075EF4:
	ldr r1, _08075F10 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08075F14
	movs r0, #0xd5
	str r0, [r7, #4]
	b _08075F18
	.align 2, 0
_08075F10: .4byte 0x0203E0FC
_08075F14:
	movs r0, #0xd2
	str r0, [r7, #4]
_08075F18:
	ldr r1, _08075FD4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075FDC
	ldr r0, [r7, #4]
	ldr r1, _08075FD4 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FD8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFlashColor
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_0806DE44
	bl sub_080751E0
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08075FD8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xd8
	bl PlaySeSpacial
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DDD4
	b _0807603E
	.align 2, 0
_08075FD4: .4byte 0x0203E0FC
_08075FD8: .4byte 0x0202BBB8
_08075FDC:
	ldr r0, [r7, #4]
	ldr r1, _08076048 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _0807604C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08076048 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08076048 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFlashColor
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl sub_0806E054
_0807603E:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076048: .4byte 0x0203E0FC
_0807604C: .4byte 0x0202BBB8

	thumb_func_start sub_08076050
sub_08076050: @ 0x08076050
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0807608C @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	ldr r0, [r7, #4]
	cmp r1, r0
	bgt _08076090
	ldr r0, _0807608C @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xd]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0xd]
	b _080760C4
	.align 2, 0
_0807608C: .4byte 0x0203E0FC
_08076090:
	ldr r0, _08076120 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08076120 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	ldrb r3, [r1, #0xd]
	subs r1, r3, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_080760C4:
	ldr r0, _08076120 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08076120 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r0, [r0, #0xd]
	ldrb r1, [r1, #0xc]
	cmp r0, r1
	bls _08076116
	ldr r0, _08076120 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, _08076120 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r0, #0xd]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #0xc]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0xd]
_08076116:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076120: .4byte 0x0203E0FC

	thumb_func_start sub_08076124
sub_08076124: @ 0x08076124
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0807613C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076140
	b _08076146
	.align 2, 0
_0807613C: .4byte 0x0203E0FC
_08076140:
	ldr r0, [r7]
	bl Proc_Break
_08076146:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08076150
sub_08076150: @ 0x08076150
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807617C @ =0x0203E0FC
	ldr r2, _0807617C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_0807160C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807617C: .4byte 0x0203E0FC

	thumb_func_start sub_08076180
sub_08076180: @ 0x08076180
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080761AC @ =0x0203E0FC
	ldr r2, _080761AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08073550
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080761AC: .4byte 0x0203E0FC

	thumb_func_start sub_080761B0
sub_080761B0: @ 0x080761B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080761DC @ =0x0203E0FC
	ldr r2, _080761DC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08073878
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080761DC: .4byte 0x0203E0FC

	thumb_func_start sub_080761E0
sub_080761E0: @ 0x080761E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807620C @ =0x0203E0FC
	ldr r2, _0807620C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_080716E0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807620C: .4byte 0x0203E0FC

	thumb_func_start sub_08076210
sub_08076210: @ 0x08076210
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076240 @ =0x0203E0FC
	ldr r2, _08076240 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076244 @ =0x083F51E8
	ldr r2, _08076248 @ =0x083F6314
	bl sub_08071E4C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076240: .4byte 0x0203E0FC
_08076244: .4byte 0x083F51E8
_08076248: .4byte 0x083F6314

	thumb_func_start sub_0807624C
sub_0807624C: @ 0x0807624C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807627C @ =0x0203E0FC
	ldr r2, _0807627C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076280 @ =0x083F51E8
	ldr r2, _08076284 @ =0x083F62F4
	bl sub_08071E4C
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807627C: .4byte 0x0203E0FC
_08076280: .4byte 0x083F51E8
_08076284: .4byte 0x083F62F4

	thumb_func_start sub_08076288
sub_08076288: @ 0x08076288
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080762B8 @ =0x0203E0FC
	ldr r2, _080762B8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _080762BC @ =0x083F66A0
	ldr r2, _080762C0 @ =0x083F695C
	movs r3, #0x8b
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080762B8: .4byte 0x0203E0FC
_080762BC: .4byte 0x083F66A0
_080762C0: .4byte 0x083F695C

	thumb_func_start sub_080762C4
sub_080762C4: @ 0x080762C4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080762F4 @ =0x0203E0FC
	ldr r2, _080762F4 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _080762F8 @ =0x083F6334
	ldr r2, _080762FC @ =0x083F695C
	movs r3, #0x89
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080762F4: .4byte 0x0203E0FC
_080762F8: .4byte 0x083F6334
_080762FC: .4byte 0x083F695C

	thumb_func_start sub_08076300
sub_08076300: @ 0x08076300
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076330 @ =0x0203E0FC
	ldr r2, _08076330 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076334 @ =0x083F64A8
	ldr r2, _08076338 @ =0x083F695C
	movs r3, #0x8a
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076330: .4byte 0x0203E0FC
_08076334: .4byte 0x083F64A8
_08076338: .4byte 0x083F695C

	thumb_func_start sub_0807633C
sub_0807633C: @ 0x0807633C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807636C @ =0x0203E0FC
	ldr r2, _0807636C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076370 @ =0x083F66A0
	ldr r2, _08076374 @ =0x083F695C
	movs r3, #0x8b
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807636C: .4byte 0x0203E0FC
_08076370: .4byte 0x083F66A0
_08076374: .4byte 0x083F695C

	thumb_func_start sub_08076378
sub_08076378: @ 0x08076378
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080763A8 @ =0x0203E0FC
	ldr r2, _080763A8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _080763AC @ =0x083F6334
	ldr r2, _080763B0 @ =0x083F695C
	movs r3, #0x89
	bl sub_08072124
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080763A8: .4byte 0x0203E0FC
_080763AC: .4byte 0x083F6334
_080763B0: .4byte 0x083F695C

	thumb_func_start sub_080763B4
sub_080763B4: @ 0x080763B4
	push {r4, r5, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076464 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080763D2
	movs r0, #0xb4
	bl m4aSongNumStart
_080763D2:
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r1, _0807646C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x73
	adds r2, r0, #0
	adds r0, #0x60
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r1, _0807646C @ =0x0203A470
	adds r2, r1, #0
	adds r1, #0x74
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _08076468 @ =0x0203E0FC
	ldr r2, _08076468 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076468 @ =0x0203E0FC
	ldr r3, _08076468 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r2, _08076468 @ =0x0203E0FC
	ldr r4, _08076468 @ =0x0203E0FC
	adds r3, r4, #0
	adds r4, #0x59
	ldrb r3, [r4]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, r2, r3
	ldr r3, [r2]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	bl sub_080726C0
	add sp, #4
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076464: .4byte 0x0202BBF8
_08076468: .4byte 0x0203E0FC
_0807646C: .4byte 0x0203A470

	thumb_func_start sub_08076470
sub_08076470: @ 0x08076470
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080764AC @ =0x0203E0FC
	ldr r2, _080764AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r2, _080764AC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	ldr r3, _080764AC @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	bl sub_080726C0
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080764AC: .4byte 0x0203E0FC

	thumb_func_start sub_080764B0
sub_080764B0: @ 0x080764B0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080764DC @ =0x0203E0FC
	ldr r2, _080764DC @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08072898
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080764DC: .4byte 0x0203E0FC

	thumb_func_start sub_080764E0
sub_080764E0: @ 0x080764E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076504 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	ldr r2, _08076504 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	bl sub_08073A54
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076504: .4byte 0x0203E0FC

	thumb_func_start sub_08076508
sub_08076508: @ 0x08076508
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076534 @ =0x0203E0FC
	ldr r2, _08076534 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08072C20
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076534: .4byte 0x0203E0FC

	thumb_func_start sub_08076538
sub_08076538: @ 0x08076538
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076564 @ =0x0203E0FC
	ldr r2, _08076564 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08073060
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076564: .4byte 0x0203E0FC

	thumb_func_start sub_08076568
sub_08076568: @ 0x08076568
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076594 @ =0x0203E0FC
	ldr r2, _08076594 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08073198
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076594: .4byte 0x0203E0FC

	thumb_func_start sub_08076598
sub_08076598: @ 0x08076598
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080765C4 @ =0x0203E0FC
	ldr r2, _080765C4 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08072D10
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080765C4: .4byte 0x0203E0FC

	thumb_func_start sub_080765C8
sub_080765C8: @ 0x080765C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080765F8 @ =0x0203E0FC
	ldr r2, _080765F8 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	movs r1, #0
	bl sub_0806DB94
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080765F8: .4byte 0x0203E0FC

	thumb_func_start sub_080765FC
sub_080765FC: @ 0x080765FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807662C @ =0x0203E0FC
	ldr r2, _0807662C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DC14
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807662C: .4byte 0x0203E0FC

	thumb_func_start sub_08076630
sub_08076630: @ 0x08076630
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076660 @ =0x0203E0FC
	ldr r2, _08076660 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl sub_0806DAB4
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076660: .4byte 0x0203E0FC

	thumb_func_start sub_08076664
sub_08076664: @ 0x08076664
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080766D0 @ =0x0203E0FC
	ldr r2, _080766D0 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _080766D4 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _080766D0 @ =0x0203E0FC
	ldr r3, _080766D0 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _080766D4 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_080755E0
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080766D0: .4byte 0x0203E0FC
_080766D4: .4byte 0x0202BBB8

	thumb_func_start sub_080766D8
sub_080766D8: @ 0x080766D8
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076758 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080766F6
	movs r0, #0xb5
	bl m4aSongNumStart
_080766F6:
	ldr r0, _0807675C @ =0x0203E0FC
	ldr r2, _0807675C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08076760 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	adds r0, r1, #0
	adds r0, #8
	ldr r1, _0807675C @ =0x0203E0FC
	ldr r3, _0807675C @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x59
	ldrb r2, [r3]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08076760 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	adds r2, r1, #0
	adds r2, #8
	adds r1, r2, #0
	bl sub_0807560C
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076758: .4byte 0x0202BBF8
_0807675C: .4byte 0x0203E0FC
_08076760: .4byte 0x0202BBB8

	thumb_func_start sub_08076764
sub_08076764: @ 0x08076764
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076794 @ =0x0203E0FC
	ldr r2, _08076794 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl ShowMu
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076794: .4byte 0x0203E0FC

	thumb_func_start sub_08076798
sub_08076798: @ 0x08076798
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076828 @ =0x0203E0FC
	ldr r2, _08076828 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r7, #4]
	ldr r0, _08076828 @ =0x0203E0FC
	ldr r2, _08076828 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r0, [r1]
	ldr r2, _08076828 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x60
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r3, _08076828 @ =0x0203E0FC
	adds r2, r3, #0
	adds r3, #0x61
	ldrb r2, [r3]
	adds r3, r2, #0
	lsls r2, r3, #4
	bl SetMuScreenPosition
	ldr r0, [r7, #4]
	ldr r1, _08076828 @ =0x0203E0FC
	adds r2, r1, #0
	adds r1, #0x60
	ldrb r2, [r0, #0x10]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x10]
	ldr r0, [r7, #4]
	ldr r1, _08076828 @ =0x0203E0FC
	adds r2, r1, #0
	adds r1, #0x61
	ldrb r2, [r0, #0x11]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #0x11]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076828: .4byte 0x0203E0FC

	thumb_func_start sub_0807682C
sub_0807682C: @ 0x0807682C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_080750DC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08076844
sub_08076844: @ 0x08076844
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl sub_08075168
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start InitScanlineEffect
InitScanlineEffect: @ 0x0807685C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0807688C @ =0x0203E160
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _08076890 @ =0x0203E3E0
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r0, _08076894 @ =0x0203E660
	ldr r1, _0807688C @ =0x0203E160
	str r1, [r0]
	ldr r0, _08076894 @ =0x0203E660
	ldr r1, _08076890 @ =0x0203E3E0
	str r1, [r0, #4]
	ldr r0, _08076898 @ =0x0203E668
	ldr r1, _08076894 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807688C: .4byte 0x0203E160
_08076890: .4byte 0x0203E3E0
_08076894: .4byte 0x0203E660
_08076898: .4byte 0x0203E668

	thumb_func_start sub_0807689C
sub_0807689C: @ 0x0807689C
	push {r7, lr}
	mov r7, sp
	ldr r0, _080769C4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080769C4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080769C4 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xf0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xa0
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfe
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfd
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xfb
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _080769C4 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x36
	ldrb r1, [r0]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _080769C8 @ =sub_08076A10
	adds r0, r1, #0
	bl SetOnHBlankA
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769C4: .4byte 0x03002870
_080769C8: .4byte sub_08076A10

	thumb_func_start sub_080769CC
sub_080769CC: @ 0x080769CC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080769FC @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080769FC @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl MapAnimScanlineCore
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769FC: .4byte 0x0203E660

	thumb_func_start ResetScanLineHBlank
ResetScanLineHBlank: @ 0x08076A00
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl SetOnHBlankA
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08076A10
sub_08076A10: @ 0x08076A10
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076A38 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076A44
	ldr r0, _08076A3C @ =0x0203E668
	ldr r1, _08076A40 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076A52
	.align 2, 0
_08076A38: .4byte 0x04000006
_08076A3C: .4byte 0x0203E668
_08076A40: .4byte 0x0203E660
_08076A44:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076A52:
	ldr r0, _08076A70 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076A74 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076A70: .4byte 0x04000040
_08076A74: .4byte 0x0203E668

	thumb_func_start sub_08076A78
sub_08076A78: @ 0x08076A78
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076AA0 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076AAC
	ldr r0, _08076AA4 @ =0x0203E668
	ldr r1, _08076AA8 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076ABA
	.align 2, 0
_08076AA0: .4byte 0x04000006
_08076AA4: .4byte 0x0203E668
_08076AA8: .4byte 0x0203E660
_08076AAC:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076ABA:
	ldr r0, _08076AF0 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076AF4 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08076AF8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076AF4 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076AF0: .4byte 0x04000040
_08076AF4: .4byte 0x0203E668
_08076AF8: .4byte 0x04000018

	thumb_func_start sub_08076AFC
sub_08076AFC: @ 0x08076AFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076B24 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076B30
	ldr r0, _08076B28 @ =0x0203E668
	ldr r1, _08076B2C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076B3E
	.align 2, 0
_08076B24: .4byte 0x04000006
_08076B28: .4byte 0x0203E668
_08076B2C: .4byte 0x0203E660
_08076B30:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076B3E:
	ldr r0, _08076B74 @ =0x05000022
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076B78 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08076B7C @ =0x05000042
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076B78 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076B74: .4byte 0x05000022
_08076B78: .4byte 0x0203E668
_08076B7C: .4byte 0x05000042

	thumb_func_start sub_08076B80
sub_08076B80: @ 0x08076B80
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076BA8 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076BB4
	ldr r0, _08076BAC @ =0x0203E668
	ldr r1, _08076BB0 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076BC2
	.align 2, 0
_08076BA8: .4byte 0x04000006
_08076BAC: .4byte 0x0203E668
_08076BB0: .4byte 0x0203E660
_08076BB4:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076BC2:
	ldr r0, _08076BE0 @ =0x04000052
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076BE4 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076BE0: .4byte 0x04000052
_08076BE4: .4byte 0x0203E668

	thumb_func_start sub_08076BE8
sub_08076BE8: @ 0x08076BE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08076C10 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08076C1C
	ldr r0, _08076C14 @ =0x0203E668
	ldr r1, _08076C18 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08076C2A
	.align 2, 0
_08076C10: .4byte 0x04000006
_08076C14: .4byte 0x0203E668
_08076C18: .4byte 0x0203E660
_08076C1C:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08076C2A:
	ldr r0, _08076C48 @ =0x04000054
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08076C4C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076C48: .4byte 0x04000054
_08076C4C: .4byte 0x0203E668

	thumb_func_start StartManimFrameGradientScanlineEffect2
StartManimFrameGradientScanlineEffect2: @ 0x08076C50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	add r7, sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #0
	adds r3, r5, #0
	strh r3, [r2]
	adds r2, r7, #2
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #4
	strh r1, [r2]
	adds r1, r7, #6
	strh r0, [r1]
	ldr r1, _08076D84 @ =0x0203E660
	ldr r0, [r1, #4]
	adds r2, r7, #0
	ldrh r1, [r2]
	adds r3, r7, #2
	ldrh r2, [r3]
	adds r4, r7, #4
	ldrh r3, [r4]
	adds r4, r7, #4
	ldrh r5, [r4]
	movs r6, #0x1f
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	lsrs r5, r4, #1
	adds r4, r5, #0
	movs r5, #0x1f
	ands r4, r5
	adds r5, r7, #4
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #2
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r5, r6
	orrs r4, r5
	adds r5, r7, #4
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #7
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	ands r5, r6
	orrs r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	str r4, [sp]
	bl PrepareGradientScanlineBuf
	ldr r0, _08076D84 @ =0x0203E660
	ldr r1, [r0, #4]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r2, r7, #0
	ldrh r1, [r2]
	adds r3, r7, #2
	ldrh r2, [r3]
	adds r4, r7, #6
	ldrh r3, [r4]
	adds r4, r7, #6
	ldrh r5, [r4]
	movs r6, #0x1f
	adds r4, r5, #0
	ands r4, r6
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	lsrs r5, r4, #1
	adds r4, r5, #0
	movs r5, #0x1f
	ands r4, r5
	adds r5, r7, #6
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #2
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r5, r6
	orrs r4, r5
	adds r5, r7, #6
	ldrh r6, [r5]
	movs r5, #0xf8
	lsls r5, r5, #7
	mov r8, r5
	mov r5, r8
	ands r5, r6
	mov r8, r5
	mov r5, r8
	lsls r6, r5, #0x10
	lsrs r5, r6, #0x10
	lsrs r6, r5, #1
	adds r5, r6, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	ands r5, r6
	orrs r4, r5
	adds r6, r4, #0
	lsls r5, r6, #0x10
	lsrs r4, r5, #0x10
	str r4, [sp]
	bl PrepareGradientScanlineBuf
	bl SwapScanlineBufs
	ldr r1, _08076D88 @ =sub_08076AFC
	adds r0, r1, #0
	bl SetOnHBlankA
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076D84: .4byte 0x0203E660
_08076D88: .4byte sub_08076AFC

	thumb_func_start sub_08076D8C
sub_08076D8C: @ 0x08076D8C
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _08076DB4 @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
_08076DA4:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _08076DB8
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08076DBA
	b _08076DB8
	.align 2, 0
_08076DB4: .4byte 0x0203E660
_08076DB8:
	b _08076E08
_08076DBA:
	ldr r0, [r7, #0x1c]
	ldrb r1, [r0]
	ldr r2, [r7, #8]
	adds r0, r1, #0
	muls r0, r2, r0
	ldr r1, [r7, #0xc]
	bl Div
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x1c]
	adds r1, r0, #1
	str r1, [r7, #0x1c]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _08076DFA
	ldr r1, _08076E04 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _08076E04 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
_08076DFA:
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08076DA4
	.align 2, 0
_08076E04: .4byte 0x0203E660
_08076E08:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	ble _08076E44
_08076E0E:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08076E16
	b _08076E44
_08076E16:
	ldr r1, _08076E40 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r3, [r7, #0x10]
	adds r2, r1, r3
	subs r1, r2, #1
	ldr r2, [r7, #4]
	bl SetScanlineBufWinR
	ldr r1, _08076E40 @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r1, [r7]
	ldr r2, [r7, #0x10]
	subs r1, r1, r2
	ldr r2, [r7, #4]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08076E0E
	.align 2, 0
_08076E40: .4byte 0x0203E660
_08076E44:
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start PrepareSineWaveScanlineBuf
PrepareSineWaveScanlineBuf: @ 0x08076E4C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	movs r0, #0
	str r0, [r7, #0xc]
_08076E6E:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08076E76
	b _08076EBC
_08076E76:
	ldr r0, [r7]
	ldr r1, _08076EB8 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08076E6E
	.align 2, 0
_08076EB8: .4byte 0x080C5A48
_08076EBC:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08076EC4
sub_08076EC4: @ 0x08076EC4
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	movs r0, #0
	str r0, [r7, #0xc]
_08076EE6:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08076EEE
	b _08076F3C
_08076EEE:
	ldr r0, [r7]
	ldr r1, _08076F38 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	ldr r3, [r7, #0x20]
	adds r2, r3, #0
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08076EE6
	.align 2, 0
_08076F38: .4byte 0x080C5A48
_08076F3C:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08076F44
sub_08076F44: @ 0x08076F44
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_08076F6C:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08076F74
	b _08076FBC
_08076F74:
	ldr r0, [r7]
	ldr r1, _08076FB8 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	b _08076F6C
	.align 2, 0
_08076FB8: .4byte 0x080C5A48
_08076FBC:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08076FC4
sub_08076FC4: @ 0x08076FC4
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_08076FEC:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _08076FF4
	b _08077044
_08076FF4:
	ldr r0, [r7]
	ldr r1, _08077040 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	adds r2, r1, #0
	muls r2, r3, r2
	asrs r1, r2, #0xc
	ldr r3, [r7, #0x20]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #2
	str r1, [r7, #0xc]
	b _08076FEC
	.align 2, 0
_08077040: .4byte 0x080C5A48
_08077044:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start PrepareSineWaveScanlineBufExt
PrepareSineWaveScanlineBufExt: @ 0x0807704C
	push {r4, r5, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r2, #0
	adds r0, r3, #0
	adds r2, r7, #4
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #6
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #8
	strh r0, [r1]
	ldr r0, [r7, #0x20]
	str r0, [r7, #0xc]
_0807706E:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x24]
	cmp r0, r1
	blt _08077078
	b _080770C0
_08077078:
	ldr r0, [r7]
	ldr r1, _080770BC @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	asrs r2, r1, #0xc
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0807706E
	.align 2, 0
_080770BC: .4byte 0x080C5A48
_080770C0:
	add sp, #0x10
	pop {r4, r5, r7}
	pop {r0}
	bx r0

	thumb_func_start SwapScanlineBufs
SwapScanlineBufs: @ 0x080770C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, [r0]
	str r1, [r7]
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, _080770EC @ =0x0203E660
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, [r7]
	str r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080770EC: .4byte 0x0203E660

	thumb_func_start InitScanlineBuf
InitScanlineBuf: @ 0x080770F0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #4]
_08077100:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _08077108
	b _08077124
_08077108:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, [r0]
	ldr r3, _08077120 @ =0x0000F0F0
	adds r2, r3, #0
	strh r2, [r1]
	adds r1, #2
	str r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077100
	.align 2, 0
_08077120: .4byte 0x0000F0F0
_08077124:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetScanlineBufWinL
SetScanlineBufWinL: @ 0x0807712C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _08077146
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _08077146
	b _08077148
_08077146:
	b _0807716C
_08077148:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _08077152
	movs r0, #0
	str r0, [r7, #4]
_08077152:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _0807715C
	movs r0, #0xf0
	str r0, [r7, #4]
_0807715C:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r2, [r7]
	adds r1, r0, r2
	adds r0, r1, #1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_0807716C:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start SetScanlineBufWinR
SetScanlineBufWinR: @ 0x08077174
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0807718E
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	bgt _0807718E
	b _08077190
_0807718E:
	b _080771B2
_08077190:
	ldr r0, [r7, #4]
	cmp r0, #0
	bge _0807719A
	movs r0, #0
	str r0, [r7, #4]
_0807719A:
	ldr r0, [r7, #4]
	cmp r0, #0xf0
	ble _080771A4
	movs r0, #0xf0
	str r0, [r7, #4]
_080771A4:
	ldr r1, [r7, #8]
	lsls r0, r1, #1
	ldr r1, [r7]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	strb r2, [r0]
_080771B2:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MapAnimScanlineCore
MapAnimScanlineCore: @ 0x080771BC
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_080771D2:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _080771DC
	b _08077298
_080771DC:
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r1, [r7, #0xc]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _08077290
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0xc]
	adds r1, r0, r1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08077290:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _080771D2
_08077298:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start PrepareGradientScanlineBuf
PrepareGradientScanlineBuf: @ 0x080772A0
	push {r4, r7, lr}
	sub sp, #0x28
	add r7, sp, #4
	str r0, [r7]
	adds r4, r1, #0
	adds r1, r3, #0
	ldr r0, [r7, #0x30]
	adds r3, r7, #4
	strh r4, [r3]
	adds r3, r7, #6
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #8
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xa
	strh r0, [r1]
	adds r1, r7, #6
	ldrh r0, [r1]
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r0, r0, r2
	str r0, [r7, #0x20]
	movs r0, #0
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0xc]
_080772D6:
	ldr r0, [r7, #0xc]
	cmp r0, #0x9f
	ble _080772DE
	b _080773E8
_080772DE:
	adds r0, r7, #4
	ldrh r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, r1
	bge _080772F8
	ldr r0, [r7]
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	b _080773E0
_080772F8:
	adds r0, r7, #6
	ldrh r1, [r0]
	ldr r0, [r7, #0xc]
	cmp r0, r1
	ble _08077312
	ldr r0, [r7]
	adds r1, r7, #0
	adds r1, #0xa
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	b _080773E0
_08077312:
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0x1f
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x18]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf8
	lsls r2, r2, #7
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	adds r0, #0xa
	ldrh r2, [r0]
	movs r3, #0xf8
	lsls r3, r3, #7
	adds r0, r2, #0
	ands r0, r3
	adds r2, r0, #0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [r7, #0x10]
	ldr r0, [r7, #0x20]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	str r0, [r7, #0x1c]
	ldr r0, [r7]
	ldr r2, [r7, #0x14]
	adds r1, r2, #0
	movs r2, #0x1f
	ands r1, r2
	ldr r3, [r7, #0x18]
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r2, r3
	orrs r1, r2
	ldr r3, [r7, #0x1c]
	adds r2, r3, #0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r2, r3
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
_080773E0:
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _080772D6
_080773E8:
	add sp, #0x28
	pop {r4, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080773F0
sub_080773F0: @ 0x080773F0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08077410
sub_08077410: @ 0x08077410
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08077448 @ =0x0203E660
	ldr r1, [r0, #4]
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r1, r2
	ldr r1, [r7]
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r3, r2, #1
	adds r4, r3, #0
	strh r4, [r1]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	movs r2, #0x10
	movs r3, #8
	bl PrepareSineWaveScanlineBuf
	bl SwapScanlineBufs
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077448: .4byte 0x0203E660

	thumb_func_start sub_0807744C
sub_0807744C: @ 0x0807744C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_08077456:
	ldr r0, [r7]
	cmp r0, #0x9f
	ble _0807745E
	b _08077480
_0807745E:
	ldr r0, _0807747C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077456
	.align 2, 0
_0807747C: .4byte 0x0203E660
_08077480:
	movs r0, #8
	str r0, [r7]
_08077484:
	ldr r0, [r7]
	cmp r0, #0x97
	ble _0807748C
	b _080774A8
_0807748C:
	ldr r0, _080774A4 @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _08077484
	.align 2, 0
_080774A4: .4byte 0x0203E660
_080774A8:
	movs r0, #0
	str r0, [r7]
_080774AC:
	ldr r0, [r7]
	cmp r0, #0x20
	ble _080774B4
	b _08077514
_080774B4:
	ldr r0, _0807750C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x10
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0807750C @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r3, _08077510 @ =0xFFFFFED0
	adds r2, r1, r3
	ldr r1, [r0]
	subs r0, r1, r2
	ldr r2, [r7]
	asrs r1, r2, #1
	adds r2, r1, #0
	movs r3, #0x10
	subs r1, r3, r2
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7]
	asrs r2, r3, #1
	orrs r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _080774AC
	.align 2, 0
_0807750C: .4byte 0x0203E660
_08077510: .4byte 0xFFFFFED0
_08077514:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start GetScanlineBuf
GetScanlineBuf: @ 0x0807751C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08077540 @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08077544
	.align 2, 0
_08077540: .4byte 0x0203E660
_08077544:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0807754C
sub_0807754C: @ 0x0807754C
	push {r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077562:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _0807756C
	b _08077644
_0807756C:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x14]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080775C2
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
_080775C2:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x10]
	adds r0, r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08077618
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
_08077618:
	ldr r1, [r7, #0xc]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _0807763C
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0xc]
	adds r1, r0, r1
	str r1, [r7, #0xc]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_0807763C:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077562
_08077644:
	add sp, #0x18
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0807764C
sub_0807764C: @ 0x0807764C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0807767C @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _0807767C @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl sub_0807754C
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807767C: .4byte 0x0203E660

	thumb_func_start sub_08077680
sub_08077680: @ 0x08077680
	push {r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0x70
	ble _08077692
	movs r0, #0x70
	str r0, [r7]
_08077692:
	movs r0, #0x50
	ldr r1, [r7]
	subs r0, r0, r1
	str r0, [r7, #8]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0x50
	str r1, [r7, #0xc]
	movs r0, #0
	str r0, [r7, #4]
_080776A6:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080776B0
	b _080776D0
_080776B0:
	ldr r0, _080776CC @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080776A6
	.align 2, 0
_080776CC: .4byte 0x0203E660
_080776D0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #4]
_080776D4:
	ldr r0, [r7, #4]
	cmp r0, #0x9f
	ble _080776DC
	b _080776FC
_080776DC:
	ldr r0, _080776F8 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080776D4
	.align 2, 0
_080776F8: .4byte 0x0203E660
_080776FC:
	ldr r0, [r7, #8]
	str r0, [r7, #4]
_08077700:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	bgt _08077714
	ldr r1, [r7, #8]
	adds r0, r1, #0
	adds r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _08077716
	b _08077714
_08077714:
	b _08077750
_08077716:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _0807774C @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08077700
	.align 2, 0
_0807774C: .4byte 0x0203E660
_08077750:
	ldr r0, [r7, #0xc]
	subs r1, r0, #1
	str r1, [r7, #4]
_08077756:
	ldr r0, [r7, #4]
	cmp r0, #0x4f
	ble _0807776A
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	bge _0807776C
	b _0807776A
_0807776A:
	b _080777A4
_0807776C:
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	asrs r1, r0, #1
	str r1, [r7, #0x10]
	ldr r0, _080777A0 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	ldr r2, [r7, #0x10]
	adds r1, r2, #0
	movs r2, #0x10
	subs r1, r2, r1
	adds r2, r1, #0
	lsls r1, r2, #8
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _08077756
	.align 2, 0
_080777A0: .4byte 0x0203E660
_080777A4:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	adds r1, #0x20
	str r1, [r7, #4]
_080777AC:
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	subs r0, #0x20
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _080777BA
	b _080777D8
_080777BA:
	ldr r0, _080777D4 @ =0x0203E660
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r2, [r0, #4]
	adds r0, r1, r2
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080777AC
	.align 2, 0
_080777D4: .4byte 0x0203E660
_080777D8:
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080777E4
sub_080777E4: @ 0x080777E4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _0807780C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9e
	bls _08077818
	ldr r0, _08077810 @ =0x0203E668
	ldr r1, _08077814 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077826
	.align 2, 0
_0807780C: .4byte 0x04000006
_08077810: .4byte 0x0203E668
_08077814: .4byte 0x0203E660
_08077818:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077826:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0807784E
	ldr r0, _08077858 @ =0x04000040
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807785C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_0807784E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077858: .4byte 0x04000040
_0807785C: .4byte 0x0203E668

	thumb_func_start sub_08077860
sub_08077860: @ 0x08077860
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077888 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9e
	bls _08077894
	ldr r0, _0807788C @ =0x0203E668
	ldr r1, _08077890 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080778A2
	.align 2, 0
_08077888: .4byte 0x04000006
_0807788C: .4byte 0x0203E668
_08077890: .4byte 0x0203E660
_08077894:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080778A2:
	ldr r0, _080778C0 @ =0x04000052
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080778C4 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080778C0: .4byte 0x04000052
_080778C4: .4byte 0x0203E668

	thumb_func_start HBlank_Scanline_8078098
HBlank_Scanline_8078098: @ 0x080778C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077904 @ =0x04000006
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _080778E8
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
_080778E8:
	ldr r0, _08077908 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _0807790C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077904: .4byte 0x04000006
_08077908: .4byte 0x0400001A
_0807790C: .4byte 0x0203E668

	thumb_func_start sub_08077910
sub_08077910: @ 0x08077910
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0807791E:
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	ble _08077926
	b _08077954
_08077926:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _08077950 @ =0x0203E668
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	ldr r3, [r7, #8]
	asrs r2, r3, #1
	adds r1, r1, r2
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0807791E
	.align 2, 0
_08077950: .4byte 0x0203E668
_08077954:
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

	thumb_func_start CandleFlameFx_OnHBlank
CandleFlameFx_OnHBlank: @ 0x08077960
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077988 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077994
	ldr r0, _0807798C @ =0x0203E668
	ldr r1, _08077990 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _080779A2
	.align 2, 0
_08077988: .4byte 0x04000006
_0807798C: .4byte 0x0203E668
_08077990: .4byte 0x0203E660
_08077994:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_080779A2:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _080779E4
	ldr r0, _080779EC @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080779F0 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _080779F4 @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _080779F0 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_080779E4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080779EC: .4byte 0x04000014
_080779F0: .4byte 0x0203E668
_080779F4: .4byte 0x04000016

	thumb_func_start ScanlineRotation
ScanlineRotation: @ 0x080779F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r7, sp
	str r0, [r7]
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r2, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	adds r6, r7, #4
	strh r5, [r6]
	adds r5, r7, #6
	strh r4, [r5]
	adds r4, r7, #0
	adds r4, #8
	strh r3, [r4]
	adds r3, r7, #0
	adds r3, #0xa
	strh r2, [r3]
	adds r2, r7, #0
	adds r2, #0xc
	strh r1, [r2]
	adds r1, r7, #0
	adds r1, #0xe
	strh r0, [r1]
	ldr r1, [r7]
	adds r2, r1, #2
	str r2, [r7]
	movs r1, #1
	str r1, [r7, #0x10]
_08077A34:
	ldr r1, [r7, #0x10]
	cmp r1, #0x9f
	ble _08077A3C
	b _08077AD2
_08077A3C:
	ldr r1, _08077A98 @ =0x080C5A48
	adds r2, r7, #0
	adds r2, #8
	movs r4, #0
	ldrsh r3, [r2, r4]
	ldr r4, [r7, #0x10]
	adds r2, r3, #0
	muls r2, r4, r2
	adds r3, r7, #4
	movs r5, #0
	ldrsh r4, [r3, r5]
	adds r2, r2, r4
	movs r3, #0xff
	ands r2, r3
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, r2
	movs r2, #0
	ldrsh r1, [r3, r2]
	adds r2, r7, #6
	movs r4, #0
	ldrsh r3, [r2, r4]
	muls r1, r3, r1
	str r1, [r7, #0x14]
	adds r1, r7, #0
	adds r1, #0xe
	movs r5, #0
	ldrsh r0, [r1, r5]
	adds r1, r7, #0
	adds r1, #0xc
	movs r3, #0
	ldrsh r2, [r1, r3]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	cmp r1, #0
	blt _08077A9C
	adds r1, r7, #0
	adds r1, #0xc
	movs r4, #0
	ldrsh r2, [r1, r4]
	ldr r3, [r7, #0x10]
	subs r1, r3, r2
	ldr r2, [r7, #0x14]
	muls r1, r2, r1
	muls r1, r0, r1
	b _08077AB0
	.align 2, 0
_08077A98: .4byte 0x080C5A48
_08077A9C:
	adds r2, r7, #0
	adds r2, #0xc
	movs r5, #0
	ldrsh r3, [r2, r5]
	ldr r4, [r7, #0x10]
	subs r2, r3, r4
	ldr r3, [r7, #0x14]
	adds r1, r2, #0
	muls r1, r3, r1
	muls r1, r0, r1
_08077AB0:
	str r1, [r7, #0x14]
	ldr r1, [r7]
	ldr r3, [r7, #0x14]
	asrs r2, r3, #0x14
	adds r3, r7, #0
	adds r3, #0xa
	ldrh r3, [r3]
	adds r2, r2, r3
	adds r3, r2, #0
	strh r3, [r1]
	ldr r1, [r7]
	adds r2, r1, #4
	str r2, [r7]
	ldr r1, [r7, #0x10]
	adds r2, r1, #2
	str r2, [r7, #0x10]
	b _08077A34
_08077AD2:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08077ADC
sub_08077ADC: @ 0x08077ADC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077B04 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077B10
	ldr r0, _08077B08 @ =0x0203E668
	ldr r1, _08077B0C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077B1E
	.align 2, 0
_08077B04: .4byte 0x04000006
_08077B08: .4byte 0x0203E668
_08077B0C: .4byte 0x0203E660
_08077B10:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077B1E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077B60
	ldr r0, _08077B68 @ =0x04000010
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077B6C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077B70 @ =0x04000012
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077B6C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077B60:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077B68: .4byte 0x04000010
_08077B6C: .4byte 0x0203E668
_08077B70: .4byte 0x04000012

	thumb_func_start sub_08077B74
sub_08077B74: @ 0x08077B74
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077B9C @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077BA8
	ldr r0, _08077BA0 @ =0x0203E668
	ldr r1, _08077BA4 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077BB6
	.align 2, 0
_08077B9C: .4byte 0x04000006
_08077BA0: .4byte 0x0203E668
_08077BA4: .4byte 0x0203E660
_08077BA8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077BB6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077BF8
	ldr r0, _08077C00 @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C04 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077C08 @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C04 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077BF8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C00: .4byte 0x04000014
_08077C04: .4byte 0x0203E668
_08077C08: .4byte 0x04000016

	thumb_func_start sub_08077C0C
sub_08077C0C: @ 0x08077C0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077C34 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077C40
	ldr r0, _08077C38 @ =0x0203E668
	ldr r1, _08077C3C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077C4E
	.align 2, 0
_08077C34: .4byte 0x04000006
_08077C38: .4byte 0x0203E668
_08077C3C: .4byte 0x0203E660
_08077C40:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077C4E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077C90
	ldr r0, _08077C98 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C9C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077CA0 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077C9C @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077C90:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C98: .4byte 0x04000018
_08077C9C: .4byte 0x0203E668
_08077CA0: .4byte 0x0400001A

	thumb_func_start sub_08077CA4
sub_08077CA4: @ 0x08077CA4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077CCC @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077CD8
	ldr r0, _08077CD0 @ =0x0203E668
	ldr r1, _08077CD4 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077CE6
	.align 2, 0
_08077CCC: .4byte 0x04000006
_08077CD0: .4byte 0x0203E668
_08077CD4: .4byte 0x0203E660
_08077CD8:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077CE6:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077D28
	ldr r0, _08077D30 @ =0x0400001C
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077D34 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077D38 @ =0x0400001E
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077D34 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077D28:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D30: .4byte 0x0400001C
_08077D34: .4byte 0x0203E668
_08077D38: .4byte 0x0400001E

	thumb_func_start QuintessenceFx_OnHBlank
QuintessenceFx_OnHBlank: @ 0x08077D3C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077D64 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077D70
	ldr r0, _08077D68 @ =0x0203E668
	ldr r1, _08077D6C @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077D7E
	.align 2, 0
_08077D64: .4byte 0x04000006
_08077D68: .4byte 0x0203E668
_08077D6C: .4byte 0x0203E660
_08077D70:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077D7E:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077DD0
	ldr r0, _08077DD8 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077DDC @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldr r1, _08077DE0 @ =0x03002870
	ldrh r2, [r2]
	ldrh r1, [r1, #0x24]
	adds r2, r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08077DE4 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077DDC @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldr r2, _08077DE0 @ =0x03002870
	ldrh r1, [r1]
	ldrh r2, [r2, #0x26]
	adds r1, r1, r2
	adds r2, r1, #0
	strh r2, [r0]
_08077DD0:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077DD8: .4byte 0x04000018
_08077DDC: .4byte 0x0203E668
_08077DE0: .4byte 0x03002870
_08077DE4: .4byte 0x0400001A

	thumb_func_start DragonGatefx_DragonHBlank
DragonGatefx_DragonHBlank: @ 0x08077DE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r0, r7, #0
	ldr r1, _08077E10 @ =0x04000006
	ldrh r2, [r1]
	strh r2, [r0]
	adds r0, r7, #0
	ldrh r1, [r0]
	cmp r1, #0x9f
	bls _08077E1C
	ldr r0, _08077E14 @ =0x0203E668
	ldr r1, _08077E18 @ =0x0203E660
	ldr r2, [r1]
	str r2, [r0]
	adds r0, r7, #0
	movs r1, #0
	strh r1, [r0]
	b _08077E2A
	.align 2, 0
_08077E10: .4byte 0x04000006
_08077E14: .4byte 0x0203E668
_08077E18: .4byte 0x0203E660
_08077E1C:
	adds r1, r7, #0
	adds r0, r7, #0
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #1
	adds r2, r1, #0
	strh r2, [r0]
_08077E2A:
	adds r0, r7, #0
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08077E9A
	ldr r0, _08077EA4 @ =0x04000014
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077EA8 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077EAC @ =0x04000016
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077EA8 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
	ldr r0, _08077EB0 @ =0x04000018
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077EA8 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r2, r1, r3
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r0, _08077EB4 @ =0x0400001A
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r3, r2, #0
	lsls r1, r3, #1
	ldr r3, _08077EA8 @ =0x0203E668
	ldr r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0]
_08077E9A:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077EA4: .4byte 0x04000014
_08077EA8: .4byte 0x0203E668
_08077EAC: .4byte 0x04000016
_08077EB0: .4byte 0x04000018
_08077EB4: .4byte 0x0400001A

	thumb_func_start sub_08077EB8
sub_08077EB8: @ 0x08077EB8
	push {r7, lr}
	sub sp, #0x24
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x2c]
	cmp r0, r1
	bgt _08077ED0
	b _08077FC6
_08077ED0:
	ldr r0, [r7, #0xc]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077EDA:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _08077EE4
	b _08077FC4
_08077EE4:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x2c]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0xc]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x10]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x1c]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x14]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x18]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _08077FBC
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_08077FBC:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077EDA
_08077FC4:
	b _080780BA
_08077FC6:
	ldr r0, [r7, #0x2c]
	str r0, [r7, #0x20]
	str r0, [r7, #0x10]
	movs r0, #0
	str r0, [r7, #0x14]
_08077FD0:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	cmp r0, r1
	bge _08077FDA
	b _080780BA
_08077FDA:
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0xc]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r1, #0
	ldr r1, [r7, #0x2c]
	bl __divsi3
	str r0, [r7, #0x1c]
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x18]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x14]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	adds r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinR
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	adds r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r0, [r7, #4]
	ldr r2, [r7, #0x1c]
	subs r1, r0, r2
	ldr r0, [r7, #8]
	ldr r3, [r7, #0x10]
	subs r2, r0, r3
	ldr r0, [r7]
	bl SetScanlineBufWinL
	ldr r1, [r7, #0x20]
	adds r0, r1, #1
	ldr r2, [r7, #0x14]
	lsls r1, r2, #1
	subs r0, r0, r1
	str r0, [r7, #0x20]
	ldr r0, [r7, #0x20]
	cmp r0, #0
	bge _080780B2
	ldr r1, [r7, #0x10]
	subs r0, r1, #1
	lsls r1, r0, #1
	ldr r0, [r7, #0x20]
	adds r1, r0, r1
	str r1, [r7, #0x20]
	ldr r0, [r7, #0x10]
	subs r1, r0, #1
	str r1, [r7, #0x10]
_080780B2:
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _08077FD0
_080780BA:
	add sp, #0x24
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080780C4
sub_080780C4: @ 0x080780C4
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080780FC @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080780FC @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [sp]
	ldr r1, [r7]
	bl sub_08077EB8
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780FC: .4byte 0x0203E660

	thumb_func_start sub_08078100
sub_08078100: @ 0x08078100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0807811A
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _0807811A
	bl sub_0800AF5C
_0807811A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08078120
sub_08078120: @ 0x08078120
	push {lr}
	ldr r0, [r0, #8]
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_0807812C
sub_0807812C: @ 0x0807812C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r6, _0807813C @ =0x08C9E9A4
	adds r7, r6, #4
	b _0807814E
	.align 2, 0
_0807813C: .4byte 0x08C9E9A4
_08078140:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
_0807814E:
	ldr r0, [r4]
	ldrh r5, [r0]
	ldrh r0, [r0, #2]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078140
	lsls r0, r5, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	bne _08078140
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08078178
	movs r0, #0
	b _0807817A
_08078178:
	adds r0, r4, #0
_0807817A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08078180
sub_08078180: @ 0x08078180
	push {r4, lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _0807818C
	movs r0, #0
	b _080781A6
_0807818C:
	ldr r2, [r3]
	ldr r0, _080781AC @ =0x08C9E9A4
	ldrh r4, [r2]
	lsls r1, r4, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl sub_0807812C
_080781A6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080781AC: .4byte 0x08C9E9A4

	thumb_func_start sub_080781B0
sub_080781B0: @ 0x080781B0
	movs r0, #1
	bx lr

	thumb_func_start sub_080781B4
sub_080781B4: @ 0x080781B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r0, [r0, #8]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080781CA
	movs r0, #0
	b _080781D6
_080781CA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_080781D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080781DC
sub_080781DC: @ 0x080781DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _08078210 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078214
	adds r0, r5, #0
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078214
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _08078216
	.align 2, 0
_08078210: .4byte 0xFFFF0000
_08078214:
	movs r0, #0
_08078216:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0807821C
sub_0807821C: @ 0x0807821C
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r1, _08078240 @ =0x0202BBB8
	ldrb r5, [r1, #0x14]
	ldrb r4, [r1, #0x16]
	adds r6, r4, #0
	ldr r0, [r0]
	ldr r2, [r0, #4]
	cmp r2, #0
	beq _0807829C
	ldrh r0, [r0]
	cmp r0, #0xf
	beq _08078244
	cmp r0, #0x10
	beq _0807826C
_0807823A:
	movs r0, #1
	b _080782B2
	.align 2, 0
_08078240: .4byte 0x0202BBB8
_08078244:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080782B0
_0807824A:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0]
	cmp r5, r1
	bne _0807825A
	ldrb r0, [r0, #1]
	cmp r6, r0
	beq _0807823A
_0807825A:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807824A
	b _080782B0
_0807826C:
	ldr r0, _08078298 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _080782B0
	ldrb r0, [r2]
	cmp r5, r0
	blo _080782B0
	ldrb r1, [r2, #1]
	cmp r4, r1
	blo _080782B0
	ldrb r0, [r2, #4]
	cmp r5, r0
	bhi _080782B0
	ldrb r2, [r2, #5]
	cmp r4, r2
	bhi _080782B0
	b _0807823A
	.align 2, 0
_08078298: .4byte 0x0202E3E4
_0807829C:
	ldr r0, _080782B8 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r5, r0
	bne _080782B0
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r6, r0
	beq _0807823A
_080782B0:
	movs r0, #0
_080782B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080782B8: .4byte 0x03004690

	thumb_func_start sub_080782BC
sub_080782BC: @ 0x080782BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _080782F0 @ =0xFFFF0000
	ldrh r0, [r0, #2]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080782F4
	adds r0, r5, #0
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080782F4
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _080782F6
	.align 2, 0
_080782F0: .4byte 0xFFFF0000
_080782F4:
	movs r0, #0
_080782F6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080782FC
sub_080782FC: @ 0x080782FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	ldrb r6, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r7, r1, #0x10
	ldr r0, [r2, #0xc]
	subs r0, #1
	cmp r0, #4
	bhi _080783B0
	lsls r0, r0, #2
	ldr r1, _08078328 @ =_0807832C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078328: .4byte _0807832C
_0807832C: @ jump table
	.4byte _08078340 @ case 0
	.4byte _08078350 @ case 1
	.4byte _08078368 @ case 2
	.4byte _08078380 @ case 3
	.4byte _08078398 @ case 4
_08078340:
	ldr r1, _0807834C @ =0x0202BBF8
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _080783EC
	b _08078358
	.align 2, 0
_0807834C: .4byte 0x0202BBF8
_08078350:
	ldr r1, _08078364 @ =0x0202BBF8
	ldrb r2, [r1, #0x1b]
	cmp r2, #3
	bne _080783EC
_08078358:
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080783A4
	b _080783EC
	.align 2, 0
_08078364: .4byte 0x0202BBF8
_08078368:
	ldr r1, _0807837C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080783EC
	ldrb r1, [r1, #0x1b]
	cmp r1, #2
	beq _080783A4
	b _080783EC
	.align 2, 0
_0807837C: .4byte 0x0202BBF8
_08078380:
	ldr r1, _08078394 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _080783EC
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	beq _080783A4
	b _080783EC
	.align 2, 0
_08078394: .4byte 0x0202BBF8
_08078398:
	ldr r1, _080783C4 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080783EC
_080783A4:
	movs r0, #2
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080783EC
_080783B0:
	cmp r5, #0
	bne _080783C8
	ldr r0, _080783C4 @ =0x0202BBF8
	ldrh r1, [r0, #0x10]
	cmp r1, r6
	bne _080783EC
	ldrb r0, [r0, #0xf]
	cmp r0, r7
	bne _080783EC
	b _080783DA
	.align 2, 0
_080783C4: .4byte 0x0202BBF8
_080783C8:
	ldr r1, _080783E8 @ =0x0202BBF8
	ldrh r0, [r1, #0x10]
	cmp r0, r6
	blt _080783EC
	cmp r0, r5
	bgt _080783EC
	ldrb r1, [r1, #0xf]
	cmp r1, r7
	bne _080783EC
_080783DA:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _080783EE
	.align 2, 0
_080783E8: .4byte 0x0202BBF8
_080783EC:
	movs r0, #0
_080783EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080783F4
sub_080783F4: @ 0x080783F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r3, #0xff
	adds r5, r1, #0
	ands r5, r3
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	lsrs r6, r1, #8
	ldr r0, [r2, #0xc]
	adds r1, r0, #0
	ands r1, r3
	cmp r1, #2
	beq _08078434
	cmp r1, #2
	bhi _0807841E
	cmp r1, #1
	beq _08078424
	b _08078450
_0807841E:
	cmp r1, #3
	beq _08078444
	b _08078450
_08078424:
	ldr r0, _08078430 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08078450
	b _0807846E
	.align 2, 0
_08078430: .4byte 0x0202BBF8
_08078434:
	ldr r0, _08078440 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _08078450
	b _0807846E
	.align 2, 0
_08078440: .4byte 0x0202BBF8
_08078444:
	lsrs r0, r0, #0x10
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807846E
_08078450:
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _0807845A
	cmp r5, #0
	bne _0807846E
_0807845A:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _0807846E
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08078470
_0807846E:
	movs r0, #0
_08078470:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08078478
sub_08078478: @ 0x08078478
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r2, #8]
	ldrb r5, [r2, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r6, r0, #8
	ldr r1, [r2, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080784B6
	ldrb r0, [r4, #0x1a]
	cmp r0, r5
	beq _080784A2
	cmp r5, #0
	bne _080784B6
_080784A2:
	ldrb r0, [r4, #0x1b]
	cmp r0, r6
	bne _080784B6
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _080784B8
_080784B6:
	movs r0, #0
_080784B8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvCheck05_LOCA
EvCheck05_LOCA: @ 0x080784C0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r1, r1, #0x10
	movs r6, #0
	str r6, [r3, #0x10]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08078502
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08078502
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldrh r0, [r4, #2]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	cmp r1, #0x12
	bne _080784FE
	str r6, [r3, #0x14]
_080784FE:
	movs r0, #1
	b _08078504
_08078502:
	movs r0, #0
_08078504:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvCheck06_VILL
EvCheck06_VILL: @ 0x0807850C
	push {r4, lr}
	adds r4, r0, #0
	bl EvCheck05_LOCA
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08078520
sub_08078520: @ 0x08078520
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _08078562
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _08078562
	movs r0, #1
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	ldrh r0, [r3, #4]
	str r0, [r2, #0x14]
	ldrh r0, [r3, #6]
	str r0, [r2, #0x10]
	movs r0, #1
	b _08078564
_08078562:
	movs r0, #0
_08078564:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807856C
sub_0807856C: @ 0x0807856C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _080785A8
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _080785A8
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _080785AA
_080785A8:
	movs r0, #0
_080785AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080785B0
sub_080785B0: @ 0x080785B0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r0, [r3, #8]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	lsrs r4, r1, #8
	movs r1, #0xff
	lsls r1, r1, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	lsrs r1, r0, #0x18
	ldrb r0, [r3, #8]
	ldrb r6, [r2, #0x18]
	cmp r0, r6
	bne _080785EC
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _080785EC
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	str r0, [r2, #8]
	str r5, [r2, #0xc]
	str r1, [r2, #0x10]
	movs r0, #1
	b _080785EE
_080785EC:
	movs r0, #0
_080785EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_080785F4
sub_080785F4: @ 0x080785F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r3, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r1, r0
	lsrs r5, r1, #0x10
	ldrb r2, [r2, #8]
	ldrb r0, [r4, #0x18]
	cmp r2, r0
	bne _08078648
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r3, r0
	bne _08078648
	cmp r5, #0x15
	bne _08078632
	ldr r0, _08078644 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x71
	bl FindUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08078648
_08078632:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	movs r0, #1
	b _0807864A
	.align 2, 0
_08078644: .4byte 0x03004690
_08078648:
	movs r0, #0
_0807864A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08078650
sub_08078650: @ 0x08078650
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _080786A8 @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x11]
	mov ip, r0
	ldr r3, [r5]
	ldr r1, [r3, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r4, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r7, r0, #0x10
	lsrs r6, r1, #0x18
	movs r0, #8
	ldrsb r0, [r3, r0]
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r0, r2
	bgt _080786AC
	lsls r1, r4, #0x18
	mov r4, ip
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r1, r0
	bgt _080786AC
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	blt _080786AC
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	blt _080786AC
	ldr r0, [r3, #4]
	str r0, [r5, #4]
	ldrh r0, [r3, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _080786AE
	.align 2, 0
_080786A8: .4byte 0x03004690
_080786AC:
	movs r0, #0
_080786AE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080786B4
sub_080786B4: @ 0x080786B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080786D4 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080786D8
	movs r0, #2
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080786D8
	adds r0, r4, #0
	bl sub_08078650
	b _080786DA
	.align 2, 0
_080786D4: .4byte 0x0202BBF8
_080786D8:
	movs r0, #0
_080786DA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080786E0
sub_080786E0: @ 0x080786E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078700 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08078704
	movs r0, #2
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078704
	adds r0, r4, #0
	bl sub_08078650
	b _08078706
	.align 2, 0
_08078700: .4byte 0x0202BBF8
_08078704:
	movs r0, #0
_08078706:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EvCheck0E_
EvCheck0E_: @ 0x0807870C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078724
	movs r0, #0
	b _08078730
_08078724:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08078730:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08078738
sub_08078738: @ 0x08078738
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne _0807875C
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne _0807875C
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _0807875E
_0807875C:
	movs r0, #0
_0807875E:
	bx lr

	thumb_func_start CheckActiveUnitArea
CheckActiveUnitArea: @ 0x08078760
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _08078788 @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt _0807878C
	cmp r1, r4
	bgt _0807878C
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt _0807878C
	cmp r1, r3
	bgt _0807878C
	movs r0, #1
	b _0807878E
	.align 2, 0
_08078788: .4byte 0x03004690
_0807878C:
	movs r0, #0
_0807878E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CheckAnyBlueUnitArea
CheckAnyBlueUnitArea: @ 0x08078794
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
_080787A4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080787E0
	ldr r0, [r2]
	cmp r0, #0
	beq _080787E0
	ldr r0, [r2, #0xc]
	ldr r1, _080787DC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080787E0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _080787E0
	cmp r0, r6
	bgt _080787E0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _080787E0
	cmp r0, r5
	bgt _080787E0
	movs r0, #1
	b _080787E8
	.align 2, 0
_080787DC: .4byte 0x00010004
_080787E0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080787A4
	movs r0, #0
_080787E8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea1
CheckAnyBlueUnitArea1: @ 0x080787F4
	push {lr}
	ldr r0, _08078814 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078818
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078818
	movs r0, #1
	b _0807881A
	.align 2, 0
_08078814: .4byte 0x0202BBF8
_08078818:
	movs r0, #0
_0807881A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea2
CheckAnyBlueUnitArea2: @ 0x08078820
	push {lr}
	ldr r0, _08078864 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078860
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
_08078860:
	movs r0, #0
	b _0807886A
	.align 2, 0
_08078864: .4byte 0x0202BBF8
_08078868:
	movs r0, #1
_0807886A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea3
CheckAnyBlueUnitArea3: @ 0x08078870
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea4
CheckAnyBlueUnitArea4: @ 0x08078888
	push {lr}
	ldr r0, _080788A4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788A8
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788AA
	.align 2, 0
_080788A4: .4byte 0x0202BBF8
_080788A8:
	movs r0, #0
_080788AA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea5
CheckAnyBlueUnitArea5: @ 0x080788B0
	push {lr}
	ldr r0, _080788CC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788D0
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788D2
	.align 2, 0
_080788CC: .4byte 0x0202BBF8
_080788D0:
	movs r0, #0
_080788D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea6
CheckAnyBlueUnitArea6: @ 0x080788D8
	push {lr}
	ldr r0, _080788F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788F8
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788FA
	.align 2, 0
_080788F4: .4byte 0x0202BBF8
_080788F8:
	movs r0, #0
_080788FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyBlueUnitArea7
CheckAnyBlueUnitArea7: @ 0x08078900
	push {lr}
	ldr r0, _0807891C @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078920
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08078922
	.align 2, 0
_0807891C: .4byte 0x0202BBF8
_08078920:
	movs r0, #0
_08078922:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAnyRedUnitArea
CheckAnyRedUnitArea: @ 0x08078928
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
_08078938:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08078974
	ldr r0, [r2]
	cmp r0, #0
	beq _08078974
	ldr r0, [r2, #0xc]
	ldr r1, _08078970 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08078974
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08078974
	cmp r0, r6
	bgt _08078974
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08078974
	cmp r0, r5
	bgt _08078974
	movs r0, #1
	b _0807897C
	.align 2, 0
_08078970: .4byte 0x00010004
_08078974:
	adds r4, #1
	cmp r4, #0xbf
	ble _08078938
	movs r0, #0
_0807897C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckAvailableTurnEvent
CheckAvailableTurnEvent: @ 0x08078988
	push {lr}
	sub sp, #0x1c
	ldr r0, _080789AC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	bne _080789B0
	movs r0, #0
	b _080789B2
	.align 2, 0
_080789AC: .4byte 0x0202BBF8
_080789B0:
	movs r0, #1
_080789B2:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start StartAvailableTurnEvents
StartAvailableTurnEvents: @ 0x080789B8
	push {lr}
	sub sp, #0x1c
	ldr r0, _080789E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080789F4
	mov r0, sp
	bl sub_08078100
	b _080789EA
	.align 2, 0
_080789E0: .4byte 0x0202BBF8
_080789E4:
	mov r0, sp
	bl sub_08078100
_080789EA:
	mov r0, sp
	bl sub_08078180
	cmp r0, #0
	bne _080789E4
_080789F4:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080789FC
sub_080789FC: @ 0x080789FC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078A30 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_0807812C
	cmp r0, #0
	bne _08078A34
	movs r0, #0
	b _08078A36
	.align 2, 0
_08078A30: .4byte 0x0202BBF8
_08078A34:
	movs r0, #1
_08078A36:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartCharacterEvent
StartCharacterEvent: @ 0x08078A40
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078A7C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_0807812C
	cmp r0, #0
	beq _08078A74
	mov r0, sp
	bl sub_08078100
_08078A74:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078A7C: .4byte 0x0202BBF8

	thumb_func_start StartSupportTalk
StartSupportTalk: @ 0x08078A80
	push {r4, r5, r6, r7, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0
	ldr r0, _08078A94 @ =0x08C9F9F4
	b _08078AC2
	.align 2, 0
_08078A94: .4byte 0x08C9F9F4
_08078A98:
	adds r2, r1, #0
	ldrb r1, [r0, #1]
	cmp r2, r7
	bne _08078AA4
	cmp r1, r6
	beq _08078AAC
_08078AA4:
	cmp r1, r7
	bne _08078AC0
	cmp r2, r6
	bne _08078AC0
_08078AAC:
	cmp r4, #1
	bne _08078AB2
	ldr r5, [r0, #4]
_08078AB2:
	cmp r4, #2
	bne _08078AB8
	ldr r5, [r0, #8]
_08078AB8:
	cmp r4, #3
	bne _08078AC8
	ldr r5, [r0, #0xc]
	b _08078AC8
_08078AC0:
	adds r0, #0x14
_08078AC2:
	ldrb r1, [r0]
	cmp r1, #0
	bne _08078A98
_08078AC8:
	cmp r5, #0
	beq _08078AEC
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl GetSupportTalkSong
	adds r1, r0, #0
	adds r0, r5, #0
	bl CallMapSupportEvent
	bl sub_0800ADB8
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl UpdateBestGlobalSupportValue
_08078AEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartSupportViewerTalk
StartSupportViewerTalk: @ 0x08078AF4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _08078B04 @ =0x08C9F9F4
	b _08078B32
	.align 2, 0
_08078B04: .4byte 0x08C9F9F4
_08078B08:
	adds r0, r3, #0
	ldrb r3, [r1, #1]
	cmp r0, r6
	bne _08078B14
	cmp r3, r4
	beq _08078B1C
_08078B14:
	cmp r3, r6
	bne _08078B30
	cmp r0, r4
	bne _08078B30
_08078B1C:
	cmp r2, #1
	bne _08078B22
	ldr r5, [r1, #4]
_08078B22:
	cmp r2, #2
	bne _08078B28
	ldr r5, [r1, #8]
_08078B28:
	cmp r2, #3
	bne _08078B38
	ldr r5, [r1, #0xc]
	b _08078B38
_08078B30:
	adds r1, #0x14
_08078B32:
	ldrb r3, [r1]
	cmp r3, #0
	bne _08078B08
_08078B38:
	cmp r5, #0
	beq _08078B46
	adds r0, r5, #0
	bl CallSupportViewerEvent
	bl sub_0800ADB8
_08078B46:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start GetSupportTalkSong
GetSupportTalkSong: @ 0x08078B4C
	push {r4, r5, lr}
	adds r5, r3, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	bne _08078B82
	ldr r2, _08078B64 @ =0x08C9F9F4
	b _08078B6A
	.align 2, 0
_08078B64: .4byte 0x08C9F9F4
_08078B68:
	adds r2, #0x14
_08078B6A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08078B82
	ldrb r1, [r2, #1]
	cmp r0, r4
	bne _08078B7A
	cmp r1, r3
	beq _08078B82
_08078B7A:
	cmp r1, r4
	bne _08078B68
	cmp r0, r3
	bne _08078B68
_08078B82:
	ldr r1, [r2, #0x10]
	cmp r1, #0
	beq _08078BC8
	subs r0, r5, #1
	lsls r0, r0, #3
	adds r3, r1, #0
	lsrs r3, r0
	movs r0, #0xff
	ands r3, r0
	cmp r3, #4
	bhi _08078BC8
	lsls r0, r3, #2
	ldr r1, _08078BA4 @ =_08078BA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078BA4: .4byte _08078BA8
_08078BA8: @ jump table
	.4byte _08078BC8 @ case 0
	.4byte _08078BBC @ case 1
	.4byte _08078BC0 @ case 2
	.4byte _08078BC4 @ case 3
	.4byte _08078BC4 @ case 4
_08078BBC:
	movs r0, #0x41
	b _08078BCA
_08078BC0:
	movs r0, #0x4c
	b _08078BCA
_08078BC4:
	movs r0, #0x6a
	b _08078BCA
_08078BC8:
	movs r0, #0
_08078BCA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start GetAvailableTileEventCommand
GetAvailableTileEventCommand: @ 0x08078BD0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078C04 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_0807812C
	cmp r0, #0
	beq _08078C08
	ldr r0, [sp, #0xc]
	b _08078C0A
	.align 2, 0
_08078C04: .4byte 0x0202BBF8
_08078C08:
	movs r0, #0
_08078C0A:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start StartAvailableTileEvent
StartAvailableTileEvent: @ 0x08078C14
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078C58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_0807812C
	cmp r0, #0
	bne _08078C44
	b _08078DF2
_08078C44:
	ldr r0, [sp, #0xc]
	cmp r0, #0x1d
	bls _08078C4C
	b _08078DF2
_08078C4C:
	lsls r0, r0, #2
	ldr r1, _08078C5C @ =_08078C60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078C58: .4byte 0x0202BBF8
_08078C5C: .4byte _08078C60
_08078C60: @ jump table
	.4byte _08078DF0 @ case 0
	.4byte _08078DF2 @ case 1
	.4byte _08078DF2 @ case 2
	.4byte _08078DF2 @ case 3
	.4byte _08078DF2 @ case 4
	.4byte _08078DF2 @ case 5
	.4byte _08078DF2 @ case 6
	.4byte _08078DF2 @ case 7
	.4byte _08078DF2 @ case 8
	.4byte _08078DF2 @ case 9
	.4byte _08078DF2 @ case 10
	.4byte _08078DF2 @ case 11
	.4byte _08078DF2 @ case 12
	.4byte _08078DF2 @ case 13
	.4byte _08078CD8 @ case 14
	.4byte _08078CD8 @ case 15
	.4byte _08078D08 @ case 16
	.4byte _08078D08 @ case 17
	.4byte _08078D3A @ case 18
	.4byte _08078DBC @ case 19
	.4byte _08078DCC @ case 20
	.4byte _08078DDC @ case 21
	.4byte _08078DEC @ case 22
	.4byte _08078DF2 @ case 23
	.4byte _08078DF2 @ case 24
	.4byte _08078DF2 @ case 25
	.4byte _08078DF2 @ case 26
	.4byte _08078DF2 @ case 27
	.4byte _08078DF2 @ case 28
	.4byte _08078CE6 @ case 29
_08078CD8:
	mov r0, sp
	bl sub_08078100
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _08078CE6
	b _08078DF2
_08078CE6:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
_08078D02:
	bl sub_0800ADB8
	b _08078DF2
_08078D08:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _08078D32
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
	ldr r0, [sp, #8]
	bl SetFlag
	b _08078D02
_08078D32:
	mov r0, sp
	bl sub_08078100
	b _08078D02
_08078D3A:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	bne _08078D64
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0800F028
	mov r0, sp
	bl sub_08078100
	b _08078DB0
_08078D64:
	cmp r4, #0x76
	beq _08078D8E
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_0800F044
	b _08078DB0
_08078D8E:
	ldr r4, [sp, #0x10]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_0800F06C
_08078DB0:
	bl sub_0800ADB8
	ldr r0, [sp, #8]
	bl SetFlag
	b _08078DF2
_08078DBC:
	ldr r0, _08078DC8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B03D4
	b _08078DF2
	.align 2, 0
_08078DC8: .4byte 0x03004690
_08078DCC:
	ldr r0, _08078DD8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B03F4
	b _08078DF2
	.align 2, 0
_08078DD8: .4byte 0x03004690
_08078DDC:
	ldr r0, _08078DE8 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_080B0414
	b _08078DF2
	.align 2, 0
_08078DE8: .4byte 0x03004690
_08078DEC:
	mov r8, r8
	b _08078DF2
_08078DF0:
	mov r8, r8
_08078DF2:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078DFC
sub_08078DFC: @ 0x08078DFC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl StartAvailableTileEvent
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078E10
sub_08078E10: @ 0x08078E10
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0xe
	beq _08078E26
	movs r0, #0
	b _08078E28
_08078E26:
	movs r0, #1
_08078E28:
	pop {r1}
	bx r1

	thumb_func_start sub_08078E2C
sub_08078E2C: @ 0x08078E2C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08078E10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078E4C
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078E4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078E54
sub_08078E54: @ 0x08078E54
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r0, #0x18
	asrs r5, r0, #0x18
	lsrs r7, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x13
	beq _08078EB0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x14
	beq _08078EB0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetAvailableTileEventCommand
	cmp r0, #0x15
	bne _08078E98
	ldr r0, _08078EAC @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x71
	bl FindUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08078EB0
_08078E98:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x16
	beq _08078EB0
	movs r0, #0
	b _08078EB2
	.align 2, 0
_08078EAC: .4byte 0x03004690
_08078EB0:
	movs r0, #1
_08078EB2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08078EB8
sub_08078EB8: @ 0x08078EB8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08078E54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078ED8
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078ED8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IsThereClosedDoorAt
IsThereClosedDoorAt: @ 0x08078EE0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x12
	beq _08078EF6
	movs r0, #0
	b _08078EF8
_08078EF6:
	movs r0, #1
_08078EF8:
	pop {r1}
	bx r1

	thumb_func_start StartAvailableChestTileEvent
StartAvailableChestTileEvent: @ 0x08078EFC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078F1C
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078F1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078F24
sub_08078F24: @ 0x08078F24
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x10
	beq _08078F3A
	movs r0, #0
	b _08078F3C
_08078F3A:
	movs r0, #1
_08078F3C:
	pop {r1}
	bx r1

	thumb_func_start StartAvailableDoorTileEvent
StartAvailableDoorTileEvent: @ 0x08078F40
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078F60
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078F60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078F68
sub_08078F68: @ 0x08078F68
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableTileEventCommand
	cmp r0, #0x11
	beq _08078F7E
	movs r0, #0
	b _08078F80
_08078F7E:
	movs r0, #1
_08078F80:
	pop {r1}
	bx r1

	thumb_func_start sub_08078F84
sub_08078F84: @ 0x08078F84
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08078F68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08078FA4
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartAvailableTileEvent
_08078FA4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ShouldCallEndEvent
ShouldCallEndEvent: @ 0x08078FAC
	push {lr}
	bl CheckWin
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start MaybeCallEndEvent_
MaybeCallEndEvent_: @ 0x08078FBC
	push {lr}
	bl MaybeCallEndEvent
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08078FC8
sub_08078FC8: @ 0x08078FC8
	push {lr}
	sub sp, #0x1c
	ldr r0, _08078FFC @ =0x0202BBF8
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08079000 @ =0x08C9EA2C
	lsls r0, r1, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	cmp r1, #0xb
	bhi _08078FF4
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08078FF4
	mov r0, sp
	bl sub_08078100
_08078FF4:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_08078FFC: .4byte 0x0202BBF8
_08079000: .4byte 0x08C9EA2C

	thumb_func_start sub_08079004
sub_08079004: @ 0x08079004
	push {r4, lr}
	sub sp, #0x1c
	ldr r0, _08079048 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0807904C @ =0x08C9EA2C
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r4, #0xb
	bhi _08079050
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08079050
	mov r0, sp
	bl sub_08078100
	cmp r4, #1
	bne _08079050
	bl sub_0807CEFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079050
	movs r0, #1
	b _08079052
	.align 2, 0
_08079048: .4byte 0x0202BBF8
_0807904C: .4byte 0x08C9EA2C
_08079050:
	movs r0, #0
_08079052:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807905C
sub_0807905C: @ 0x0807905C
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807909C @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080790A0 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080790AA
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080790AA
	mov r0, sp
	bl sub_0807821C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080790A4
	mov r0, sp
	bl sub_08078100
	movs r0, #1
	b _080790AC
	.align 2, 0
_0807909C: .4byte 0x0202BBF8
_080790A0: .4byte 0x08C9EA2C
_080790A4:
	mov r0, sp
	bl sub_08078120
_080790AA:
	movs r0, #0
_080790AC:
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080790B4
sub_080790B4: @ 0x080790B4
	movs r0, #0
	bx lr

	thumb_func_start sub_080790B8
sub_080790B8: @ 0x080790B8
	movs r0, #0
	bx lr

	thumb_func_start sub_080790BC
sub_080790BC: @ 0x080790BC
	movs r0, #0
	bx lr

	thumb_func_start sub_080790C0
sub_080790C0: @ 0x080790C0
	movs r0, #0
	bx lr

	thumb_func_start sub_080790C4
sub_080790C4: @ 0x080790C4
	push {lr}
	sub sp, #0x1c
	ldr r0, _080790FC @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079100 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080790F2
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080790F2
	mov r0, sp
	bl sub_08078100
_080790F2:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080790FC: .4byte 0x0202BBF8
_08079100: .4byte 0x08C9EA2C

	thumb_func_start sub_08079104
sub_08079104: @ 0x08079104
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079130 @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079134 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _08079138
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08079138
	movs r0, #1
	b _0807913A
	.align 2, 0
_08079130: .4byte 0x0202BBF8
_08079134: .4byte 0x08C9EA2C
_08079138:
	movs r0, #0
_0807913A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start CheckForWaitEvents
CheckForWaitEvents: @ 0x08079140
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079170 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08079174 @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	bne _08079178
	movs r0, #0
	b _0807917A
	.align 2, 0
_08079170: .4byte 0x0202BBF8
_08079174: .4byte 0x03004690
_08079178:
	movs r0, #1
_0807917A:
	add sp, #0x1c
	pop {r1}
	bx r1

	thumb_func_start RunWaitEvents
RunWaitEvents: @ 0x08079180
	push {lr}
	sub sp, #0x1c
	ldr r0, _080791B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080791BC @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080791B2
	mov r0, sp
	bl sub_08078100
_080791B2:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_080791B8: .4byte 0x0202BBF8
_080791BC: .4byte 0x03004690

	thumb_func_start CheckWin
CheckWin: @ 0x080791C0
	push {lr}
	movs r0, #3
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start MaybeCallEndEvent
MaybeCallEndEvent: @ 0x080791D0
	push {lr}
	movs r0, #3
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080791EC
	bl ShouldCallEndEvent
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080791EC
	bl CallEndEvent
_080791EC:
	pop {r0}
	bx r0

	thumb_func_start sub_080791F0
sub_080791F0: @ 0x080791F0
	push {r4, lr}
	ldr r4, _08079208 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	beq _0807920C
	ldr r0, [r0, #0x10]
	b _0807920E
	.align 2, 0
_08079208: .4byte 0x0202BBF8
_0807920C:
	ldr r0, [r0, #0x14]
_0807920E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08079214
sub_08079214: @ 0x08079214
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _08079248 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventInfo
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	cmp r0, #0x27
	bne _08079232
	bl sub_0807D7E0
_08079232:
	ldrb r0, [r5, #0x1b]
	cmp r0, #3
	bne _08079250
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _0807924C
	ldr r0, [r4, #0x24]
	b _0807925C
	.align 2, 0
_08079248: .4byte 0x0202BBF8
_0807924C:
	ldr r0, [r4, #0x20]
	b _0807925C
_08079250:
	movs r0, #0x40
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	beq _08079264
	ldr r0, [r4, #0x1c]
_0807925C:
	str r0, [sp, #4]
	bl LoadUnits
	b _0807926C
_08079264:
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	bl LoadUnits
_0807926C:
	bl sub_080799C8
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08079280
sub_08079280: @ 0x08079280
	push {r4, lr}
	ldr r4, _080792A4 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	adds r1, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #3
	bne _080792AC
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	beq _080792A8
	ldr r0, [r1, #0x34]
	b _080792BC
	.align 2, 0
_080792A4: .4byte 0x0202BBF8
_080792A8:
	ldr r0, [r1, #0x30]
	b _080792BC
_080792AC:
	movs r0, #0x40
	ldrb r4, [r4, #0x14]
	ands r0, r4
	cmp r0, #0
	bne _080792BA
	ldr r0, [r1, #0x28]
	b _080792BC
_080792BA:
	ldr r0, [r1, #0x2c]
_080792BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080792C4
sub_080792C4: @ 0x080792C4
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080792E0 @ =0x08C9EDA0
	ldr r1, _080792E4 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079310
	b _08079316
	.align 2, 0
_080792E0: .4byte 0x08C9EDA0
_080792E4: .4byte 0x0202BBF8
_080792E8:
	adds r0, r3, #0
	b _08079318
_080792EC:
	ldrb r2, [r3]
	cmp r5, r2
	bne _080792F6
	cmp r4, r0
	beq _08079300
_080792F6:
	ldrb r0, [r3, #1]
	cmp r5, r0
	bne _0807930E
	cmp r4, r2
	bne _0807930E
_08079300:
	ldrb r2, [r3, #2]
	cmp r2, #0x43
	beq _080792E8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, r2
	beq _080792E8
_0807930E:
	adds r3, #0x10
_08079310:
	ldrb r0, [r3, #1]
	cmp r0, #0
	bne _080792EC
_08079316:
	movs r0, #0
_08079318:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08079320
sub_08079320: @ 0x08079320
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0807935A
_0807932A:
	ldr r0, [r4, #8]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079358
	ldrb r0, [r4]
	cmp r5, r0
	bne _08079358
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _08079350
	ldr r0, _08079354 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08079358
_08079350:
	adds r0, r4, #0
	b _08079362
	.align 2, 0
_08079354: .4byte 0x0202BBF8
_08079358:
	adds r4, #0xc
_0807935A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0807932A
	movs r0, #0
_08079362:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08079368
sub_08079368: @ 0x08079368
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080793A2
_08079372:
	ldr r0, [r4, #0xc]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080793A0
	ldrb r0, [r4]
	cmp r5, r0
	bne _080793A0
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _08079398
	ldr r0, _0807939C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080793A0
_08079398:
	adds r0, r4, #0
	b _080793AA
	.align 2, 0
_0807939C: .4byte 0x0202BBF8
_080793A0:
	adds r4, #0x10
_080793A2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08079372
	movs r0, #0
_080793AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080793B0
sub_080793B0: @ 0x080793B0
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080793EA
_080793BA:
	ldr r0, [r4, #8]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080793E8
	ldrb r0, [r4]
	cmp r5, r0
	bne _080793E8
	ldrb r1, [r4, #1]
	cmp r1, #0x43
	beq _080793E0
	ldr r0, _080793E4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080793E8
_080793E0:
	adds r0, r4, #0
	b _080793F2
	.align 2, 0
_080793E4: .4byte 0x0202BBF8
_080793E8:
	adds r4, #0xc
_080793EA:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080793BA
	movs r0, #0
_080793F2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CheckBattleTalk
CheckBattleTalk: @ 0x080793F8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r5, r1, #0
	adds r0, r4, #0
	bl sub_080792C4
	cmp r0, #0
	beq _0807941E
	ldr r0, [r0, #0xc]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807945C
	b _0807944E
_0807941E:
	ldr r6, _08079454 @ =0x08C9EAF4
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08079320
	cmp r0, #0
	bne _0807944E
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08079320
	cmp r0, #0
	bne _0807944E
	ldr r1, _08079458 @ =0x08C9F130
	adds r0, r7, #0
	bl sub_08079320
	cmp r0, #0
	beq _0807945C
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807945C
_0807944E:
	movs r0, #1
	b _0807945E
	.align 2, 0
_08079454: .4byte 0x08C9EAF4
_08079458: .4byte 0x08C9F130
_0807945C:
	movs r0, #0
_0807945E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start StartBattleTalk
StartBattleTalk: @ 0x08079464
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r1, #0
	adds r0, r4, #0
	bl sub_080792C4
	adds r5, r0, #0
	cmp r5, #0
	beq _080794A8
	ldr r0, [r5, #0xc]
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079508
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08079496
	bl sub_0800ED78
	b _0807949C
_08079496:
	ldr r0, [r5, #8]
	bl sub_0800AF5C
_0807949C:
	bl sub_0800ADB8
	ldr r0, [r5, #0xc]
	bl SetFlag
	b _08079508
_080794A8:
	ldr r5, _080794DC @ =0x08C9EAF4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	bne _080794C6
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	beq _080794E0
_080794C6:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080794D4
	bl sub_0800ED78
	bl sub_0800ADB8
_080794D4:
	ldr r0, [r4, #8]
	bl SetFlag
	b _08079508
	.align 2, 0
_080794DC: .4byte 0x08C9EAF4
_080794E0:
	ldr r1, _08079510 @ =0x08C9F130
	adds r0, r7, #0
	bl sub_08079320
	adds r4, r0, #0
	cmp r4, #0
	beq _08079508
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079508
	ldr r0, [r4, #4]
	bl sub_0800ED78
	bl sub_0800ADB8
	ldr r0, [r4, #8]
	bl SetFlag
_08079508:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079510: .4byte 0x08C9F130

	thumb_func_start CheckBattleDefeatTalk
CheckBattleDefeatTalk: @ 0x08079514
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	ldr r1, _08079550 @ =0x08C9F2EC
	adds r0, r4, #0
	bl sub_08079368
	cmp r0, #0
	bne _0807954C
	ldr r6, _08079554 @ =0x0202BBF8
	ldr r1, _08079558 @ =0x08C9F22C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079534
	ldr r1, _0807955C @ =0x08C9F16C
_08079534:
	adds r0, r4, #0
	bl sub_080793B0
	cmp r0, #0
	bne _0807954C
	ldrb r6, [r6, #0x1b]
	cmp r6, #1
	beq _08079560
	cmp r5, #0xf
	beq _0807954C
	cmp r5, #0x15
	bne _08079560
_0807954C:
	movs r0, #1
	b _08079562
	.align 2, 0
_08079550: .4byte 0x08C9F2EC
_08079554: .4byte 0x0202BBF8
_08079558: .4byte 0x08C9F22C
_0807955C: .4byte 0x08C9F16C
_08079560:
	movs r0, #0
_08079562:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08079568
sub_08079568: @ 0x08079568
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_08079572:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079614
	ldr r0, [r4]
	cmp r0, #0
	beq _08079614
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _08079614
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079614
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl PidStatsRecordDefeatInfo
	adds r0, r4, #0
	bl KillUnit
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r0, _0807960C @ =0x0203A3F0
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _080795C0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080795C0:
	ldr r0, _08079610 @ =0x0203A470
	ldrb r1, [r0, #0xb]
	ldrb r2, [r4, #0xb]
	cmp r1, r2
	bne _080795D2
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080795D2:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080795EA
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDropRescue
_080795EA:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807961A
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDropRescue
	b _0807961A
	.align 2, 0
_0807960C: .4byte 0x0203A3F0
_08079610: .4byte 0x0203A470
_08079614:
	adds r5, #1
	cmp r5, #0x3f
	ble _08079572
_0807961A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DisplayDefeatTalkForPid
DisplayDefeatTalkForPid: @ 0x08079624
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r6, _08079674 @ =0x0202BBF8
	ldr r1, _08079678 @ =0x08C9F22C
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08079636
	ldr r1, _0807967C @ =0x08C9F16C
_08079636:
	adds r0, r5, #0
	bl sub_080793B0
	adds r4, r0, #0
	cmp r4, #0
	beq _0807969A
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0807964C
	bl sub_0800AF5C
_0807964C:
	bl sub_0800ADB8
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #8]
	cmp r0, #0x65
	bne _08079680
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	adds r1, r6, #0
	adds r1, #0x41
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	b _080796FC
	.align 2, 0
_08079674: .4byte 0x0202BBF8
_08079678: .4byte 0x08C9F22C
_0807967C: .4byte 0x08C9F16C
_08079680:
	adds r0, r5, #0
	bl GetUnitByPid
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080796FC
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
	b _080796FC
_0807969A:
	ldr r1, _080796B4 @ =0x08C9F2EC
	adds r0, r5, #0
	bl sub_08079368
	adds r4, r0, #0
	cmp r4, #0
	beq _080796E4
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _080796B8
	bl sub_0800ED78
	b _080796C2
	.align 2, 0
_080796B4: .4byte 0x08C9F2EC
_080796B8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080796C2
	bl sub_0800AF5C
_080796C2:
	bl sub_0800ADB8
	ldr r0, [r4, #0xc]
	bl SetFlag
	adds r0, r5, #0
	bl GetUnitByPid
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _080796E4
	movs r0, #0x2c
	movs r1, #0
	bl StartBgm
_080796E4:
	cmp r5, #0xf
	beq _080796EE
	cmp r5, #0x15
	beq _080796F6
	b _080796FC
_080796EE:
	movs r0, #0x15
	bl sub_08079568
	b _080796FC
_080796F6:
	movs r0, #0xf
	bl sub_08079568
_080796FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08079704
sub_08079704: @ 0x08079704
	push {lr}
	movs r0, #0x65
	bl SetFlag
	movs r0, #0x2b
	movs r1, #0
	bl StartBgm
	ldr r0, _0807972C @ =0x0202BBF8
	adds r0, #0x41
	movs r1, #1
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r0, _08079730 @ =0x08CA749C
	bl sub_0800AF5C
	pop {r0}
	bx r0
	.align 2, 0
_0807972C: .4byte 0x0202BBF8
_08079730: .4byte 0x08CA749C

	thumb_func_start sub_08079734
sub_08079734: @ 0x08079734
	movs r0, #0
	bx lr

	thumb_func_start sub_08079738
sub_08079738: @ 0x08079738
	bx lr
	.align 2, 0

	thumb_func_start sub_0807973C
sub_0807973C: @ 0x0807973C
	bx lr
	.align 2, 0

	thumb_func_start sub_08079740
sub_08079740: @ 0x08079740
	movs r0, #0
	bx lr

	thumb_func_start sub_08079744
sub_08079744: @ 0x08079744
	bx lr
	.align 2, 0

	thumb_func_start sub_08079748
sub_08079748: @ 0x08079748
	movs r0, #0
	bx lr

	thumb_func_start sub_0807974C
sub_0807974C: @ 0x0807974C
	movs r0, #0
	bx lr

	thumb_func_start sub_08079750
sub_08079750: @ 0x08079750
	bx lr
	.align 2, 0

	thumb_func_start sub_08079754
sub_08079754: @ 0x08079754
	bx lr
	.align 2, 0

	thumb_func_start sub_08079758
sub_08079758: @ 0x08079758
	bx lr
	.align 2, 0

	thumb_func_start sub_0807975C
sub_0807975C: @ 0x0807975C
	bx lr
	.align 2, 0

	thumb_func_start sub_08079760
sub_08079760: @ 0x08079760
	bx lr
	.align 2, 0

	thumb_func_start SetChapterFlag
SetChapterFlag: @ 0x08079764
	adds r3, r0, #0
	cmp r3, #0
	beq _0807978C
	subs r3, #1
	ldr r1, _08079790 @ =0x03004AD8
	adds r0, r3, #0
	cmp r3, #0
	bge _08079776
	adds r0, r3, #7
_08079776:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079794 @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807978C:
	bx lr
	.align 2, 0
_08079790: .4byte 0x03004AD8
_08079794: .4byte 0x08C9EAEC

	thumb_func_start CheckPermanentFlag
CheckPermanentFlag: @ 0x08079798
	adds r3, r0, #0
	cmp r3, #0
	beq _080797C2
	subs r3, #1
	ldr r1, _080797C8 @ =0x03004AD8
	adds r0, r3, #0
	cmp r3, #0
	bge _080797AA
	adds r0, r3, #7
_080797AA:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _080797CC @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _080797D0
_080797C2:
	movs r0, #0
	b _080797D2
	.align 2, 0
_080797C8: .4byte 0x03004AD8
_080797CC: .4byte 0x08C9EAEC
_080797D0:
	movs r0, #1
_080797D2:
	bx lr

	thumb_func_start ClearChapterFlag
ClearChapterFlag: @ 0x080797D4
	adds r2, r0, #0
	cmp r2, #0
	beq _08079802
	subs r2, #1
	ldr r3, _08079804 @ =0x08C9EAEC
	adds r1, r2, #0
	cmp r2, #0
	bge _080797E6
	adds r1, r2, #7
_080797E6:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08079808 @ =0x03004AD8
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_08079802:
	bx lr
	.align 2, 0
_08079804: .4byte 0x08C9EAEC
_08079808: .4byte 0x03004AD8

	thumb_func_start ClearChapterFlags
ClearChapterFlags: @ 0x0807980C
	ldr r1, _0807981C @ =0x03004AD8
	movs r2, #0
	adds r0, r1, #5
_08079812:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08079812
	bx lr
	.align 2, 0
_0807981C: .4byte 0x03004AD8

	thumb_func_start SetPermanentFlag
SetPermanentFlag: @ 0x08079820
	adds r3, r0, #0
	cmp r3, #0x63
	ble _0807984C
	cmp r3, #0x64
	beq _0807984C
	subs r3, #0x65
	ldr r1, _08079850 @ =0x03004AD0
	adds r0, r3, #0
	cmp r3, #0
	bge _08079836
	adds r0, r3, #7
_08079836:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08079854 @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r1, #0
	strb r0, [r2]
_0807984C:
	bx lr
	.align 2, 0
_08079850: .4byte 0x03004AD0
_08079854: .4byte 0x08C9EAEC

	thumb_func_start CheckChapterFlag
CheckChapterFlag: @ 0x08079858
	adds r3, r0, #0
	cmp r3, #0x64
	ble _08079882
	subs r3, #0x65
	ldr r1, _08079888 @ =0x03004AD0
	adds r0, r3, #0
	cmp r3, #0
	bge _0807986A
	adds r0, r3, #7
_0807986A:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _0807988C @ =0x08C9EAEC
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r2, [r2]
	ldrb r0, [r0]
	ands r2, r0
	adds r0, r2, #0
	cmp r0, #0
	bne _08079890
_08079882:
	movs r0, #0
	b _08079892
	.align 2, 0
_08079888: .4byte 0x03004AD0
_0807988C: .4byte 0x08C9EAEC
_08079890:
	movs r0, #1
_08079892:
	bx lr

	thumb_func_start ClearPermanentFlag
ClearPermanentFlag: @ 0x08079894
	adds r2, r0, #0
	cmp r2, #0x63
	ble _080798C6
	cmp r2, #0x64
	beq _080798C6
	subs r2, #0x65
	ldr r3, _080798C8 @ =0x08C9EAEC
	adds r1, r2, #0
	cmp r2, #0
	bge _080798AA
	adds r1, r2, #7
_080798AA:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080798CC @ =0x03004AD0
	adds r1, r1, r0
	adds r0, r3, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_080798C6:
	bx lr
	.align 2, 0
_080798C8: .4byte 0x08C9EAEC
_080798CC: .4byte 0x03004AD0

	thumb_func_start ClearPermanentFlags
ClearPermanentFlags: @ 0x080798D0
	ldr r1, _080798E0 @ =0x03004AD0
	movs r2, #0
	adds r0, r1, #7
_080798D6:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080798D6
	bx lr
	.align 2, 0
_080798E0: .4byte 0x03004AD0

	thumb_func_start SetFlag
SetFlag: @ 0x080798E4
	push {lr}
	cmp r0, #0x63
	bgt _080798F0
	bl SetChapterFlag
	b _080798F4
_080798F0:
	bl SetPermanentFlag
_080798F4:
	pop {r0}
	bx r0

	thumb_func_start GetFlag
GetFlag: @ 0x080798F8
	push {lr}
	cmp r0, #0x63
	ble _08079904
	bl CheckChapterFlag
	b _08079908
_08079904:
	bl CheckPermanentFlag
_08079908:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start ClearFlag
ClearFlag: @ 0x08079910
	push {lr}
	cmp r0, #0x63
	bgt _0807991C
	bl ClearChapterFlag
	b _08079920
_0807991C:
	bl ClearPermanentFlag
_08079920:
	pop {r0}
	bx r0

	thumb_func_start GetPermanentFlagBits
GetPermanentFlagBits: @ 0x08079924
	ldr r0, _08079928 @ =0x03004AD0
	bx lr
	.align 2, 0
_08079928: .4byte 0x03004AD0

	thumb_func_start sub_0807992C
sub_0807992C: @ 0x0807992C
	movs r0, #8
	bx lr

	thumb_func_start sub_08079930
sub_08079930: @ 0x08079930
	ldr r0, _08079934 @ =0x03004AD8
	bx lr
	.align 2, 0
_08079934: .4byte 0x03004AD8

	thumb_func_start sub_08079938
sub_08079938: @ 0x08079938
	movs r0, #6
	bx lr

	thumb_func_start sub_0807993C
sub_0807993C: @ 0x0807993C
	ldr r1, _0807994C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08079950
	movs r0, #0
	b _08079952
	.align 2, 0
_0807994C: .4byte 0x0202BBF8
_08079950:
	movs r0, #1
_08079952:
	bx lr

	thumb_func_start sub_08079954
sub_08079954: @ 0x08079954
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, _0807997C @ =0x08CA0448
	ldrb r0, [r1]
	cmp r0, #0
	beq _08079988
	ldr r0, [r2]
	ldrb r3, [r0, #4]
	movs r4, #0x80
	lsls r4, r4, #9
_08079968:
	ldrb r0, [r1, #1]
	cmp r3, r0
	bne _08079980
	ldr r0, [r2, #0xc]
	ands r0, r4
	cmp r0, #0
	beq _08079980
	movs r0, #1
	b _0807998A
	.align 2, 0
_0807997C: .4byte 0x08CA0448
_08079980:
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08079968
_08079988:
	movs r0, #0
_0807998A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08079990
sub_08079990: @ 0x08079990
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807999C @ =0x08C9F9EC
	b _080799AA
	.align 2, 0
_0807999C: .4byte 0x08C9F9EC
_080799A0:
	cmp r1, r0
	bne _080799A8
	ldr r0, [r2, #4]
	b _080799BE
_080799A8:
	adds r2, #8
_080799AA:
	ldrb r1, [r2]
	cmp r1, #0
	bne _080799A0
	ldr r0, _080799C4 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x14]
_080799BE:
	pop {r1}
	bx r1
	.align 2, 0
_080799C4: .4byte 0x0202BBF8

	thumb_func_start sub_080799C8
sub_080799C8: @ 0x080799C8
	push {r4, r5, lr}
	ldr r1, _08079A10 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079A08
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _08079A08
	movs r5, #0x81
_080799DE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079A02
	ldr r0, [r4]
	cmp r0, #0
	beq _08079A02
	ldrb r0, [r0, #4]
	bl sub_08079990
	adds r1, r0, #0
	cmp r1, #0
	beq _08079A02
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_08079A02:
	adds r5, #1
	cmp r5, #0xbf
	ble _080799DE
_08079A08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079A10: .4byte 0x0202BBF8

	thumb_func_start sub_08079A14
sub_08079A14: @ 0x08079A14
	ldr r1, _08079A1C @ =0x08CA0538
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	b _08079A2C
	.align 2, 0
_08079A1C: .4byte 0x08CA0538
_08079A20:
	ldrb r0, [r1]
	cmp r0, r2
	bne _08079A2A
	movs r0, #1
	b _08079A34
_08079A2A:
	adds r1, #1
_08079A2C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08079A20
	movs r0, #0
_08079A34:
	bx lr
	.align 2, 0

	thumb_func_start CallEndEvent
CallEndEvent: @ 0x08079A38
	push {lr}
	ldr r0, _08079A58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0x3c]
	bl sub_0800AF5C
	movs r0, #0x91
	bl SetFlag
	pop {r0}
	bx r0
	.align 2, 0
_08079A58: .4byte 0x0202BBF8

	thumb_func_start sub_08079A5C
sub_08079A5C: @ 0x08079A5C
	push {r4, lr}
	movs r4, #0
	ldr r1, _08079A8C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08079A84
	bl IsTutorialDisabled
	cmp r0, #0
	bne _08079A84
	movs r0, #0x9c
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
_08079A84:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079A8C: .4byte 0x0202BBF8

	thumb_func_start sub_08079A90
sub_08079A90: @ 0x08079A90
	push {lr}
	movs r0, #0x8f
	bl SetFlag
	pop {r0}
	bx r0

	thumb_func_start sub_08079A9C
sub_08079A9C: @ 0x08079A9C
	push {lr}
	movs r0, #0x8f
	bl GetFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079AAE
	movs r0, #0
	b _08079AB0
_08079AAE:
	movs r0, #1
_08079AB0:
	pop {r1}
	bx r1

	thumb_func_start sub_08079AB4
sub_08079AB4: @ 0x08079AB4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08079ABA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079AD8
	ldr r0, [r1]
	cmp r0, #0
	beq _08079AD8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079AD8
	adds r5, #1
_08079AD8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079ABA
	cmp r5, #3
	ble _08079AE6
	movs r0, #0
	b _08079AE8
_08079AE6:
	movs r0, #1
_08079AE8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08079AF0
sub_08079AF0: @ 0x08079AF0
	movs r0, #0
	bx lr

	thumb_func_start sub_08079AF4
sub_08079AF4: @ 0x08079AF4
	push {lr}
	bl EndPlayerPhaseSideWindows
	ldr r0, _08079B18 @ =0x0202BBF8
	movs r1, #2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _08079B06
	movs r1, #1
_08079B06:
	adds r0, r1, #0
	bl GetUnitByPid
	movs r1, #0
	bl sub_0802CC88
	pop {r0}
	bx r0
	.align 2, 0
_08079B18: .4byte 0x0202BBF8

	thumb_func_start sub_08079B1C
sub_08079B1C: @ 0x08079B1C
	push {r4, lr}
	movs r4, #1
_08079B20:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079B4E
	ldr r3, [r2]
	cmp r3, #0
	beq _08079B4E
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079B4E
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _08079B4E
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r0, #0x13
	ble _08079B54
	movs r0, #1
	b _08079B56
_08079B4E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079B20
_08079B54:
	movs r0, #0
_08079B56:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08079B5C
sub_08079B5C: @ 0x08079B5C
	push {r4, lr}
	bl sub_08079BAC
	movs r4, #1
_08079B64:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08079BA0
	ldr r3, [r2]
	cmp r3, #0
	beq _08079BA0
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08079BA0
	ldr r0, _08079B9C @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _08079BA0
	ldrb r3, [r3, #4]
	cmp r3, #0x28
	bne _08079BA0
	adds r0, r2, #0
	bl UnitLevelUp
	movs r0, #0x90
	bl SetFlag
	b _08079BA6
	.align 2, 0
_08079B9C: .4byte 0x0001000C
_08079BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079B64
_08079BA6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08079BAC
sub_08079BAC: @ 0x08079BAC
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08079BC6
_08079BB8:
	cmp r0, #0xc
	bne _08079BC4
	adds r0, r4, #0
	bl sub_0802C21C
	subs r4, #8
_08079BC4:
	adds r4, #8
_08079BC6:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08079BB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08079BD4
sub_08079BD4: @ 0x08079BD4
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_08079BE0
sub_08079BE0: @ 0x08079BE0
	ldr r0, _08079BF4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08079BF8
	movs r0, #1
	b _08079BFA
	.align 2, 0
_08079BF4: .4byte 0x08B857F8
_08079BF8:
	movs r0, #0
_08079BFA:
	bx lr

	thumb_func_start sub_08079BFC
sub_08079BFC: @ 0x08079BFC
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_08079C08
sub_08079C08: @ 0x08079C08
	ldr r0, _08079C1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08079C20
	movs r0, #0
	b _08079C22
	.align 2, 0
_08079C1C: .4byte 0x08B857F8
_08079C20:
	movs r0, #1
_08079C22:
	bx lr

	thumb_func_start sub_08079C24
sub_08079C24: @ 0x08079C24
	push {lr}
	movs r0, #0
	bl SetVisionWithFade
	pop {r0}
	bx r0

	thumb_func_start sub_08079C30
sub_08079C30: @ 0x08079C30
	push {lr}
	bl GetGold
	ldr r1, _08079C44 @ =0x00001388
	adds r0, r0, r1
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_08079C44: .4byte 0x00001388

	thumb_func_start sub_08079C48
sub_08079C48: @ 0x08079C48
	push {r4, lr}
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _08079C5E
	bl GetGold
	subs r0, r0, r4
	bl SetGold
_08079C5E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08079C64
sub_08079C64: @ 0x08079C64
	adds r1, r0, #0
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C74
	subs r0, r2, #1
	strb r0, [r1, #0x12]
_08079C74:
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C82
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_08079C82:
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C90
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_08079C90:
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079C9E
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_08079C9E:
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CAC
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_08079CAC:
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CBA
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_08079CBA:
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08079CC8
	subs r0, r2, #1
	strb r0, [r1, #0x19]
_08079CC8:
	bx lr
	.align 2, 0

	thumb_func_start sub_08079CCC
sub_08079CCC: @ 0x08079CCC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitByPid
	bl sub_08079C64
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IsPidBlueDeployed
IsPidBlueDeployed: @ 0x08079CE0
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079CE8:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079D10
	ldr r2, [r0]
	cmp r2, #0
	beq _08079D10
	ldr r0, [r0, #0xc]
	ldr r1, _08079D0C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08079D10
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _08079D10
	movs r0, #1
	b _08079D18
	.align 2, 0
_08079D0C: .4byte 0x0001000C
_08079D10:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079CE8
	movs r0, #0
_08079D18:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08079D20
sub_08079D20: @ 0x08079D20
	push {lr}
	movs r0, #9
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079D30
sub_08079D30: @ 0x08079D30
	push {lr}
	movs r0, #0x28
	bl IsPidBlueDeployed
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start IsPidBlue
IsPidBlue: @ 0x08079D40
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079D48:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079D6C
	ldr r2, [r0]
	cmp r2, #0
	beq _08079D6C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079D6C
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _08079D6C
	movs r0, #1
	b _08079D74
_08079D6C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079D48
	movs r0, #0
_08079D74:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08079D7C
sub_08079D7C: @ 0x08079D7C
	push {lr}
	movs r0, #0x1a
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079D8C
sub_08079D8C: @ 0x08079D8C
	push {lr}
	movs r0, #0xe
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079D9C
sub_08079D9C: @ 0x08079D9C
	push {lr}
	movs r0, #0x28
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DAC
sub_08079DAC: @ 0x08079DAC
	push {lr}
	movs r0, #0x25
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DBC
sub_08079DBC: @ 0x08079DBC
	push {lr}
	movs r0, #0x23
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DCC
sub_08079DCC: @ 0x08079DCC
	push {lr}
	movs r0, #0x14
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DDC
sub_08079DDC: @ 0x08079DDC
	push {lr}
	movs r0, #0x24
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DEC
sub_08079DEC: @ 0x08079DEC
	push {lr}
	movs r0, #0x1b
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079DFC
sub_08079DFC: @ 0x08079DFC
	push {lr}
	movs r0, #8
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E0C
sub_08079E0C: @ 0x08079E0C
	push {lr}
	movs r0, #0x11
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E1C
sub_08079E1C: @ 0x08079E1C
	push {lr}
	movs r0, #0x13
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E2C
sub_08079E2C: @ 0x08079E2C
	push {lr}
	movs r0, #0x1c
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E3C
sub_08079E3C: @ 0x08079E3C
	push {lr}
	movs r0, #0x17
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E4C
sub_08079E4C: @ 0x08079E4C
	push {lr}
	movs r0, #0x2f
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E5C
sub_08079E5C: @ 0x08079E5C
	push {lr}
	movs r0, #0x18
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E6C
sub_08079E6C: @ 0x08079E6C
	push {lr}
	movs r0, #0x30
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E7C
sub_08079E7C: @ 0x08079E7C
	push {lr}
	movs r0, #0xd
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E8C
sub_08079E8C: @ 0x08079E8C
	push {lr}
	movs r0, #0x2e
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079E9C
sub_08079E9C: @ 0x08079E9C
	push {lr}
	movs r0, #0x1d
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079EAC
sub_08079EAC: @ 0x08079EAC
	push {lr}
	movs r0, #0x31
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079EBC
sub_08079EBC: @ 0x08079EBC
	push {lr}
	movs r0, #0x33
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079ECC
sub_08079ECC: @ 0x08079ECC
	push {lr}
	movs r0, #0x15
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079EDC
sub_08079EDC: @ 0x08079EDC
	push {lr}
	movs r0, #0xf
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079EEC
sub_08079EEC: @ 0x08079EEC
	push {lr}
	movs r0, #0x36
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079EFC
sub_08079EFC: @ 0x08079EFC
	push {lr}
	movs r0, #0x22
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079F0C
sub_08079F0C: @ 0x08079F0C
	push {lr}
	movs r0, #0x27
	bl IsPidBlue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079F1C
sub_08079F1C: @ 0x08079F1C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08079F24:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08079F3E
	ldr r0, [r0]
	cmp r0, #0
	beq _08079F3E
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08079F3E
	movs r0, #1
	b _08079F46
_08079F3E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08079F24
	movs r0, #0
_08079F46:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08079F4C
sub_08079F4C: @ 0x08079F4C
	push {lr}
	movs r0, #0x11
	bl sub_08079F1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079F5C
sub_08079F5C: @ 0x08079F5C
	push {lr}
	movs r0, #0x13
	bl sub_08079F1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_08079F6C
sub_08079F6C: @ 0x08079F6C
	push {lr}
	movs r0, #0x1b
	bl sub_08079F1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start AreAnyEnemyUnitDead
AreAnyEnemyUnitDead: @ 0x08079F7C
	push {r4, lr}
	movs r4, #0x81
_08079F80:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079FA0
	ldr r0, [r1]
	cmp r0, #0
	beq _08079FA0
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079FA0
	movs r0, #1
	b _08079FA8
_08079FA0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079F80
	movs r0, #0
_08079FA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start GetDeadEnemyAmount
GetDeadEnemyAmount: @ 0x08079FB0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08079FB6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08079FD8
	ldr r0, [r1]
	cmp r0, #0
	beq _08079FD8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08079FD8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08079FD8:
	adds r4, #1
	cmp r4, #0xbf
	ble _08079FB6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08079FE8
sub_08079FE8: @ 0x08079FE8
	push {lr}
	bl AreAnyEnemyUnitDead
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08079FF8
	movs r1, #1
_08079FF8:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A000
sub_0807A000: @ 0x0807A000
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_0807A008:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A02C
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A02C
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A02C
	ldrb r2, [r2, #4]
	cmp r2, r5
	bne _0807A02C
	movs r0, #1
	b _0807A034
_0807A02C:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A008
	movs r0, #0
_0807A034:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A03C
sub_0807A03C: @ 0x0807A03C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0807A042:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A068
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A068
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807A068
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _0807A068
	adds r5, #1
_0807A068:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A042
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A078
sub_0807A078: @ 0x0807A078
	push {r4, lr}
	movs r4, #0x41
_0807A07C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A09C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A09C
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A09C
	movs r0, #0
	b _0807A0A4
_0807A09C:
	adds r4, #1
	cmp r4, #0x7f
	ble _0807A07C
	movs r0, #1
_0807A0A4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A0AC
sub_0807A0AC: @ 0x0807A0AC
	push {lr}
	movs r0, #0x45
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A0BC
sub_0807A0BC: @ 0x0807A0BC
	push {lr}
	movs r0, #0x3b
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A0CC
sub_0807A0CC: @ 0x0807A0CC
	push {lr}
	movs r0, #0x7f
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A0DC
sub_0807A0DC: @ 0x0807A0DC
	push {lr}
	movs r0, #0x80
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A0EC
sub_0807A0EC: @ 0x0807A0EC
	push {lr}
	movs r0, #0x81
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A0FC
sub_0807A0FC: @ 0x0807A0FC
	push {lr}
	movs r0, #0x82
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A10C
sub_0807A10C: @ 0x0807A10C
	push {lr}
	movs r0, #0x24
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A11C
sub_0807A11C: @ 0x0807A11C
	push {lr}
	movs r0, #0x20
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A12C
sub_0807A12C: @ 0x0807A12C
	push {lr}
	movs r0, #0x2b
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A13C
sub_0807A13C: @ 0x0807A13C
	push {lr}
	movs r0, #0x37
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A14C
sub_0807A14C: @ 0x0807A14C
	push {lr}
	movs r0, #0x11
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A15C
sub_0807A15C: @ 0x0807A15C
	push {lr}
	movs r0, #0x13
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A16C
sub_0807A16C: @ 0x0807A16C
	push {lr}
	movs r0, #8
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A17C
sub_0807A17C: @ 0x0807A17C
	push {lr}
	movs r0, #0x4c
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A18C
sub_0807A18C: @ 0x0807A18C
	push {lr}
	movs r0, #0x65
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A19C
sub_0807A19C: @ 0x0807A19C
	push {lr}
	movs r0, #0x66
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A1AC
sub_0807A1AC: @ 0x0807A1AC
	push {lr}
	movs r0, #0xa3
	bl sub_0807A000
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start sub_0807A1BC
sub_0807A1BC: @ 0x0807A1BC
	push {lr}
	movs r0, #1
	movs r1, #0x2d
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A1D0
sub_0807A1D0: @ 0x0807A1D0
	push {lr}
	movs r0, #1
	movs r1, #0x25
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A1E4
sub_0807A1E4: @ 0x0807A1E4
	push {lr}
	movs r0, #1
	movs r1, #0x1e
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A1F8
sub_0807A1F8: @ 0x0807A1F8
	push {lr}
	movs r0, #2
	movs r1, #0x2d
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A20C
sub_0807A20C: @ 0x0807A20C
	push {lr}
	movs r0, #2
	movs r1, #0x31
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A220
sub_0807A220: @ 0x0807A220
	push {lr}
	movs r0, #2
	movs r1, #0x1f
	bl ArePidsAtMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A234
sub_0807A234: @ 0x0807A234
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _0807A266
_0807A242:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A264
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A264
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A264
	ldrb r2, [r2, #4]
	cmp r2, r7
	bne _0807A264
	adds r6, #1
_0807A264:
	adds r4, #1
_0807A266:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _0807A242
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A278
sub_0807A278: @ 0x0807A278
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _0807A2A4
_0807A282:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A2A0
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A2A0
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A2A0
	adds r6, #1
_0807A2A0:
	adds r4, #1
	adds r0, r5, #0
_0807A2A4:
	adds r0, #0x40
	cmp r4, r0
	blt _0807A282
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0807A2B4
sub_0807A2B4: @ 0x0807A2B4
	movs r1, #0
	ldr r0, _0807A2C4 @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x14
	bls _0807A2C0
	movs r1, #1
_0807A2C0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2C4: .4byte 0x0202BBF8

	thumb_func_start sub_0807A2C8
sub_0807A2C8: @ 0x0807A2C8
	movs r1, #0
	ldr r0, _0807A2D8 @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x19
	bls _0807A2D4
	movs r1, #1
_0807A2D4:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2D8: .4byte 0x0202BBF8

	thumb_func_start sub_0807A2DC
sub_0807A2DC: @ 0x0807A2DC
	movs r1, #0
	ldr r0, _0807A2EC @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x1e
	bls _0807A2E8
	movs r1, #1
_0807A2E8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2EC: .4byte 0x0202BBF8

	thumb_func_start sub_0807A2F0
sub_0807A2F0: @ 0x0807A2F0
	movs r1, #0
	ldr r0, _0807A300 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807A2FC
	movs r1, #1
_0807A2FC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A300: .4byte 0x0202BBF8

	thumb_func_start sub_0807A304
sub_0807A304: @ 0x0807A304
	movs r1, #0
	ldr r0, _0807A314 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0807A310
	movs r1, #1
_0807A310:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A314: .4byte 0x0202BBF8

	thumb_func_start sub_0807A318
sub_0807A318: @ 0x0807A318
	ldr r0, _0807A330 @ =0x03004690
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	lsrs r1, r1, #0xe
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_0807A330: .4byte 0x03004690

	thumb_func_start sub_0807A334
sub_0807A334: @ 0x0807A334
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A34C @ =0x0000270F
	cmp r0, r1
	ble _0807A344
	movs r2, #1
_0807A344:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A34C: .4byte 0x0000270F

	thumb_func_start sub_0807A350
sub_0807A350: @ 0x0807A350
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A368 @ =0x00001F3F
	cmp r0, r1
	ble _0807A360
	movs r2, #1
_0807A360:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A368: .4byte 0x00001F3F

	thumb_func_start sub_0807A36C
sub_0807A36C: @ 0x0807A36C
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A384 @ =0x0000176F
	cmp r0, r1
	ble _0807A37C
	movs r2, #1
_0807A37C:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A384: .4byte 0x0000176F

	thumb_func_start sub_0807A388
sub_0807A388: @ 0x0807A388
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A3A0 @ =0x00001387
	cmp r0, r1
	ble _0807A398
	movs r2, #1
_0807A398:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A3A0: .4byte 0x00001387

	thumb_func_start sub_0807A3A4
sub_0807A3A4: @ 0x0807A3A4
	push {lr}
	bl GetTalkResult
	movs r1, #0
	cmp r0, #1
	bne _0807A3B2
	movs r1, #1
_0807A3B2:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0807A3B8
sub_0807A3B8: @ 0x0807A3B8
	ldr r0, _0807A3C4 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3C4: .4byte 0x0202BBF8

	thumb_func_start IsTactFemale
IsTactFemale: @ 0x0807A3C8
	ldr r0, _0807A3D4 @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3D4: .4byte 0x0202BBF8

	thumb_func_start sub_0807A3D8
sub_0807A3D8: @ 0x0807A3D8
	push {lr}
	movs r0, #0x9b
	bl GetFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	thumb_func_start IsTutorialDisabled
IsTutorialDisabled: @ 0x0807A3E8
	ldr r0, _0807A3F4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3F4: .4byte 0x0202BBF8

	thumb_func_start GmUnitFadeExists
GmUnitFadeExists: @ 0x0807A3F8
	push {lr}
	bl CheckLinkedToFE6
	cmp r0, #0
	beq _0807A404
	movs r0, #1
_0807A404:
	pop {r1}
	bx r1

	thumb_func_start sub_0807A408
sub_0807A408: @ 0x0807A408
	push {lr}
	bl GetDeadEnemyAmount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0807A41A
	movs r0, #0
	b _0807A41C
_0807A41A:
	movs r0, #1
_0807A41C:
	pop {r1}
	bx r1

	thumb_func_start sub_0807A420
sub_0807A420: @ 0x0807A420
	movs r1, #0
	ldr r0, _0807A430 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807A42C
	movs r1, #1
_0807A42C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A430: .4byte 0x0202BBF8

	thumb_func_start sub_0807A434
sub_0807A434: @ 0x0807A434
	push {lr}
	ldr r0, _0807A44C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _0807A446
	movs r1, #1
_0807A446:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A44C: .4byte 0x03004690

	thumb_func_start sub_0807A450
sub_0807A450: @ 0x0807A450
	movs r0, #0
	bx lr

	thumb_func_start sub_0807A454
sub_0807A454: @ 0x0807A454
	push {lr}
	ldr r1, _0807A478 @ =0x0202BBF8
	movs r0, #8
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0807A46E
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0807A474
_0807A46E:
	movs r0, #4
	bl FadeBgmOut
_0807A474:
	pop {r0}
	bx r0
	.align 2, 0
_0807A478: .4byte 0x0202BBF8

	thumb_func_start sub_0807A47C
sub_0807A47C: @ 0x0807A47C
	ldr r0, _0807A494 @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A498
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807A498
	movs r0, #0
	b _0807A49A
	.align 2, 0
_0807A494: .4byte 0x0202BBF8
_0807A498:
	movs r0, #1
_0807A49A:
	bx lr

	thumb_func_start sub_0807A49C
sub_0807A49C: @ 0x0807A49C
	movs r1, #0
	ldr r0, _0807A4AC @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bne _0807A4A8
	movs r1, #1
_0807A4A8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A4AC: .4byte 0x0203A85C

	thumb_func_start sub_0807A4B0
sub_0807A4B0: @ 0x0807A4B0
	push {lr}
	movs r0, #0
	bl SetkeyStIgnoredMask
	pop {r0}
	bx r0

	thumb_func_start sub_0807A4BC
sub_0807A4BC: @ 0x0807A4BC
	push {lr}
	movs r0, #2
	bl NewKeyStSetter
	pop {r0}
	bx r0

	thumb_func_start sub_0807A4C8
sub_0807A4C8: @ 0x0807A4C8
	push {lr}
	ldr r0, _0807A4D8 @ =0x08CA74F0
	movs r1, #4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_0807A4D8: .4byte 0x08CA74F0

	thumb_func_start ShinningEventCursor
ShinningEventCursor: @ 0x0807A4DC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807A520 @ =0x0841E3B8
	ldr r4, _0807A524 @ =0x02022AA0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0807A528 @ =0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	bl EnablePalSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A520: .4byte 0x0841E3B8
_0807A524: .4byte 0x02022AA0
_0807A528: .4byte 0xFFFFFDC0

	thumb_func_start sub_0807A52C
sub_0807A52C: @ 0x0807A52C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r0, _0807A550 @ =0x08CA7554
	bl Proc_EndEach
	ldr r0, _0807A554 @ =0x0841E3B8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0807A550: .4byte 0x08CA7554
_0807A554: .4byte 0x0841E3B8

	thumb_func_start sub_0807A558
sub_0807A558: @ 0x0807A558
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r1, [r0, #0x54]
	cmp r1, #0
	bne _0807A5D0
	movs r5, #0
	ldr r0, _0807A5BC @ =0x0203E66C
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807A662
	ldr r6, _0807A5C0 @ =0x0202BBB8
_0807A574:
	adds r0, r5, #0
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	movs r3, #0xc
	ldrsh r2, [r6, r3]
	subs r4, r1, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807A5C4 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A5C8 @ =0x08CA7518
	ldr r3, _0807A5CC @ =0x00002822
	bl PutOamHiRam
	adds r5, #1
	ldr r0, _0807A5BC @ =0x0203E66C
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807A574
	b _0807A662
	.align 2, 0
_0807A5BC: .4byte 0x0203E66C
_0807A5C0: .4byte 0x0202BBB8
_0807A5C4: .4byte 0x000001FF
_0807A5C8: .4byte 0x08CA7518
_0807A5CC: .4byte 0x00002822
_0807A5D0:
	cmp r1, #1
	bne _0807A620
	ldr r0, _0807A610 @ =0x03004690
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _0807A614 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r4, r0, r1
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, r1
	subs r1, #1
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A618 @ =0x08CA7518
	ldr r3, _0807A61C @ =0x00002822
	bl PutOamHiRam
	b _0807A662
	.align 2, 0
_0807A610: .4byte 0x03004690
_0807A614: .4byte 0x0202BBB8
_0807A618: .4byte 0x08CA7518
_0807A61C: .4byte 0x00002822
_0807A620:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0807A662
	ldr r6, _0807A6A4 @ =0x0202BBB8
	adds r5, r1, #0
_0807A62A:
	ldrb r4, [r5]
	lsls r1, r4, #4
	movs r2, #0xc
	ldrsh r0, [r6, r2]
	subs r4, r1, r0
	ldrb r3, [r5, #1]
	lsls r1, r3, #4
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r2, r1, r0
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _0807A6A8 @ =0x000001FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807A6AC @ =0x08CA7518
	ldr r3, _0807A6B0 @ =0x00002822
	bl PutOamHiRam
	adds r5, #4
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807A62A
_0807A662:
	bl GetGameTime
	adds r5, r0, #0
	movs r0, #1
	mov sb, r0
	ands r5, r0
	cmp r5, #0
	bne _0807A6D8
	mov r6, r8
	adds r6, #0x66
	movs r1, #0
	ldrsh r7, [r6, r1]
	cmp r7, #0
	beq _0807A6B4
	mov r4, r8
	adds r4, #0x64
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r0, #0x10
	movs r1, #0
	bl ShinningEventCursor
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807A6D8
	strh r5, [r4]
	strh r5, [r6]
	b _0807A6D8
	.align 2, 0
_0807A6A4: .4byte 0x0202BBB8
_0807A6A8: .4byte 0x000001FF
_0807A6AC: .4byte 0x08CA7518
_0807A6B0: .4byte 0x00002822
_0807A6B4:
	mov r4, r8
	adds r4, #0x64
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #0
	movs r1, #0x10
	bl ShinningEventCursor
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807A6D8
	strh r7, [r4]
	mov r1, sb
	strh r1, [r6]
_0807A6D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartTutorialCursors
StartTutorialCursors: @ 0x0807A6E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0807A734 @ =0x03004690
	ldr r0, [r6]
	bl sub_080314AC
	ldr r4, _0807A738 @ =0x0203E66C
	bl CountTargets
	strb r0, [r4]
	cmp r5, #0
	bne _0807A740
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A75A
	ldr r0, _0807A73C @ =0x08CA7534
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x54]
	movs r0, #0
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl CameraMoveWatchPosition
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _0807A75A
	.align 2, 0
_0807A734: .4byte 0x03004690
_0807A738: .4byte 0x0203E66C
_0807A73C: .4byte 0x08CA7534
_0807A740:
	ldr r0, _0807A760 @ =0x08CA7534
	movs r1, #3
	bl SpawnProc
	str r5, [r0, #0x54]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
_0807A75A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A760: .4byte 0x08CA7534

	thumb_func_start sub_0807A764
sub_0807A764: @ 0x0807A764
	adds r0, #0x64
	movs r1, #0xf
	strh r1, [r0]
	bx lr

	thumb_func_start sub_0807A76C
sub_0807A76C: @ 0x0807A76C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0807A79A
	bl BoxTalkActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A7A6
	ldr r0, _0807A7AC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0807A7A6
_0807A79A:
	ldr r0, _0807A7B0 @ =0x08CA7534
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_0807A7A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7AC: .4byte 0x08B857F8
_0807A7B0: .4byte 0x08CA7534

	thumb_func_start sub_0807A7B4
sub_0807A7B4: @ 0x0807A7B4
	push {r4, lr}
	bl BoxTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0807A7CA
	ldr r0, _0807A7D4 @ =0x08CA7554
	movs r1, #3
	bl SpawnProc
_0807A7CA:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A7D4: .4byte 0x08CA7554

	thumb_func_start HideAllAlliesExceptLeader
HideAllAlliesExceptLeader: @ 0x0807A7D8
	push {r4, r5, r6, r7, lr}
	bl GetLeaderPid
	bl GetUnitByPid
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0807A7EE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A824
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A824
	cmp r2, r5
	beq _0807A824
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _0807A824
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _0807A824
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0807A824
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807A824:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A7EE
	bl RefreshUnitSprites
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HideAllUnits
HideAllUnits: @ 0x0807A834
	push {r4, lr}
	movs r4, #1
_0807A838:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0807A85A
	ldr r0, [r2]
	cmp r0, #0
	beq _0807A85A
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A85A
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0807A85A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807A838
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807A868
sub_0807A868: @ 0x0807A868
	push {r4, lr}
	movs r4, #0x41
_0807A86C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A884
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A884
	adds r0, r1, #0
	bl ClearUnit
_0807A884:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A86C
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807A890
sub_0807A890: @ 0x0807A890
	push {r4, lr}
	movs r4, #0x81
_0807A894:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A8AC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A8AC
	adds r0, r1, #0
	bl ClearUnit
_0807A8AC:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A894
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807A8B8
sub_0807A8B8: @ 0x0807A8B8
	push {r4, r5, r6, lr}
	movs r4, #0x41
_0807A8BC:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807A8D4
	ldr r0, [r1]
	cmp r0, #0
	beq _0807A8D4
	adds r0, r1, #0
	bl ClearUnit
_0807A8D4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807A8BC
	movs r5, #1
	movs r6, #0
_0807A8DE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807A91E
	ldr r0, [r4]
	cmp r0, #0
	beq _0807A91E
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _0807A934 @ =0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_0807A91E:
	adds r5, #1
	cmp r5, #0x3f
	ble _0807A8DE
	bl RefreshEntityMaps
	bl EndAllMus
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A934: .4byte 0x0671E00C

	thumb_func_start sub_0807A938
sub_0807A938: @ 0x0807A938
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807A956
	bl LockBmDisplay
	bl LockMus
	movs r0, #0
	strb r0, [r4]
_0807A956:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0807A95C
sub_0807A95C: @ 0x0807A95C
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807A982
	movs r0, #0xff
	strb r0, [r2]
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807A986
_0807A982:
	bl RefreshBMapGraphics
_0807A986:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807A98C
sub_0807A98C: @ 0x0807A98C
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807A9B2
	movs r0, #0xff
	strb r0, [r2]
	bl InitMoreBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807A9B6
_0807A9B2:
	bl InitMoreBMapGraphics
_0807A9B6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807A9BC
sub_0807A9BC: @ 0x0807A9BC
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryLockProc
	pop {r0}
	bx r0

	thumb_func_start sub_0807A9C8
sub_0807A9C8: @ 0x0807A9C8
	push {lr}
	ldr r0, [r0, #0x14]
	bl TryUnlockProc
	pop {r0}
	bx r0

	thumb_func_start sub_0807A9D4
sub_0807A9D4: @ 0x0807A9D4
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r2, _0807AA00 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0807AA00: .4byte 0x03002870

	thumb_func_start sub_0807AA04
sub_0807AA04: @ 0x0807AA04
	push {r4, lr}
	movs r0, #0x26
	bl GetUnitByPid
	adds r4, r0, #0
	movs r0, #0x25
	bl GetUnitByPid
	adds r1, r0, #0
	adds r0, r4, #0
	bl SwapUnitStats
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807AA24
sub_0807AA24: @ 0x0807AA24
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl StartScreenFlashing
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807AA4C
sub_0807AA4C: @ 0x0807AA4C
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl StartScreenFlashing
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start sub_0807AA74
sub_0807AA74: @ 0x0807AA74
	adds r0, #0x4d
	movs r3, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807AAB8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0807AABC @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	movs r1, #0x1f
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r3, [r2]
	orrs r0, r3
	strb r0, [r2]
	bx lr
	.align 2, 0
_0807AAB8: .4byte 0x03002870
_0807AABC: .4byte 0x0000FFE0

	thumb_func_start sub_0807AAC0
sub_0807AAC0: @ 0x0807AAC0
	ldr r2, _0807AAE0 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0807AAE0: .4byte 0x03002870

	thumb_func_start sub_0807AAE4
sub_0807AAE4: @ 0x0807AAE4
	ldr r2, _0807AB00 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0807AB00: .4byte 0x03002870

	thumb_func_start sub_0807AB04
sub_0807AB04: @ 0x0807AB04
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807AB34
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807AB56
	ldr r1, _0807AB30 @ =0x0202BBB8
	movs r0, #2
	ldrh r2, [r1, #0xc]
	eors r0, r2
	strh r0, [r1, #0xc]
	b _0807AB56
	.align 2, 0
_0807AB30: .4byte 0x0202BBB8
_0807AB34:
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807AB56
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
_0807AB56:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807AB5C
sub_0807AB5C: @ 0x0807AB5C
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807AB94
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807ABB8
	ldr r0, _0807AB8C @ =0x0202BBB8
	ldr r1, _0807AB90 @ =0x0000FFFD
	ldrh r2, [r0, #0xc]
	ands r1, r2
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0xc]
	b _0807ABB8
	.align 2, 0
_0807AB8C: .4byte 0x0202BBB8
_0807AB90: .4byte 0x0000FFFD
_0807AB94:
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807ABB8
	movs r0, #3
	bl GetBgXOffset
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
_0807ABB8:
	pop {r0}
	bx r0

	thumb_func_start sub_0807ABBC
sub_0807ABBC: @ 0x0807ABBC
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0x61
	bne _0807ABE8
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807AC02
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #1
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	b _0807AC02
_0807ABE8:
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807AC02
	ldr r0, _0807AC08 @ =0x0202BBB8
	ldr r1, _0807AC0C @ =0x0000FFFD
	ldrh r2, [r0, #0xe]
	ands r1, r2
	movs r2, #1
	eors r1, r2
	strh r1, [r0, #0xe]
_0807AC02:
	pop {r0}
	bx r0
	.align 2, 0
_0807AC08: .4byte 0x0202BBB8
_0807AC0C: .4byte 0x0000FFFD

	thumb_func_start StartEventVeriticalQuakefx
StartEventVeriticalQuakefx: @ 0x0807AC10
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807AC48 @ =0x08CA759C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807AC28
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_0807AC28:
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0807AC4C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807AC40
	ldr r0, _0807AC50 @ =0x0000026A
	bl m4aSongNumStart
_0807AC40:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC48: .4byte 0x08CA759C
_0807AC4C: .4byte 0x0202BBF8
_0807AC50: .4byte 0x0000026A

	thumb_func_start StartEventHorizontalQuakefxViolently
StartEventHorizontalQuakefxViolently: @ 0x0807AC54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807AC8C @ =0x08CA756C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807AC7E
	ldr r0, _0807AC90 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807AC76
	ldr r0, _0807AC94 @ =0x0000026A
	bl m4aSongNumStart
_0807AC76:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_0807AC7E:
	movs r1, #0
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC8C: .4byte 0x08CA756C
_0807AC90: .4byte 0x0202BBF8
_0807AC94: .4byte 0x0000026A

	thumb_func_start StartEventHorizontalQuakefxSlightly
StartEventHorizontalQuakefxSlightly: @ 0x0807AC98
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807ACD0 @ =0x08CA756C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0807ACC2
	ldr r0, _0807ACD4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807ACBA
	ldr r0, _0807ACD8 @ =0x0000026A
	bl m4aSongNumStart
_0807ACBA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpawnProc
_0807ACC2:
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACD0: .4byte 0x08CA756C
_0807ACD4: .4byte 0x0202BBF8
_0807ACD8: .4byte 0x0000026A

