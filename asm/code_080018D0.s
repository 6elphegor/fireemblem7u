	.include "macro.inc"

	.syntax unified

	thumb_func_start SetOnVMatch
SetOnVMatch: @ 0x080018D0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _0800190C
	ldr r0, _08001904 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x20
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #2
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _08001908 @ =0x04000200
	ldr r1, _08001908 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08001934
	.align 2, 0
_08001904: .4byte 0x03002870
_08001908: .4byte 0x04000200
_0800190C:
	ldr r0, _0800193C @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08001940 @ =0x04000200
	ldr r1, _08001940 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08001944 @ =0x0000FFFB
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0800193C @ =0x03002870
	ldrb r1, [r0, #5]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #5]
_08001934:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800193C: .4byte 0x03002870
_08001940: .4byte 0x04000200
_08001944: .4byte 0x0000FFFB
