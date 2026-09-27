	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsRecordDefeatInfo
PidStatsRecordDefeatInfo: @ 0x0809FEE8
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _0809FF52
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FF52
	lsls r1, r5, #4
	ldr r0, _0809FF58 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _0809FF52
	ldr r2, _0809FF5C @ =0x0202BBF8
	movs r1, #0xe
	ldrsb r1, [r2, r1]
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ldrb r5, [r3, #5]
	ands r0, r5
	orrs r0, r1
	strb r0, [r3, #5]
	ldr r1, _0809FF60 @ =0x000003FF
	ldrh r2, [r2, #0x10]
	ands r1, r2
	lsls r1, r1, #0xe
	ldr r0, [r3, #4]
	ldr r2, _0809FF64 @ =0xFF003FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #4]
	lsls r2, r6, #0xe
	ldr r0, [r3, #0xc]
	ldr r1, _0809FF68 @ =0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0xc]
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r3, #9]
	ands r0, r1
	orrs r0, r4
	strb r0, [r3, #9]
_0809FF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF58: .4byte 0x0203E790
_0809FF5C: .4byte 0x0202BBF8
_0809FF60: .4byte 0x000003FF
_0809FF64: .4byte 0xFF003FFF
_0809FF68: .4byte 0xFF803FFF
