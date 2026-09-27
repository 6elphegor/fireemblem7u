	.include "macro.inc"

	.syntax unified

	thumb_func_start SetOnVBlank
SetOnVBlank: @ 0x08001864
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080018A0
	ldr r0, _08001898 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	movs r0, #0
	ldr r1, [r7]
	bl SetIrqFunc
	ldr r0, _0800189C @ =0x04000200
	ldr r1, _0800189C @ =0x04000200
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _080018BC
	.align 2, 0
_08001898: .4byte 0x03002870
_0800189C: .4byte 0x04000200
_080018A0:
	ldr r0, _080018C4 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xf7
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _080018C8 @ =0x04000200
	ldr r1, _080018C8 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _080018CC @ =0x0000FFFE
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
_080018BC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080018C4: .4byte 0x03002870
_080018C8: .4byte 0x04000200
_080018CC: .4byte 0x0000FFFE
