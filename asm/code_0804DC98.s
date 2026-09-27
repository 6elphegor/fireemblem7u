	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxHpBarLive
NewEfxHpBarLive: @ 0x0804DC98
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _0804DCC8 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _0804DD64
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DCCC @ =0x08B9AC4C
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0804DCD4
	ldr r0, _0804DCD0 @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _0804DCDC
	.align 2, 0
_0804DCC8: .4byte 0x02017728
_0804DCCC: .4byte 0x08B9AC4C
_0804DCD0: .4byte 0x02000000
_0804DCD4:
	ldr r0, _0804DD34 @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_0804DCDC:
	str r0, [r6, #0x60]
	ldr r4, _0804DD38 @ =0x0203E05E
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
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne _0804DD3C
	movs r0, #1
	str r0, [r6, #0x58]
	b _0804DD4A
	.align 2, 0
_0804DD34: .4byte 0x02000000
_0804DD38: .4byte 0x0203E05E
_0804DD3C:
	cmp r0, r1
	ble _0804DD46
	movs r0, #1
	rsbs r0, r0, #0
	b _0804DD48
_0804DD46:
	movs r0, #1
_0804DD48:
	str r0, [r6, #0x48]
_0804DD4A:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DD6C @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804DD64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DD6C: .4byte 0x02017780
