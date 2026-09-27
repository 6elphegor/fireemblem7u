	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMuralBackground_Loop
PrepMuralBackground_Loop: @ 0x08090690
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x2c
	ldrb r0, [r5]
	cmp r0, #3
	bne _080906D4
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
	lsls r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #0x13
	cmp r0, r1
	bne _080906B8
	movs r0, #0
	strh r0, [r6, #0x2a]
_080906B8:
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r1, [r6, #0x2a]
	ands r2, r1
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _08090760 @ =0x0400001E
	ldrh r7, [r6, #0x2a]
	ands r4, r7
	strh r4, [r0]
	movs r0, #0
	strb r0, [r5]
_080906D4:
	adds r1, r6, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r6, #0x2a]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08090754
	ldr r5, _08090764 @ =0x0840C7CE
	lsrs r0, r1, #3
	subs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #0x1f
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	ldr r1, _08090768 @ =0x02024460
	mov r8, r1
	lsls r4, r4, #6
	movs r1, #0x27
	subs r1, r1, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov sb, r0
	mov ip, r8
	adds r5, r6, #0
	adds r5, #0x2d
	adds r6, r4, #0
_0809071C:
	lsls r1, r3, #1
	adds r2, r4, r1
	add r2, ip
	add r1, sb
	ldrb r7, [r5]
	lsls r0, r7, #0xc
	ldrh r1, [r1]
	adds r0, r1, r0
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1d
	bls _0809071C
	mov r0, r8
	adds r4, r6, r0
	movs r0, #3
	bl GetBgTilemapOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r6, r0
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xf
	bl CpuFastSet
_08090754:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090760: .4byte 0x0400001E
_08090764: .4byte 0x0840C7CE
_08090768: .4byte 0x02024460
