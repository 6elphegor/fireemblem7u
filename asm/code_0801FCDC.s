	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801FCDC
sub_0801FCDC: @ 0x0801FCDC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetGameTime
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0801FCEE
	b _0801FE2C
_0801FCEE:
	bl ColorFadeTick_thm
	ldr r4, _0801FD7C @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0801FD06
	bl ApplyFlamesWeatherGradient
_0801FD06:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	adds r0, #0x8b
	ldrb r6, [r0]
	cmp r6, #0
	beq _0801FD88
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FD28
	movs r1, #2
_0801FD28:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0801FD80 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FD52
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FD46
	movs r1, #2
_0801FD46:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FD52:
	adds r3, r7, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0801FD84 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r5, r3, #0
	b _0801FDCE
	.align 2, 0
_0801FD7C: .4byte 0x0202BBF8
_0801FD80: .4byte 0x0000FFFF
_0801FD84: .4byte 0x03002870
_0801FD88:
	bl EnablePalSync
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r1, #7
	adds r5, r0, #0
	cmp r3, #0
	bge _0801FD9E
	adds r3, #7
_0801FD9E:
	asrs r3, r3, #3
	ldr r0, _0801FE34 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0xc
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #4
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x45
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r6, [r0]
_0801FDCE:
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0801FE1A
	ldr r4, _0801FE38 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FDF0
	movs r1, #2
_0801FDF0:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0801FE3C @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FE1A
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FE0E
	movs r1, #2
_0801FE0E:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FE1A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0801FE2C
	bl EnableTilesetPalAnim
	adds r0, r7, #0
	bl Proc_Break
_0801FE2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FE34: .4byte 0x03002870
_0801FE38: .4byte 0x0202BBF8
_0801FE3C: .4byte 0x0000FFFF
