	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD364
sub_080BD364: @ 0x080BD364
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _080BD3E0 @ =0x0200750C
	mov sl, r1
_080BD378:
	mov r3, sb
	lsls r5, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r5
	mov r8, r0
	ldr r7, [r0]
	cmp r7, #0
	beq _080BD3F6
	adds r2, r6, #0
	adds r2, #0x44
	adds r2, r2, r5
	ldr r0, [r2]
	mov r3, sl
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r1, [r3, #0xc]
	adds r0, r0, r1
	str r0, [r4]
	adds r3, r6, #0
	adds r3, #0x34
	adds r3, r3, r5
	ldr r0, [r3]
	ldr r1, [r2]
	adds r0, r0, r1
	str r0, [r3]
	adds r1, r6, #0
	adds r1, #0x3c
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r0, [r4]
	adds r2, r2, r0
	str r2, [r1]
	movs r0, #2
	ldrsh r1, [r3, r0]
	asrs r2, r2, #0x10
	cmp r1, #0xf0
	bhi _080BD3D2
	cmp r2, #0
	bge _080BD3E4
_080BD3D2:
	adds r0, r7, #0
	bl EndSpriteAnimProc
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	b _080BD3F6
	.align 2, 0
_080BD3E0: .4byte 0x0200750C
_080BD3E4:
	ldr r0, _080BD420 @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	adds r0, r7, #0
	movs r3, #0xe6
	lsls r3, r3, #6
	bl SetSpriteAnimProcParameters
_080BD3F6:
	movs r3, #1
	add sb, r3
	mov r0, sb
	cmp r0, #1
	ble _080BD378
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _080BD412
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bne _080BD412
	adds r0, r6, #0
	bl Proc_Break
_080BD412:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD420: .4byte 0x000001FF
