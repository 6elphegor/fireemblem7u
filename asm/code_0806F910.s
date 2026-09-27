	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806F910
sub_0806F910: @ 0x0806F910
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	str r0, [r7, #4]
_0806F924:
	ldr r1, _0806F934 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	ldr r1, [r7, #4]
	cmp r1, r0
	blt _0806F938
	b _0806FA38
	.align 2, 0
_0806F934: .4byte 0x0203E0FC
_0806F938:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r2, [r1, #0xe]
	strh r2, [r0]
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	ble _0806F97C
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #0
	subs r1, #0x10
	adds r2, r1, #0
	strh r2, [r0]
_0806F97C:
	adds r1, r7, #0
	adds r1, #8
	ldrh r0, [r1]
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r2, [r1, #0xd]
	lsls r1, r2, #4
	cmp r0, r1
	bge _0806F9D6
	adds r0, r7, #0
	adds r0, #8
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r1]
	adds r1, r2, #4
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #0
	adds r0, #8
	ldrh r1, [r0]
	movs r2, #0xf
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	bne _0806F9D6
	ldr r1, _0806FA30 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806F9D6
	ldr r1, _0806FA34 @ =0x00000395
	adds r0, r1, #0
	bl m4aSongNumStart
_0806F9D6:
	adds r0, r7, #0
	adds r0, #8
	ldr r1, _0806FA2C @ =0x0203E0FC
	ldr r2, [r7, #4]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1, #0xe]
	cmp r0, r1
	beq _0806FA24
	ldr r0, _0806FA2C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #8
	ldrh r2, [r0, #0xe]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0xe]
	ldr r1, [r7, #4]
	ldr r0, [r7]
	bl sub_0806FA6C
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #1
	strb r1, [r0]
_0806FA24:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806F924
	.align 2, 0
_0806FA2C: .4byte 0x0203E0FC
_0806FA30: .4byte 0x0202BBF8
_0806FA34: .4byte 0x00000395
_0806FA38:
	adds r0, r7, #0
	adds r0, #0xa
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0806FA60
	ldr r1, _0806FA68 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806FA60
	ldr r0, _0806FA68 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806FA60:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA68: .4byte 0x0203E0FC
