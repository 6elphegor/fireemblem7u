	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHpBarResire
NewEfxHpBarResire: @ 0x0804D86C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0804D8A4 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804D93E
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804D8A8 @ =0x08B9ABEC
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804D8B0
	ldr r0, _0804D8AC @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804D8B8
	.align 2, 0
_0804D8A4: .4byte 0x02017728
_0804D8A8: .4byte 0x08B9ABEC
_0804D8AC: .4byte 0x02000000
_0804D8B0:
	ldr r0, _0804D90C @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804D8B8:
	str r0, [r6, #0x60]
	ldr r4, _0804D910 @ =0x0203E05E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _0804D914
	movs r0, #1
	rsbs r0, r0, #0
	b _0804D916
	.align 2, 0
_0804D90C: .4byte 0x02000000
_0804D910: .4byte 0x0203E05E
_0804D914:
	movs r0, #1
_0804D916:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, _0804D944 @ =0x02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D948 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0804D93E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D944: .4byte 0x02017750
_0804D948: .4byte 0x02017780
