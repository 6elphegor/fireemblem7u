	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreenSprites_PutRescueMarkers
StatScreenSprites_PutRescueMarkers: @ 0x08080F54
	push {r4, r5, lr}
	sub sp, #0xc
	bl GetGameTime
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08080F68
	movs r2, #1
_08080F68:
	adds r5, r2, #0
	ldr r1, _08081010 @ =0x08404B70
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _08081014 @ =0x0200310C
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08081008
	ldrb r0, [r4]
	cmp r0, #0
	bne _08080FD0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08080FD0
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl PutSysArrow
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl PutSysArrow
	cmp r5, #0
	beq _08080FD0
	ldr r3, _08081018 @ =0x08B905B0
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_08080FD0:
	ldr r0, _08081014 @ =0x0200310C
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08081008
	cmp r5, #0
	beq _08081008
	ldr r3, _08081018 @ =0x08B905B0
	ldrb r2, [r2, #0x1b]
	lsrs r0, r2, #6
	lsls r0, r0, #1
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808101C @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x56
	bl PutSprite
_08081008:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081010: .4byte 0x08404B70
_08081014: .4byte 0x0200310C
_08081018: .4byte 0x08B905B0
_0808101C: .4byte 0x00000803
