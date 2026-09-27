	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C79C
sub_0803C79C: @ 0x0803C79C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _0803C7D8 @ =0x08B98AEC
	ldr r2, [r0]
	adds r5, r0, #0
	ldrh r0, [r2, #4]
	cmp r0, #4
	bhi _0803C7AE
	b _0803C8DC
_0803C7AE:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _0803C7B6
	b _0803C8DC
_0803C7B6:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne _0803C844
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803C7F6
	cmp r0, #2
	bgt _0803C7DC
	cmp r0, #1
	beq _0803C81C
	b _0803C844
	.align 2, 0
_0803C7D8: .4byte 0x08B98AEC
_0803C7DC:
	cmp r0, #3
	bne _0803C844
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls _0803C7F6
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl StartSioErrorScreen
_0803C7F6:
	ldr r4, _0803C868 @ =0x08B98AEC
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _0803C81C
	bl sub_0803CD64
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne _0803C81C
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl StartSioErrorScreen
_0803C81C:
	movs r4, #0
	ldr r5, _0803C868 @ =0x08B98AEC
_0803C820:
	ldr r0, _0803C868 @ =0x08B98AEC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0803C83E
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl StartSioErrorScreen
_0803C83E:
	adds r4, #1
	cmp r4, #3
	ble _0803C820
_0803C844:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne _0803C8B8
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _0803C89A
	ldrb r1, [r1, #0x11]
	cmp r1, #0x3c
	bls _0803C86C
	bl StartSioErrorScreen
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b _0803C8DC
	.align 2, 0
_0803C868: .4byte 0x08B98AEC
_0803C86C:
	mov r0, sp
	bl sub_0803D210
	cmp r0, #0
	beq _0803C89A
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0803CE34
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0803C89A
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
_0803C89A:
	ldr r2, _0803C8B4 @ =0x08B98AEC
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b _0803C8DC
	.align 2, 0
_0803C8B4: .4byte 0x08B98AEC
_0803C8B8:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803C8DC
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0803C8DC
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	rsbs r1, r1, #0
	bl SioSend16
	ldr r1, [r5]
	ldr r0, _0803C8E4 @ =0x00005FFF
	strh r0, [r1, #0x30]
_0803C8DC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C8E4: .4byte 0x00005FFF
