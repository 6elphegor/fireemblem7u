	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804D0B8
sub_0804D0B8: @ 0x0804D0B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0804D0F8 @ =0x0201FAD0
	ldr r2, _0804D0FC @ =0x0203E028
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _0804D100 @ =0x08FC0008
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, _0804D104 @ =0x0203E02C
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt _0804D10C
	cmp r1, #1
	bge _0804D130
	cmp r1, #0
	beq _0804D114
	ldr r0, _0804D108 @ =0x020145C8
	b _0804D142
	.align 2, 0
_0804D0F8: .4byte 0x0201FAD0
_0804D0FC: .4byte 0x0203E028
_0804D100: .4byte 0x08FC0008
_0804D104: .4byte 0x0203E02C
_0804D108: .4byte 0x020145C8
_0804D10C:
	ldr r7, _0804D128 @ =0x020145C8
	mov ip, r7
	cmp r1, #4
	bne _0804D144
_0804D114:
	ldr r0, _0804D12C @ =0x0200003C
	ldr r1, _0804D128 @ =0x020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b _0804D144
	.align 2, 0
_0804D128: .4byte 0x020145C8
_0804D12C: .4byte 0x0200003C
_0804D130:
	ldr r0, _0804D1B4 @ =0x0200003C
	ldr r1, _0804D1B8 @ =0x02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, _0804D1BC @ =0xFFFFF800
	adds r0, r0, r1
_0804D142:
	mov ip, r0
_0804D144:
	ldr r0, _0804D1C0 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	ldr r0, _0804D1C4 @ =0x0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, _0804D1C8 @ =0x02000044
	ldr r1, _0804D1CC @ =0x08B9B29C
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, _0804D1D0 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08054F30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D1B4: .4byte 0x0200003C
_0804D1B8: .4byte 0x02014DC8
_0804D1BC: .4byte 0xFFFFF800
_0804D1C0: .4byte 0x0202BBF8
_0804D1C4: .4byte 0x0200004C
_0804D1C8: .4byte 0x02000044
_0804D1CC: .4byte 0x08B9B29C
_0804D1D0: .4byte 0x0203E00E
