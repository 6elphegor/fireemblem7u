	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804DA0C
sub_0804DA0C: @ 0x0804DA0C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804DAA6
	ldr r4, _0804DA88 @ =0x0203E05E
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne _0804DA78
	movs r0, #1
	str r0, [r6, #0x58]
_0804DA78:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _0804DA8C
	movs r0, #1
	rsbs r0, r0, #0
	b _0804DA8E
	.align 2, 0
_0804DA88: .4byte 0x0203E05E
_0804DA8C:
	movs r0, #1
_0804DA8E:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804DAAC @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_0804DAA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DAAC: .4byte 0x02017780
