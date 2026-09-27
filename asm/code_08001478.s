	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBgTilemapOffset
SetBgTilemapOffset: @ 0x08001478
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl GetBgCt
	str r0, [r7, #8]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x15
	lsrs r0, r1, #0x15
	cmp r0, #0
	beq _0800149E
	b _080014D0
_0800149E:
	ldr r0, [r7, #8]
	ldr r2, [r7, #4]
	asrs r1, r2, #0xb
	adds r2, r1, #0
	movs r3, #0x1f
	adds r1, r2, #0
	ands r1, r3
	ldrb r2, [r0, #1]
	movs r3, #0xe0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0, #1]
	ldr r0, _080014D8 @ =0x02024C60
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	orrs r1, r2
	str r1, [r0]
_080014D0:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080014D8: .4byte 0x02024C60
