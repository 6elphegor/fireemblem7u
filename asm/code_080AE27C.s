	.include "macro.inc"

	.syntax unified

	thumb_func_start GenericOptionChangeHandler
GenericOptionChangeHandler: @ 0x080AE27C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, _080AE2D8 @ =0x08CE583C
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	bl GetOptionMenuLayoutId
	ldr r1, _080AE2DC @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	adds r6, r4, #0
	bl sub_080ADB48
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080AE2E0 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080AE342
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AE2E4
	cmp r3, #0
	beq _080AE30A
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_080AE4CC
	movs r7, #1
	b _080AE30E
	.align 2, 0
_080AE2D8: .4byte 0x08CE583C
_080AE2DC: .4byte 0x08CE5868
_080AE2E0: .4byte 0x08B857F8
_080AE2E4:
	ldr r2, _080AE350 @ =0x08CE58D8
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _080AE30A
	cmp r3, #2
	bhi _080AE30A
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_080AE4CC
	movs r7, #1
_080AE30A:
	cmp r7, #0
	beq _080AE342
_080AE30E:
	ldr r0, _080AE354 @ =0x08CE5B98
	mov r1, r8
	bl Proc_Start
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #4
	adds r0, r5, #0
	bl sub_080ADDB4
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AE358 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE342
	ldr r0, _080AE35C @ =0x00000387
	bl m4aSongNumStart
_080AE342:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AE350: .4byte 0x08CE58D8
_080AE354: .4byte 0x08CE5B98
_080AE358: .4byte 0x0202BBF8
_080AE35C: .4byte 0x00000387
