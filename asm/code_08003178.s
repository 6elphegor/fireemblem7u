	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyDataMoves
ApplyDataMoves: @ 0x08003178
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	ldr r0, _08003194 @ =0x02024C9C
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_08003186:
	ldr r0, _08003198 @ =0x02024C94
	ldr r1, [r7, #4]
	ldr r0, [r0]
	cmp r1, r0
	blt _0800319C
	b _0800321E
	.align 2, 0
_08003194: .4byte 0x02024C9C
_08003198: .4byte 0x02024C94
_0800319C:
	ldr r1, [r7]
	ldrh r0, [r1, #0xa]
	cmp r0, #1
	beq _080031CE
	cmp r0, #1
	bgt _080031AE
	cmp r0, #0
	beq _080031B4
	b _0800320E
_080031AE:
	cmp r0, #2
	beq _080031E8
	b _0800320E
_080031B4:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #1
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuSet
	b _0800320E
_080031CE:
	ldr r1, [r7]
	ldr r0, [r1]
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	bl CpuFastSet
	b _0800320E
_080031E8:
	ldr r0, [r7]
	ldr r1, [r0]
	str r1, [r7, #8]
	adds r0, r7, #0
	adds r0, #8
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldr r2, [r7]
	ldrh r3, [r2, #8]
	lsrs r2, r3, #2
	adds r4, r2, #0
	lsls r3, r4, #0x10
	lsrs r2, r3, #0x10
	movs r3, #0x80
	lsls r3, r3, #0x11
	orrs r2, r3
	bl CpuFastSet
	b _0800320E
_0800320E:
	ldr r0, [r7]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r7]
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _08003186
_0800321E:
	bl ClearMoveList
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
