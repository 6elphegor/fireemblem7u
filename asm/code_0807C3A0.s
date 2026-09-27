	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C3A0
sub_0807C3A0: @ 0x0807C3A0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #8
	strh r0, [r4]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgYOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	movs r0, #0x50
	mov r8, r0
	str r0, [sp, #4]
	movs r6, #1
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	adds r5, r0, #0
	movs r0, #0
	bl GetBgXOffset
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r4, r2]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0807C41C
sub_0807C41C: @ 0x0807C41C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807C4F4 @ =0x083FC91C
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0807C4F8 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0807C4FC @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _0807C500 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C504 @ =0x081A68FC
	ldr r1, _0807C508 @ =0x06000800
	bl Decompress
	ldr r0, _0807C50C @ =0x081A71C8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807C510 @ =0x02022C60
	ldr r1, [r5, #0x58]
	lsls r1, r1, #2
	add r1, sp
	ldr r1, [r1]
	ldr r2, _0807C514 @ =0x00005040
	bl sub_080AACD8
	ldr r1, [r5, #0x2c]
	rsbs r1, r1, #0
	movs r0, #0xff
	ands r1, r0
	ldr r2, [r5, #0x30]
	rsbs r2, r2, #0
	ands r2, r0
	movs r0, #0
	bl SetBgOffset
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	bl InitScanlineEffect
	ldr r0, _0807C518 @ =sub_08077ADC
	bl SetOnHBlankA
	ldr r0, _0807C51C @ =sub_0807C3A0
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C4F4: .4byte 0x083FC91C
_0807C4F8: .4byte 0x03002870
_0807C4FC: .4byte 0x0000FFE0
_0807C500: .4byte 0x0000E0FF
_0807C504: .4byte 0x081A68FC
_0807C508: .4byte 0x06000800
_0807C50C: .4byte 0x081A71C8
_0807C510: .4byte 0x02022C60
_0807C514: .4byte 0x00005040
_0807C518: .4byte sub_08077ADC
_0807C51C: .4byte sub_0807C3A0

	thumb_func_start sub_0807C520
sub_0807C520: @ 0x0807C520
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r2, [r4]
	adds r0, r2, #1
	strh r0, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0xf
	ldr r0, _0807C574 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r3, #0
	strb r2, [r0]
	asrs r1, r2, #1
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C56C
	strh r3, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807C56C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C574: .4byte 0x03002870

	thumb_func_start sub_0807C578
sub_0807C578: @ 0x0807C578
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #2
	strh r1, [r0]
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C590
	adds r0, #0xf
_0807C590:
	asrs r0, r0, #4
	lsls r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bgt _0807C5B6
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5A6
	adds r0, r1, #7
_0807C5A6:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x10
	subs r4, r1, r0
	b _0807C5CC
_0807C5B6:
	adds r0, r1, #0
	cmp r1, #0
	bge _0807C5BE
	adds r0, r1, #7
_0807C5BE:
	asrs r0, r0, #3
	lsls r0, r0, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r0, #0
	adds r4, #8
_0807C5CC:
	ldr r3, _0807C610 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	asrs r1, r4, #1
	movs r0, #0x10
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	cmp r1, #0x10
	bne _0807C60A
	strh r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0807C60A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C610: .4byte 0x03002870

	thumb_func_start sub_0807C614
sub_0807C614: @ 0x0807C614
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	asrs r4, r2, #0x10
	ldr r0, _0807C668 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r4
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	asrs r2, r2, #0x11
	adds r2, #8
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r4, #0x10
	bne _0807C662
	adds r0, r5, #0
	bl Proc_Break
_0807C662:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C668: .4byte 0x03002870

	thumb_func_start sub_0807C66C
sub_0807C66C: @ 0x0807C66C
	push {lr}
	ldr r0, _0807C6A4 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	bl SetOnHBlankA
	ldr r2, _0807C6A8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C6A4: .4byte 0x02022C60
_0807C6A8: .4byte 0x03002870
