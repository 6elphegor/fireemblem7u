	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTryHealSelf
AiTryHealSelf: @ 0x080397DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _08039858 @ =0x03004690
_080397E4:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803988A
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6b
	beq _08039808
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6c
	bne _08039884
_08039808:
	ldr r1, _0803985C @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08039860
	ldr r2, [r7]
	adds r1, r2, #0
	adds r1, #0x40
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08039860
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039884
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _08039878
	.align 2, 0
_08039858: .4byte 0x03004690
_0803985C: .4byte 0x0203A8EC
_08039860:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_08039878:
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _0803988C
_08039884:
	adds r6, #1
	cmp r6, #4
	ble _080397E4
_0803988A:
	movs r0, #0
_0803988C:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
