	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyColorAddition_ClampMin
ApplyColorAddition_ClampMin: @ 0x08001624
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001644 @ =0x02022860
	str r0, [r7, #4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r7, #8]
	movs r0, #0
	str r0, [r7, #0xc]
_0800163A:
	ldr r0, [r7, #0xc]
	ldr r1, _08001648 @ =0x000001FF
	cmp r0, r1
	ble _0800164C
	b _080016E4
	.align 2, 0
_08001644: .4byte 0x02022860
_08001648: .4byte 0x000001FF
_0800164C:
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x10]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #5
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x14]
	ldr r0, [r7, #4]
	ldrh r1, [r0]
	lsrs r0, r1, #0xa
	adds r1, r0, #0
	movs r2, #0x1f
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	adds r0, r0, r1
	str r0, [r7, #0x18]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _080016A0
	movs r0, #0
	str r0, [r7, #0x10]
_080016A0:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bge _080016AA
	movs r0, #0
	str r0, [r7, #0x14]
_080016AA:
	ldr r0, [r7, #0x18]
	cmp r0, #0
	bge _080016B4
	movs r0, #0
	str r0, [r7, #0x18]
_080016B4:
	ldr r0, [r7, #8]
	ldr r1, [r7, #0x18]
	adds r2, r1, #0
	lsls r1, r2, #0xa
	ldr r3, [r7, #0x14]
	adds r2, r3, #0
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r1, r1, r2
	ldr r3, [r7, #0x10]
	adds r2, r3, #0
	adds r2, r1, r2
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #4]
	adds r1, r0, #2
	str r1, [r7, #4]
	ldr r0, [r7, #8]
	adds r1, r0, #2
	str r1, [r7, #8]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _0800163A
_080016E4:
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0
