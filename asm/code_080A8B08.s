	.include "macro.inc"

	.syntax unified

	thumb_func_start UiSpinningArrows_Init
UiSpinningArrows_Init: @ 0x080A8B08
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x54
	strh r1, [r2]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x50]
	str r1, [r0, #0x48]
	str r1, [r0, #0x40]
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start sub_080A8B28
sub_080A8B28: @ 0x080A8B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080A8B52:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080A8B72
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080A8B72:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080A8B80
	movs r0, #0
	str r0, [r1]
_080A8B80:
	adds r6, #1
	cmp r6, #1
	ble _080A8B52
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080A8C14
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8BA0
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080A8BA0
	str r3, [r5, #0x4c]
_080A8BA0:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8BB8
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080A8BB8
	movs r0, #0
	str r0, [r5, #0x50]
_080A8BB8:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8BE2
	ldr r1, _080A8CC8 @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A8BE2:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8C14
	ldr r1, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A8C14:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080A8CB6
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8C32
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080A8C32
	movs r0, #0
	str r0, [r5, #0x4c]
_080A8C32:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8C4A
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080A8C4A
	movs r0, #0
	str r0, [r5, #0x50]
_080A8C4A:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8C7C
	ldr r0, _080A8CC8 @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080A8C7C:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8CB6
	ldr r0, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080A8CB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CC8: .4byte 0x000001FF
_080A8CCC: .4byte 0x08CE4A28
_080A8CD0: .4byte 0x08CE4A36

	thumb_func_start StartUiSpinningArrows
StartUiSpinningArrows: @ 0x080A8CD4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A8CE4 @ =0x08CE4A40
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080A8CE4: .4byte 0x08CE4A40

	thumb_func_start LoadUiSpinningArrowGfx
LoadUiSpinningArrowGfx: @ 0x080A8CE8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080A8D40 @ =0x08CE4A40
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080A8D38
	ldr r0, _080A8D44 @ =0x0840DCE4
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r6, #0
	bne _080A8D18
	ldr r0, _080A8D48 @ =0x0840D224
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D18:
	cmp r6, #1
	bne _080A8D26
	ldr r0, _080A8D50 @ =0x0840D150
	ldr r2, _080A8D4C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A8D26:
	asrs r0, r4, #5
	movs r1, #0xf
	ands r1, r7
	lsls r1, r1, #0xc
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x54
	strh r0, [r1]
	str r6, [r5, #0x2c]
_080A8D38:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A8D40: .4byte 0x08CE4A40
_080A8D44: .4byte 0x0840DCE4
_080A8D48: .4byte 0x0840D224
_080A8D4C: .4byte 0x06010000
_080A8D50: .4byte 0x0840D150

	thumb_func_start SetUiSpinningArrowConfig
SetUiSpinningArrowConfig: @ 0x080A8D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8D6C @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D64
	str r4, [r0, #0x30]
_080A8D64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D6C: .4byte 0x08CE4A40

	thumb_func_start SetUiSpinningArrowPositions
SetUiSpinningArrowPositions: @ 0x080A8D70
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A8D94 @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D8C
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080A8D8C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D94: .4byte 0x08CE4A40

	thumb_func_start SetUiSpinningArrowFastMaybe
SetUiSpinningArrowFastMaybe: @ 0x080A8D98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8DCC @ =0x08CE4A40
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A8DC6
	cmp r4, #0
	bne _080A8DB0
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DB0:
	cmp r4, #1
	bne _080A8DB6
	str r4, [r1, #0x50]
_080A8DB6:
	cmp r4, #2
	bne _080A8DBE
	movs r0, #1
	str r0, [r1, #0x4c]
_080A8DBE:
	cmp r4, #3
	bne _080A8DC6
	movs r0, #1
	str r0, [r1, #0x50]
_080A8DC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8DCC: .4byte 0x08CE4A40

	thumb_func_start EndUiSpinningArrows
EndUiSpinningArrows: @ 0x080A8DD0
	push {lr}
	ldr r0, _080A8DE0 @ =0x08CE4A40
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A8DE0: .4byte 0x08CE4A40

	thumb_func_start ParallelFiniteLoop_Init
ParallelFiniteLoop_Init: @ 0x080A8DE4
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

	thumb_func_start ParallelFiniteLoop_Loop
ParallelFiniteLoop_Loop: @ 0x080A8DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _080A8E06
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x34]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_080A8E06:
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StartParallelFiniteLoop
StartParallelFiniteLoop: @ 0x080A8E14
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080A8E2C @ =0x08CE4A60
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8E2C: .4byte 0x08CE4A60

	thumb_func_start SysBlackBox_Init
SysBlackBox_Init: @ 0x080A8E30
	movs r2, #0
	movs r1, #3
	adds r0, #0x4d
_080A8E36:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080A8E36
	bx lr
	.align 2, 0

	thumb_func_start SysBlackBox_Main
SysBlackBox_Main: @ 0x080A8E44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x4e
	str r1, [sp, #0x14]
_080A8E5C:
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080A8E70
	b _080A9188
_080A8E70:
	ldr r0, [sp, #4]
	adds r0, #0x3e
	ldr r3, [sp, #8]
	adds r3, r3, r0
	mov sb, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	str r0, [sp, #0x30]
	cmp r1, #1
	bgt _080A8E86
	b _080A9188
_080A8E86:
	ldr r0, [sp, #4]
	adds r0, #0x3a
	ldr r7, [sp, #8]
	adds r7, r0, r7
	str r7, [sp, #0x34]
	movs r1, #0
	ldrsb r1, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r1, #1
	bgt _080A8E9C
	b _080A9188
_080A8E9C:
	ldr r0, [sp, #8]
	lsls r0, r0, #1
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #0x2a
	str r1, [sp, #0xc]
	adds r6, r1, #0
	add r6, r8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldrh r3, [r6]
	orrs r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r7, [sp, #4]
	adds r7, #0x32
	str r7, [sp, #0x10]
	adds r5, r7, #0
	add r5, r8
	movs r2, #0
	ldrsh r0, [r5, r2]
	mov ip, r0
	ldr r3, [sp, #4]
	adds r3, #0x42
	str r3, [sp, #0x18]
	adds r4, r3, #0
	add r4, r8
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r7, #0
	ldrsh r3, [r5, r7]
	mov ip, r3
	ldrh r3, [r4]
	ldr r2, [sp, #0x14]
	ldrh r2, [r2]
	adds r0, r3, r2
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r3, #0xc0
	lsls r3, r3, #6
	adds r1, r3, #0
	ldrh r7, [r6]
	orrs r1, r7
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	mov ip, r2
	ldrh r2, [r4]
	ldr r7, [sp, #0x14]
	ldrh r7, [r7]
	adds r0, r2, r7
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	mov r2, ip
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	movs r3, #0
	ldrsh r2, [r5, r3]
	ldr r7, [sp, #0x34]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldrh r4, [r4]
	ldr r3, [sp, #0x14]
	ldrh r3, [r3]
	adds r0, r4, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080A8FD4 @ =0x08B905B0
	bl PutSpriteExt
	mov r7, sb
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r4, r0, #2
	movs r0, #0
	ldrsh r7, [r5, r0]
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r5, r0, #0
	adds r5, #8
	mov sl, r8
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x24]
	ldr r3, [sp, #0x10]
	str r3, [sp, #0x28]
	ldr r0, [sp, #4]
	adds r0, #0x4e
	mov r8, r0
	ldr r6, [sp, #0x18]
	cmp r4, #3
	ble _080A8FFA
_080A8FB0:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A8FD8 @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A8FB0
	b _080A8FFA
	.align 2, 0
_080A8FD4: .4byte 0x08B905B0
_080A8FD8: .4byte 0x08B90608
_080A8FDC:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9080 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A8FFA:
	cmp r4, #1
	bgt _080A8FDC
	cmp r4, #0
	ble _080A9024
_080A9002:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9084 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9002
_080A9024:
	ldr r7, [sp, #0x30]
	ldr r1, [sp, #8]
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x2c]
	ldr r7, [sp, #8]
	adds r0, r3, r7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #3
	adds r7, r1, r0
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r5, r0, #0
	adds r5, #8
	cmp r4, #3
	ble _080A90AA
_080A905C:
	mov r2, sl
	adds r0, r6, r2
	ldrh r0, [r0]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9088 @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A905C
	b _080A90AA
	.align 2, 0
_080A9080: .4byte 0x08B905E8
_080A9084: .4byte 0x08B905B0
_080A9088: .4byte 0x08B90608
_080A908C:
	mov r1, sl
	adds r0, r6, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9134 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A90AA:
	cmp r4, #1
	bgt _080A908C
	cmp r4, #0
	ble _080A90D4
_080A90B2:
	mov r3, sl
	adds r0, r6, r3
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A9138 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A90B2
_080A90D4:
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r7, r0, #0
	adds r7, #8
	cmp r1, #0
	ble _080A9188
	add r6, sl
_080A90F4:
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #8]
	adds r0, r2, r3
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r3, r7, #0
	adds r3, #8
	str r3, [sp, #0x20]
	subs r1, #1
	mov sb, r1
	cmp r4, #3
	ble _080A915A
_080A9114:
	ldrh r2, [r6]
	mov r1, r8
	ldrh r1, [r1]
	adds r0, r2, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A913C @ =0x08B90608
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080A9114
	b _080A915A
	.align 2, 0
_080A9134: .4byte 0x08B905E8
_080A9138: .4byte 0x08B905B0
_080A913C: .4byte 0x08B90608
_080A9140:
	ldrh r3, [r6]
	mov r2, r8
	ldrh r2, [r2]
	adds r0, r3, r2
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A4 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080A915A:
	cmp r4, #1
	bgt _080A9140
	cmp r4, #0
	ble _080A9180
_080A9162:
	ldrh r1, [r6]
	mov r3, r8
	ldrh r3, [r3]
	adds r0, r1, r3
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080A91A8 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080A9162
_080A9180:
	ldr r7, [sp, #0x20]
	mov r1, sb
	cmp r1, #0
	bgt _080A90F4
_080A9188:
	ldr r7, [sp, #0x1c]
	str r7, [sp, #8]
	adds r0, r7, #0
	cmp r0, #3
	bgt _080A9194
	b _080A8E5C
_080A9194:
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A91A4: .4byte 0x08B905E8
_080A91A8: .4byte 0x08B905B0

	thumb_func_start NewSysBlackBoxHandler
NewSysBlackBoxHandler: @ 0x080A91AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A91CC @ =0x08CE4A80
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A91CC: .4byte 0x08CE4A80

	thumb_func_start SysBlackBoxSetGfx
SysBlackBoxSetGfx: @ 0x080A91D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A91F8 @ =0x08CE4A80
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A91F2
	lsls r0, r4, #0xf
	lsrs r0, r0, #0x14
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, _080A91FC @ =0x08403A48
	ldr r2, _080A9200 @ =0x06010000
	adds r1, r4, r2
	bl Decompress
_080A91F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A91F8: .4byte 0x08CE4A80
_080A91FC: .4byte 0x08403A48
_080A9200: .4byte 0x06010000

	thumb_func_start EnableSysBlackBox
EnableSysBlackBox: @ 0x080A9204
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _080A9268 @ =0x08CE4A80
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080A925C
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	lsls r2, r4, #1
	adds r0, r3, #0
	adds r0, #0x2a
	adds r0, r0, r2
	strh r5, [r0]
	adds r0, r3, #0
	adds r0, #0x32
	adds r0, r0, r2
	strh r6, [r0]
	adds r0, r3, #0
	adds r0, #0x3e
	adds r0, r0, r4
	strb r7, [r0]
	adds r0, r3, #0
	adds r0, #0x3a
	adds r0, r0, r4
	ldr r1, [sp, #0x18]
	strb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x42
	adds r0, r0, r2
	mov r1, r8
	strh r1, [r0]
_080A925C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9268: .4byte 0x08CE4A80

	thumb_func_start DisableSysBlackBox
DisableSysBlackBox: @ 0x080A926C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9288 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A9282
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080A9282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9288: .4byte 0x08CE4A80

	thumb_func_start sub_080A928C
sub_080A928C: @ 0x080A928C
	push {lr}
	ldr r0, _080A92A4 @ =0x08CE4A80
	bl Proc_Find
	cmp r0, #0
	beq _080A929E
	movs r1, #1
	bl Proc_Goto
_080A929E:
	pop {r0}
	bx r0
	.align 2, 0
_080A92A4: .4byte 0x08CE4A80

	thumb_func_start UnblockAllSysBlackBoxs
UnblockAllSysBlackBoxs: @ 0x080A92A8
	push {r4, lr}
	ldr r0, _080A92D0 @ =0x08CE4A80
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080A92C8
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #5
	bl SysBlackBoxSetGfx
_080A92C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A92D0: .4byte 0x08CE4A80

	thumb_func_start EndSysBlackBoxs
EndSysBlackBoxs: @ 0x080A92D4
	push {lr}
	ldr r0, _080A92E4 @ =0x08CE4A80
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A92E4: .4byte 0x08CE4A80

	thumb_func_start ParallelWorker_OnLoop
ParallelWorker_OnLoop: @ 0x080A92E8
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x2c]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	bx r0

	thumb_func_start StartParallelWorker
StartParallelWorker: @ 0x080A92F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetParallelWorker
	cmp r0, #0
	bne _080A9310
	ldr r0, _080A9318 @ =0x08CE4AB0
	adds r1, r5, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
_080A9310:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A9318: .4byte 0x08CE4AB0

	thumb_func_start EndAllParallelWorkers
EndAllParallelWorkers: @ 0x080A931C
	push {lr}
	b _080A9324
_080A9320:
	bl Proc_End
_080A9324:
	ldr r0, _080A9334 @ =0x08CE4AB0
	bl Proc_Find
	cmp r0, #0
	bne _080A9320
	pop {r0}
	bx r0
	.align 2, 0
_080A9334: .4byte 0x08CE4AB0

	thumb_func_start GetParallelWorker
GetParallelWorker: @ 0x080A9338
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	b _080A934A
_080A9340:
	ldr r0, [r1, #0x2c]
	cmp r0, r4
	bne _080A934A
	adds r0, r1, #0
	b _080A9358
_080A934A:
	ldr r0, _080A9360 @ =0x08CE4AB0
	bl Proc_FindAfter
	adds r1, r0, #0
	cmp r1, #0
	bne _080A9340
	movs r0, #0
_080A9358:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A9360: .4byte 0x08CE4AB0

	thumb_func_start DisplayExtendedSysHand
DisplayExtendedSysHand: @ 0x080A9364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, _080A9424 @ =0x02022860
	ldrh r3, [r5, #0x3a]
	lsls r2, r3, #5
	movs r4, #0x87
	lsls r4, r4, #2
	adds r2, r2, r4
	adds r2, r2, r1
	ldr r1, _080A9428 @ =0x0202BBF8
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080A942C @ =0x0840DD24
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl EnablePalSync
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r0, r4
	ldrh r0, [r5, #0x36]
	adds r4, r0, r4
	str r4, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r4, #1
	ldrh r1, [r5, #0x38]
	cmp r4, r1
	bge _080A93F2
_080A93C4:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	movs r0, #0xf
	ldrh r3, [r5, #0x3a]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r3, r0
	ldrh r3, [r5, #0x36]
	adds r0, r3, r0
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080A9430 @ =0x08B905B0
	bl PutSpriteExt
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080A93C4
_080A93F2:
	ldrh r1, [r5, #0x38]
	lsls r0, r1, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080A9430 @ =0x08B905B0
	movs r0, #0xf
	ldrh r4, [r5, #0x3a]
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r4, r0
	ldrh r5, [r5, #0x36]
	adds r0, r5, r0
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9424: .4byte 0x02022860
_080A9428: .4byte 0x0202BBF8
_080A942C: .4byte 0x0840DD24
_080A9430: .4byte 0x08B905B0

	thumb_func_start SysHandCursor_Init
SysHandCursor_Init: @ 0x080A9434
	adds r0, #0x35
	movs r1, #0
	strb r1, [r0]
	bx lr

	thumb_func_start SysHandCursor_Loop
SysHandCursor_Loop: @ 0x080A943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl PutUiHand
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A945C
	adds r0, r4, #0
	bl DisplayExtendedSysHand
_080A945C:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A9474
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl DisplayBmTextShadow
_080A9474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ResetSysHandCursor
ResetSysHandCursor: @ 0x080A947C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A949C @ =0x08CE4AC8
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A949C: .4byte 0x08CE4AC8

	thumb_func_start DisplaySysHandCursorTextShadow
DisplaySysHandCursorTextShadow: @ 0x080A94A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A94D8 @ =0x08CE4AC8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080A94D0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080A94DC @ =0x0840E098
	ldr r2, _080A94E0 @ =0x06010000
	adds r1, r5, r2
	bl Decompress
_080A94D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A94D8: .4byte 0x08CE4AC8
_080A94DC: .4byte 0x0840E098
_080A94E0: .4byte 0x06010000

	thumb_func_start SetSysHandCursorXPos
SetSysHandCursorXPos: @ 0x080A94E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A94FC @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A94F4
	str r4, [r0, #0x2c]
_080A94F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A94FC: .4byte 0x08CE4AC8

	thumb_func_start sub_080A9500
sub_080A9500: @ 0x080A9500
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9518 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9510
	str r4, [r0, #0x30]
_080A9510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9518: .4byte 0x08CE4AC8

	thumb_func_start ShowSysHandCursor
ShowSysHandCursor: @ 0x080A951C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080A9544 @ =0x08CE4AC8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A955C
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080A9548
	adds r0, #0x35
	strb r4, [r0]
	b _080A9554
	.align 2, 0
_080A9544: .4byte 0x08CE4AC8
_080A9548:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080A9554:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A955C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HideSysHandCursor
HideSysHandCursor: @ 0x080A9564
	push {lr}
	ldr r0, _080A957C @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9576
	movs r1, #0
	bl Proc_Goto
_080A9576:
	pop {r0}
	bx r0
	.align 2, 0
_080A957C: .4byte 0x08CE4AC8

	thumb_func_start EndSysHandCursor
EndSysHandCursor: @ 0x080A9580
	push {lr}
	ldr r0, _080A9590 @ =0x08CE4AC8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9590: .4byte 0x08CE4AC8

	thumb_func_start ConfigSysHandCursorShadowEnabled
ConfigSysHandCursorShadowEnabled: @ 0x080A9594
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080A95B0 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A95A8
	adds r0, #0x34
	strb r4, [r0]
_080A95A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A95B0: .4byte 0x08CE4AC8

	thumb_func_start sub_080A95B4
sub_080A95B4: @ 0x080A95B4
	ldr r2, _080A95D4 @ =0x03002870
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
_080A95D4: .4byte 0x03002870

	thumb_func_start sub_080A95D8
sub_080A95D8: @ 0x080A95D8
	ldr r2, _080A95F4 @ =0x03002870
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
_080A95F4: .4byte 0x03002870

	thumb_func_start SysGrayBox_Init
SysGrayBox_Init: @ 0x080A95F8
	movs r2, #0
	movs r1, #3
	adds r0, #0x50
_080A95FE:
	strb r2, [r0]
	subs r0, #0xc
	subs r1, #1
	cmp r1, #0
	bge _080A95FE
	bx lr
	.align 2, 0

	thumb_func_start SysGrayBox_Loop
SysGrayBox_Loop: @ 0x080A960C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080A961C:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080A9636
	b _080A9930
_080A9636:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080A98B4 @ =0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	ldr r1, _080A98B4 @ =0x000001FF
	ldrh r2, [r5, #2]
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080A974C
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98BC @ =0x08B90608
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A96FC:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080A96FC
_080A974C:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080A97B0
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98C0 @ =0x08B905E8
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A9760:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080A9760
_080A97B0:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080A9814
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	ldr r1, _080A98B8 @ =0x08B905B0
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080A97C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0xff
	ldrh r3, [r5, #4]
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080A97C4
_080A9814:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080A9820
	b _080A9930
_080A9820:
	ldr r0, _080A98B4 @ =0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov sb, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080A982E:
	ldrb r0, [r5, #1]
	mov r1, sl
	ldrh r3, [r5, #2]
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080A98B8 @ =0x08B905B0
	bl PutSpriteExt
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080A98EA
_080A9884:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98BC @ =0x08B90608
	bl PutSpriteExt
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080A9884
	b _080A98EA
	.align 2, 0
_080A98B4: .4byte 0x000001FF
_080A98B8: .4byte 0x08B905B0
_080A98BC: .4byte 0x08B90608
_080A98C0: .4byte 0x08B905E8
_080A98C4:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A98F4 @ =0x08B905E8
	bl PutSpriteExt
	adds r6, #2
_080A98EA:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080A98C4
	b _080A991E
	.align 2, 0
_080A98F4: .4byte 0x08B905E8
_080A98F8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080A9948 @ =0x08B905B0
	bl PutSpriteExt
	adds r6, #1
_080A991E:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080A98F8
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080A9930
	b _080A982E
_080A9930:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080A9938
	b _080A961C
_080A9938:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9948: .4byte 0x08B905B0

	thumb_func_start NewSysGrayBox
NewSysGrayBox: @ 0x080A994C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080A9984 @ =0x08CE4AF8
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _080A9988 @ =0x081D7E54
	ldr r2, _080A998C @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9990 @ =0x02022880
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A9984: .4byte 0x08CE4AF8
_080A9988: .4byte 0x081D7E54
_080A998C: .4byte 0x06010000
_080A9990: .4byte 0x02022880

	thumb_func_start EnableUnransportWindow
EnableUnransportWindow: @ 0x080A9994
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080A99E0 @ =0x08CE4AF8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A99D4
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
	strb r6, [r0, #1]
	strh r7, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r1, [r0, #7]
	strh r5, [r0, #8]
_080A99D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A99E0: .4byte 0x08CE4AF8

	thumb_func_start DisableSysGrayBox
DisableSysGrayBox: @ 0x080A99E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9A08 @ =0x08CE4AF8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9A02
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080A9A02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A08: .4byte 0x08CE4AF8

	thumb_func_start sub_080A9A0C
sub_080A9A0C: @ 0x080A9A0C
	push {lr}
	ldr r0, _080A9A1C @ =0x08CE4AF8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9A1C: .4byte 0x08CE4AF8

	thumb_func_start SysBrownBox_Init
SysBrownBox_Init: @ 0x080A9A20
	movs r2, #0
	adds r0, #0x2c
	movs r1, #3
_080A9A26:
	strb r2, [r0]
	strb r2, [r0, #6]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080A9A26
	bx lr

	thumb_func_start SysBrownBox_Loop
SysBrownBox_Loop: @ 0x080A9A34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sl, r0
	add r1, sp, #4
	ldr r0, _080A9B1C @ =0x08418DF8
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #0x14
	adds r1, r2, #0
	ldr r0, _080A9B20 @ =0x08418E08
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	mov r4, sl
	adds r4, #0x2d
	str r4, [sp, #0x28]
	mov r5, sl
	adds r5, #0x2c
	movs r7, #3
	str r7, [sp, #0x24]
_080A9A6A:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080A9B50
	movs r0, #2
	ldrsh r6, [r5, r0]
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080A9B24
	ldrb r4, [r5, #1]
	adds r0, r4, #0
	movs r1, #1
	ands r0, r1
	mov r7, sl
	adds r7, #0x50
	movs r2, #0x4e
	add r2, sl
	mov r8, r2
	movs r3, #0x4c
	add r3, sl
	mov sb, r3
	cmp r0, #0
	beq _080A9AC2
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r1, #0x60
	movs r3, #4
	ldrsh r2, [r5, r3]
	mov ip, r2
	mov r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	add r2, ip
	lsls r3, r4, #2
	add r3, sp
	adds r3, #0x14
	ldr r3, [r3]
	mov r4, sb
	ldrh r4, [r4]
	str r4, [sp]
	bl PutSpriteExt
	adds r6, #0x20
_080A9AC2:
	ldrb r0, [r7]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r3, r8
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r2, r2, r1
	ldr r3, [sp, #0x28]
	ldrb r3, [r3]
	lsls r1, r3, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r4, sb
	ldrh r1, [r4]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	ldr r0, [sp, #0x28]
	ldrb r3, [r0]
	adds r0, r3, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A9B50
	adds r6, #0x60
	ldrb r0, [r7]
	movs r4, #4
	ldrsh r2, [r5, r4]
	mov r7, r8
	movs r4, #0
	ldrsh r1, [r7, r4]
	adds r2, r2, r1
	lsls r1, r3, #2
	add r1, sp
	adds r1, #0x14
	ldr r3, [r1]
	mov r7, sb
	ldrh r1, [r7]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	b _080A9B50
	.align 2, 0
_080A9B1C: .4byte 0x08418DF8
_080A9B20: .4byte 0x08418E08
_080A9B24:
	mov r0, sl
	adds r0, #0x50
	ldrb r0, [r0]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r1, sl
	adds r1, #0x4e
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r2, r2, r1
	ldrb r4, [r5, #1]
	lsls r1, r4, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r1, sl
	adds r1, #0x4c
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
_080A9B50:
	ldr r7, [sp, #0x28]
	adds r7, #8
	str r7, [sp, #0x28]
	adds r5, #8
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0
	blt _080A9B64
	b _080A9A6A
_080A9B64:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StartSysBrownBox
StartSysBrownBox: @ 0x080A9B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl EndSysBrownBox
	ldr r0, _080A9BE4 @ =0x08CE4C18
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	ldr r0, _080A9BE8 @ =0x0840F238
	ldr r2, _080A9BEC @ =0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080A9BF0 @ =0x0840624C
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, sb
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9BE4: .4byte 0x08CE4C18
_080A9BE8: .4byte 0x0840F238
_080A9BEC: .4byte 0x06010000
_080A9BF0: .4byte 0x0840624C

	thumb_func_start EnableSysBrownBox
EnableSysBrownBox: @ 0x080A9BF4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080A9C34 @ =0x08CE4C18
	bl Proc_Find
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x2c
	movs r1, #1
	strb r1, [r2]
	ldr r2, _080A9C38 @ =0x000001FF
	adds r1, r2, #0
	ands r5, r1
	strh r5, [r0, #0x2e]
	movs r1, #0xff
	ands r6, r1
	strh r6, [r0, #0x30]
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C34: .4byte 0x08CE4C18
_080A9C38: .4byte 0x000001FF

	thumb_func_start DisableSysBrownBox
DisableSysBrownBox: @ 0x080A9C3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9C5C @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C56
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080A9C56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C5C: .4byte 0x08CE4C18

	thumb_func_start SetSysBrownBoxWidth
SetSysBrownBoxWidth: @ 0x080A9C60
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080A9C84 @ =0x08CE4C18
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A9C7C
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080A9C7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9C84: .4byte 0x08CE4C18

	thumb_func_start EndSysBrownBox
EndSysBrownBox: @ 0x080A9C88
	push {lr}
	ldr r0, _080A9C98 @ =0x08CE4C18
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9C98: .4byte 0x08CE4C18

	thumb_func_start SysboxTextMain
SysboxTextMain: @ 0x080A9C9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetTextFont
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	cmp r0, #4
	bne _080A9CB4
	movs r0, #0
	strh r0, [r1]
_080A9CB4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _080A9CF0
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A9CD8
	cmp r0, #1
	beq _080A9CE0
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl Text_DrawCharacter
	b _080A9CEE
_080A9CD8:
	adds r0, r4, #0
	bl Proc_Break
	b _080A9CF0
_080A9CE0:
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0x54]
	adds r0, #1
_080A9CEE:
	str r0, [r4, #0x54]
_080A9CF0:
	adds r1, r4, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A9D08
sub_080A9D08: @ 0x080A9D08
	push {lr}
	ldr r0, _080A9D18 @ =0x08CE4C38
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A9D18: .4byte 0x08CE4C38

	thumb_func_start sub_080A9D1C
sub_080A9D1C: @ 0x080A9D1C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov sb, r1
	mov r8, r2
	adds r7, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r4, _080A9DB4 @ =0x08CE4C38
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r6, r0, #0
	adds r0, #0x2c
	ldr r1, _080A9DB8 @ =0x06010000
	adds r5, r5, r1
	adds r1, r5, #0
	mov r2, sb
	bl InitSpriteTextFont
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strh r1, [r0]
	cmp r7, #0
	ble _080A9D86
	adds r4, r6, #0
	adds r4, #0x44
	adds r5, r7, #0
_080A9D70:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080A9D70
_080A9D86:
	ldr r0, _080A9DBC @ =0x08194674
	mov r1, sb
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DB4: .4byte 0x08CE4C38
_080A9DB8: .4byte 0x06010000
_080A9DBC: .4byte 0x08194674

	thumb_func_start EndAllProcChildren
EndAllProcChildren: @ 0x080A9DC0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080A9DCE
_080A9DC8:
	adds r0, r4, #0
	bl Proc_End
_080A9DCE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_FindAfterWithParent
	adds r4, r0, #0
	cmp r4, #0
	bne _080A9DC8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080A9DE4
sub_080A9DE4: @ 0x080A9DE4
	bx lr
	.align 2, 0

	thumb_func_start BgAffinRotScaling
BgAffinRotScaling: @ 0x080A9DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	bgt _080A9E16
	movs r2, #4
_080A9E16:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _080A9E20
	movs r6, #4
_080A9E20:
	lsls r0, r1, #0x10
	asrs r0, r0, #8
	str r0, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	lsls r0, r7, #4
	strh r0, [r1, #0x10]
	ldr r1, _080A9E78 @ =0x030028C8
	mov r0, r8
	cmp r0, #2
	bne _080A9E64
	subs r1, #0x10
_080A9E64:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E78: .4byte 0x030028C8

	thumb_func_start BgAffinScaling
BgAffinScaling: @ 0x080A9E7C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #0
	cmp r0, #2
	bne _080A9E92
	ldr r3, _080A9EC8 @ =0x030028B8
_080A9E92:
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9EC8: .4byte 0x030028B8

	thumb_func_start BgAffinAnchoring
BgAffinAnchoring: @ 0x080A9ECC
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	movs r4, #0
	cmp r0, #2
	bne _080A9EEC
	ldr r4, _080A9F30 @ =0x030028B8
_080A9EEC:
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	rsbs r3, r3, #0
	adds r1, r0, #0
	muls r1, r3, r1
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	rsbs r2, r2, #0
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	movs r3, #6
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9F30: .4byte 0x030028B8

	thumb_func_start BgAffinRotScalingHighPrecision
BgAffinRotScalingHighPrecision: @ 0x080A9F34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r1
	adds r1, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080A9F52
	adds r2, r0, #0
_080A9F52:
	cmp r6, r0
	bgt _080A9F58
	adds r6, r0, #0
_080A9F58:
	str r1, [sp]
	str r3, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #0x11
	adds r0, r4, #0
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	mov r2, r8
	asrs r0, r2, #4
	strh r0, [r1, #0x10]
	ldr r1, _080A9FA4 @ =0x030028C8
	cmp r7, #2
	bne _080A9F90
	subs r1, #0x10
_080A9F90:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9FA4: .4byte 0x030028C8

	thumb_func_start BgAffinScalingHighPrecision
BgAffinScalingHighPrecision: @ 0x080A9FA8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	cmp r0, #2
	bne _080A9FB6
	ldr r3, _080A9FE4 @ =0x030028B8
_080A9FB6:
	movs r4, #2
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3]
	movs r4, #4
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9FE4: .4byte 0x030028B8

	thumb_func_start BgAffinAnchoringHighPrecision
BgAffinAnchoringHighPrecision: @ 0x080A9FE8
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #2
	bne _080A9FF8
	ldr r4, _080AA02C @ =0x030028B8
_080A9FF8:
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r3, r1, #0
	muls r0, r3, r0
	movs r6, #2
	ldrsh r1, [r4, r6]
	rsbs r2, r2, #0
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA02C: .4byte 0x030028B8

	thumb_func_start sub_080AA030
sub_080AA030: @ 0x080AA030
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov ip, r2
	mov sb, r3
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	ldrh r1, [r7]
	lsrs r1, r1, #1
	mov r8, r1
	movs r1, #0x78
	mov sl, r1
	adds r6, r7, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r4, #0
	beq _080AA0C8
	cmp r3, #0
	beq _080AA0C8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080AA072
	ldrh r4, [r7]
	ldrh r3, [r7, #2]
_080AA072:
	mov r1, ip
	asrs r1, r1, #1
	mov ip, r1
	asrs r2, r2, #1
	asrs r4, r4, #1
	lsls r4, r4, #1
	ldr r0, [sp, #0x24]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r1, r2, #1
	adds r6, r0, r1
	mov r2, sl
	mov r0, sb
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, ip
	lsls r1, r2, #1
	adds r5, r0, r1
	cmp r3, #0
	ble _080AA0C8
	asrs r7, r4, #1
	adds r4, r3, #0
	ldr r0, _080AA0D8 @ =0x001FFFFF
	mov sb, r0
_080AA0AA:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sb
	ands r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r6, r6, r0
	mov r2, sl
	lsls r0, r2, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AA0AA
_080AA0C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA0D8: .4byte 0x001FFFFF

	thumb_func_start sub_080AA0DC
sub_080AA0DC: @ 0x080AA0DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r1, #0
	ldr r6, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	movs r1, #0x78
	mov r8, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r3, #0
	beq _080AA146
	cmp r6, #0
	beq _080AA146
	asrs r4, r4, #1
	asrs r3, r3, #1
	lsls r3, r3, #1
	mov r0, r8
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r5, r0, r1
	cmp r6, #0
	ble _080AA146
	adds r4, r6, #0
	lsls r0, r3, #0xa
	lsrs r6, r0, #0xb
	movs r7, #0x80
	lsls r7, r7, #0x11
_080AA12A:
	mov r0, sp
	mov r1, sb
	strh r1, [r0]
	adds r1, r5, #0
	adds r2, r6, #0
	orrs r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AA12A
_080AA146:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SetBlankBgColor
SetBlankBgColor: @ 0x080AA154
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080AA174 @ =0x02022860
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA174: .4byte 0x02022860

	thumb_func_start FadeInOut_Init
FadeInOut_Init: @ 0x080AA178
	push {r4, lr}
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeIn_Loop
FadeIn_Loop: @ 0x080AA18C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AA1B0
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080AA1B2
_080AA1B0:
	lsls r2, r1, #1
_080AA1B2:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AA1C8
	adds r0, r4, #0
	bl Proc_Break
_080AA1C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FadeOut_Loop
FadeOut_Loop: @ 0x080AA1D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AA1F4
	lsls r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, r1
	b _080AA1FC
_080AA1F4:
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #1
	subs r2, r0, r1
_080AA1FC:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AA212
	adds r0, r4, #0
	bl Proc_Break
_080AA212:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FadeInOut_DisableGfx
FadeInOut_DisableGfx: @ 0x080AA218
	ldr r1, [r0, #0x34]
	ldr r0, _080AA240 @ =0x0000FFFF
	cmp r1, r0
	bne _080AA248
	ldr r2, _080AA244 @ =0x03002870
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
	movs r1, #0x10
	orrs r0, r1
	b _080AA264
	.align 2, 0
_080AA240: .4byte 0x0000FFFF
_080AA244: .4byte 0x03002870
_080AA248:
	ldr r2, _080AA268 @ =0x03002870
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
_080AA264:
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080AA268: .4byte 0x03002870

	thumb_func_start FadeInExists
FadeInExists: @ 0x080AA26C
	push {lr}
	ldr r0, _080AA280 @ =0x08CE4C50
	bl Proc_Find
	cmp r0, #0
	beq _080AA27A
	movs r0, #1
_080AA27A:
	pop {r1}
	bx r1
	.align 2, 0
_080AA280: .4byte 0x08CE4C50

	thumb_func_start FadeOutExists
FadeOutExists: @ 0x080AA284
	push {lr}
	ldr r0, _080AA298 @ =0x08CE4C80
	bl Proc_Find
	cmp r0, #0
	beq _080AA292
	movs r0, #1
_080AA292:
	pop {r1}
	bx r1
	.align 2, 0
_080AA298: .4byte 0x08CE4C80

	thumb_func_start NewFadeIn
NewFadeIn: @ 0x080AA29C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA2BC @ =0x08CE4C50
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2BC: .4byte 0x08CE4C50

	thumb_func_start NewFadeOut
NewFadeOut: @ 0x080AA2C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA2E0 @ =0x08CE4C80
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2E0: .4byte 0x08CE4C80

	thumb_func_start StartLockingPaletteFadeFromBlack
StartLockingPaletteFadeFromBlack: @ 0x080AA2E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AA304 @ =0x08CE4C50
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA304: .4byte 0x08CE4C50

