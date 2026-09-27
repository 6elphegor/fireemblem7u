	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7810
sub_080B7810: @ 0x080B7810
	push {r4, r5, r6, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r0, #0x44
	movs r4, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #6
	strh r1, [r0]
	strh r1, [r5, #0x3e]
	ldr r0, _080B78C0 @ =0x08194714
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080B78C4 @ =sub_080B6C14
	bl SetOnHBlankA
	ldr r2, _080B78C8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _080B78CC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _080B78D0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl sub_080B6E28
	ldr r0, _080B78D4 @ =sub_080B7408
	adds r1, r5, #0
	bl StartParallelWorker
	adds r6, r5, #0
	adds r6, #0x51
	strb r4, [r6]
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B78A6
	mov r1, sp
	movs r0, #3
	ldrb r1, [r1, #0xe]
	ands r0, r1
	cmp r0, #0
	beq _080B78A6
	movs r0, #1
	strb r0, [r6]
_080B78A6:
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080B78D8 @ =sub_080B77DC
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #0x64
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B78C0: .4byte 0x08194714
_080B78C4: .4byte sub_080B6C14
_080B78C8: .4byte 0x03002870
_080B78CC: .4byte 0x0000FFE0
_080B78D0: .4byte 0x0000E0FF
_080B78D4: .4byte sub_080B7408
_080B78D8: .4byte sub_080B77DC
