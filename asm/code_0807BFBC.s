	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_ParallelWorker
QuintessenceFx_ParallelWorker: @ 0x0807BFBC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x3c
	str r6, [sp, #4]
	movs r5, #0x10
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #2
	movs r3, #4
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start QuintFxBg2_Init
QuintFxBg2_Init: @ 0x0807C020
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr
	.align 2, 0

	thumb_func_start QuintFxBg2_Loop
QuintFxBg2_Loop: @ 0x0807C028
	push {lr}
	ldr r2, [r0, #0x58]
	adds r2, #1
	str r2, [r0, #0x58]
	lsls r1, r2, #0xe
	lsrs r1, r1, #0x10
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start QuintessenceFx_Init_Main
QuintessenceFx_Init_Main: @ 0x0807C044
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807C0E0 @ =0x03002870
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
	ldr r0, _0807C0E4 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _0807C0E8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0807C0EC @ =0x081B98C8
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0807C0F0 @ =0x083FF780
	ldr r1, _0807C0F4 @ =0x06004000
	bl Decompress
	ldr r0, _0807C0F8 @ =0x02023C60
	ldr r1, _0807C0FC @ =0x081B98E8
	movs r2, #0xa4
	lsls r2, r2, #7
	bl sub_080AACD8
	movs r0, #0xc
	bl EnableBgSync
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	str r4, [r5, #0x58]
	bl InitScanlineEffect
	ldr r0, _0807C100 @ =QuintessenceFx_OnHBlank
	bl SetOnHBlankA
	ldr r0, _0807C104 @ =QuintessenceFx_ParallelWorker
	adds r1, r5, #0
	bl StartParallelWorker
	ldr r0, _0807C108 @ =0x08CA7794
	movs r1, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C0E0: .4byte 0x03002870
_0807C0E4: .4byte 0x0000FFE0
_0807C0E8: .4byte 0x0000E0FF
_0807C0EC: .4byte 0x081B98C8
_0807C0F0: .4byte 0x083FF780
_0807C0F4: .4byte 0x06004000
_0807C0F8: .4byte 0x02023C60
_0807C0FC: .4byte 0x081B98E8
_0807C100: .4byte QuintessenceFx_OnHBlank
_0807C104: .4byte QuintessenceFx_ParallelWorker
_0807C108: .4byte 0x08CA7794

	thumb_func_start sub_0807C10C
sub_0807C10C: @ 0x0807C10C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	ldr r0, _0807C158 @ =0x03002870
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
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _0807C152
	adds r0, r4, #0
	bl Proc_Break
_0807C152:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C158: .4byte 0x03002870

	thumb_func_start QuintessenceFx_ResetBlend
QuintessenceFx_ResetBlend: @ 0x0807C15C
	push {r4, lr}
	ldr r1, _0807C1AC @ =0x03002870
	mov ip, r1
	mov r3, ip
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	mov r2, ip
	adds r2, #0x44
	movs r3, #0
	movs r1, #0x10
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x45
	strb r3, [r1]
	adds r1, #1
	strb r3, [r1]
	ldr r1, _0807C1B0 @ =0x0000FFE0
	mov r4, ip
	ldrh r4, [r4, #0x3c]
	ands r1, r4
	movs r2, #4
	orrs r1, r2
	ldr r2, _0807C1B4 @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xc0
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	mov r2, ip
	strh r1, [r2, #0x3c]
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C1AC: .4byte 0x03002870
_0807C1B0: .4byte 0x0000FFE0
_0807C1B4: .4byte 0x0000E0FF

	thumb_func_start QuintessenceFx_Loop_B
QuintessenceFx_Loop_B: @ 0x0807C1B8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807C204 @ =0x03002870
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
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0xa
	bne _0807C1FE
	adds r0, r4, #0
	bl Proc_Break
_0807C1FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C204: .4byte 0x03002870

	thumb_func_start QuintessenceFx_Loop_C
QuintessenceFx_Loop_C: @ 0x0807C208
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x12
	ldr r0, _0807C254 @ =0x03002870
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
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0807C24E
	adds r0, r4, #0
	bl Proc_Break
_0807C24E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C254: .4byte 0x03002870

	thumb_func_start QuintessenceFx_OnEnd
QuintessenceFx_OnEnd: @ 0x0807C258
	push {lr}
	ldr r0, _0807C2B4 @ =0x08CA7794
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	bl SetOnHBlankA
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0807C2B8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0807C2BC @ =0x03002870
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
	pop {r0}
	bx r0
	.align 2, 0
_0807C2B4: .4byte 0x08CA7794
_0807C2B8: .4byte 0x02023C60
_0807C2BC: .4byte 0x03002870

	thumb_func_start sub_0807C2C0
sub_0807C2C0: @ 0x0807C2C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807C2D0 @ =0x08CA77AC
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C2D0: .4byte 0x08CA77AC

	thumb_func_start sub_0807C2D4
sub_0807C2D4: @ 0x0807C2D4
	push {lr}
	ldr r0, _0807C2E8 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C2E8: .4byte 0x08CA77AC

	thumb_func_start QuintessenceFx_Goto_C
QuintessenceFx_Goto_C: @ 0x0807C2EC
	push {lr}
	ldr r0, _0807C300 @ =0x08CA77AC
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0807C300: .4byte 0x08CA77AC

	thumb_func_start sub_0807C304
sub_0807C304: @ 0x0807C304
	push {lr}
	ldr r0, _0807C314 @ =0x08CA77AC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0807C314: .4byte 0x08CA77AC
