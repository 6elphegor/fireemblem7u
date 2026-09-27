	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuDeathFade
StartMuDeathFade: @ 0x0806D5AC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #7
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, _0806D6CC @ =0x08C9D044
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x20
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0x3f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	ldr r2, [r7, #4]
	adds r1, r2, #0
	adds r2, #0x64
	movs r3, #0
	ldrsh r1, [r2, r3]
	asrs r2, r1, #1
	adds r1, r2, #0
	adds r2, r0, #0
	adds r0, #0x44
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x45
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x10
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806D6D0 @ =0x03002870
	adds r1, r0, #0
	adds r0, #0x46
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, [r7]
	movs r1, #0
	bl sub_0806E054
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1e]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0xd
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1e]
	ldr r1, _0806D6D4 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D6A0
	movs r0, #0xd6
	bl m4aSongNumStart
_0806D6A0:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806D6C4
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl TryRemoveUnitFromBallista
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl HideUnitSprite
_0806D6C4:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6CC: .4byte 0x08C9D044
_0806D6D0: .4byte 0x03002870
_0806D6D4: .4byte 0x0202BBF8
