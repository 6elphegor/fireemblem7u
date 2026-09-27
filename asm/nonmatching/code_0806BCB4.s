	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuInternal
StartMuInternal: @ 0x0806BCB4
	push {r4, r7, lr}
	sub sp, #0x1c
	mov r7, sp
	adds r4, r0, #0
	adds r0, r2, #0
	str r3, [r7, #8]
	adds r2, r7, #0
	adds r3, r4, #0
	strh r3, [r2]
	adds r2, r7, #2
	strh r1, [r2]
	adds r1, r7, #4
	strh r0, [r1]
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x1a
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	movs r1, #1
	cmn r0, r1
	bne _0806BCFA
	movs r0, #0xe0
	lsls r0, r0, #2
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl GetDefaultMuConfig
	str r0, [r7, #0x14]
	b _0806BD06
_0806BCFA:
	ldr r0, [r7, #8]
	adds r1, r7, #0
	adds r1, #0x1a
	bl GetNewMuConfig
	str r0, [r7, #0x14]
_0806BD06:
	ldr r0, [r7, #0x14]
	cmp r0, #0
	bne _0806BD10
	movs r0, #0
	b _0806BF44
_0806BD10:
	ldr r1, _0806BD3C @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_Find
	cmp r0, #0
	beq _0806BD24
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xfe
	strh r1, [r0]
_0806BD24:
	ldr r1, _0806BD3C @ =0x08C9D00C
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	bne _0806BD40
	movs r0, #0
	b _0806BF44
	.align 2, 0
_0806BD3C: .4byte 0x08C9D00C
_0806BD40:
	ldr r0, [r7, #0xc]
	movs r1, #0
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4c
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r7, #2
	ldrh r2, [r1]
	adds r1, r2, #0
	lsls r2, r1, #4
	adds r3, r2, #0
	lsls r1, r3, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x50
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x52
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x42
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xb
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x48
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r7, #0
	adds r0, #0x18
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x43
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7, #0xc]
	adds r0, r7, #4
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, [r7, #8]
	lsls r1, r2, #5
	ldr r3, _0806BF40 @ =0x06010000
	adds r2, r1, r3
	str r2, [r0, #0x38]
	ldr r0, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #0x1a
	adds r2, r0, #0
	adds r0, #0x3c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x46
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x44
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x28]
	adds r1, r2, #0
	ldrb r2, [r0, #1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #1]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #0
	bl GetMuAnimForJid
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0xa
	bl StartSpriteAnim
	str r0, [r7, #0x10]
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	bl GetMuImg
	adds r4, r0, #0
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl GetMuImgBufById
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #0x14]
	ldrb r1, [r0]
	adds r0, r1, #0
	bl GetMuImgBufById
	ldr r1, [r7, #0x10]
	str r0, [r1, #0x24]
	ldr r0, [r7, #0x10]
	ldr r1, [r7, #0x14]
	ldr r2, [r7, #0x14]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #0xc]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x10]
	str r1, [r0, #0x30]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	ldr r1, [r0, #0x34]
	ldr r0, [r7, #0xc]
	str r0, [r1, #0x48]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806BF44
	.align 2, 0
_0806BF40: .4byte 0x06010000
_0806BF44:
	add sp, #0x1c
	pop {r4, r7}
	pop {r1}
	bx r1
