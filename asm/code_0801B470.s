	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B470
sub_0801B470: @ 0x0801B470
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r2, _0801B51C @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B48C
	adds r1, r6, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B48C:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B4A2
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B4A2:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B4B0
	movs r0, #0
	strb r0, [r1]
_0801B4B0:
	ldr r7, _0801B520 @ =0x08CE4D28
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bge _0801B4C6
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_0801B4C6:
	ldr r1, [r2]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B512
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	adds r1, r7, #0
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r6, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801B524 @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0801B512:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B51C: .4byte 0x08B857F8
_0801B520: .4byte 0x08CE4D28
_0801B524: .4byte 0x02022C60
