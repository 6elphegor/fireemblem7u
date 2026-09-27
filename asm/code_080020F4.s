	.include "macro.inc"

	.syntax unified

	thumb_func_start MaybeSmoothChangeSomePal
MaybeSmoothChangeSomePal: @ 0x080020F4
	push {r4, r5, r7, lr}
	sub sp, #0x20
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bge _0800210C
	movs r0, #0x20
	b _0800210E
_0800210C:
	movs r0, #0
_0800210E:
	str r0, [r7, #0x18]
	ldr r0, [r7, #4]
	adds r2, r0, #0
	lsls r1, r2, #1
	adds r1, r1, r0
	lsls r0, r1, #4
	str r0, [r7, #0x1c]
	movs r0, #0
	str r0, [r7, #0x10]
_08002120:
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _0800212A
	b _08002210
_0800212A:
	ldr r0, _08002154 @ =0x02022240
	ldr r1, [r7, #4]
	ldr r2, [r7, #0x10]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r2, [r7, #0xc]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0
	str r0, [r7, #0x14]
_0800214A:
	ldr r0, [r7, #0x14]
	cmp r0, #0xf
	ble _08002158
	b _08002208
	.align 2, 0
_08002154: .4byte 0x02022240
_08002158:
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	adds r3, r4, #0
	movs r4, #0x1f
	ands r3, r4
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #5
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r2, _08002204 @ =0x02022260
	adds r0, r7, #0
	adds r0, #0x1c
	ldr r1, [r0]
	adds r3, r1, #0
	adds r2, r2, r3
	ldr r3, [r7]
	ldrh r4, [r3]
	lsrs r3, r4, #0xa
	adds r4, r3, #0
	movs r5, #0x1f
	adds r3, r4, #0
	ands r3, r5
	ldr r5, [r7, #0x18]
	adds r4, r5, #0
	adds r5, r3, #0
	adds r3, r4, r5
	ldrb r4, [r2]
	movs r5, #0
	ands r4, r5
	adds r5, r4, #0
	adds r4, r5, #0
	orrs r4, r3
	adds r3, r4, #0
	strb r3, [r2]
	adds r1, #1
	str r1, [r0]
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #0x14]
	adds r1, r0, #1
	str r1, [r7, #0x14]
	b _0800214A
	.align 2, 0
_08002204: .4byte 0x02022260
_08002208:
	ldr r0, [r7, #0x10]
	adds r1, r0, #1
	str r1, [r7, #0x10]
	b _08002120
_08002210:
	add sp, #0x20
	pop {r4, r5, r7}
	pop {r0}
	bx r0
