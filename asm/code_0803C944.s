	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C944
sub_0803C944: @ 0x0803C944
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0803C998 @ =0x08B98AEC
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _0803C956
	b _0803CCB6
_0803C956:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
_0803C964:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, _0803C998 @ =0x08B98AEC
	ldr r1, [r5]
	adds r1, #0x32
	bl sub_0803CF2C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne _0803C982
	b _0803CCAE
_0803C982:
	cmp r0, #0x16
	beq _0803C9B0
	cmp r0, #0x16
	bgt _0803C99C
	cmp r0, #4
	bne _0803C990
	b _0803CAE4
_0803C990:
	cmp r0, #0xa
	beq _0803C9B0
	b _0803CCAE
	.align 2, 0
_0803C998: .4byte 0x08B98AEC
_0803C99C:
	cmp r0, #0x2e
	beq _0803C9B0
	cmp r0, #0x2e
	bgt _0803C9AA
	cmp r0, #0x2a
	beq _0803C9B0
	b _0803CCAE
_0803C9AA:
	cmp r1, #0x80
	beq _0803C9B0
	b _0803CCAE
_0803C9B0:
	ldr r6, _0803CA08 @ =0x08B98AEC
	ldr r2, [r6]
	adds r5, r2, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0xdc
	beq _0803CA3C
	adds r3, r7, #1
	mov r8, r3
	cmp r0, #0xdf
	beq _0803C9C8
	b _0803CCAE
_0803C9C8:
	ldrb r0, [r5, #1]
	ldrb r4, [r5, #1]
	ldrb r1, [r2, #6]
	cmp r4, r1
	bne _0803C9D4
	b _0803CCAE
_0803C9D4:
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r4, [r5, #2]
	ldrh r0, [r0]
	cmp r4, r0
	beq _0803CA10
	ldr r0, _0803CA0C @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldrb r2, [r2, #6]
	lsls r1, r2, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	b _0803C964
	.align 2, 0
_0803CA08: .4byte 0x08B98AEC
_0803CA0C: .4byte 0x0300479C
_0803CA10:
	adds r0, r5, #0
	bl sub_0803D19C
	ldr r0, _0803CA38 @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldr r2, [r6]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r4, [r5, #1]
	orrs r1, r4
	strb r1, [r0, #1]
	ldrb r5, [r5, #1]
	lsls r1, r5, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, #1
	strh r1, [r0, #2]
	b _0803CAD4
	.align 2, 0
_0803CA38: .4byte 0x0300479C
_0803CA3C:
	movs r3, #0
	lsls r0, r7, #2
	adds r1, r7, #1
	mov r8, r1
	ldr r1, _0803CAA4 @ =0x0203D90C
	adds r0, r0, r7
	lsls r0, r0, #2
	subs r0, r0, r7
	adds r1, #0xa1
	adds r1, r0, r1
	adds r2, #0x38
_0803CA52:
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	cmp r3, #0x12
	ble _0803CA52
	lsrs r0, r4, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA7E
	ldr r0, _0803CAA8 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r2, [r0]
	ldrb r3, [r5, #2]
	cmp r2, r3
	bne _0803CA7E
	ldrh r0, [r0, #4]
	cmp r0, #5
	bls _0803CA8C
_0803CA7E:
	lsrs r0, r4, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CAB0
_0803CA8C:
	ldr r0, _0803CAA8 @ =0x08B98AEC
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _0803CA9A
	b _0803CCAE
_0803CA9A:
	ldr r0, _0803CAAC @ =0x0300479C
	movs r1, #0xd6
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b _0803CAD0
	.align 2, 0
_0803CAA4: .4byte 0x0203D90C
_0803CAA8: .4byte 0x08B98AEC
_0803CAAC: .4byte 0x0300479C
_0803CAB0:
	ldr r0, _0803CADC @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0803CABE
	b _0803CCAE
_0803CABE:
	movs r2, #0xd5
	ldrb r4, [r1]
	ldrb r5, [r5, #2]
	cmp r4, r5
	beq _0803CACA
	movs r2, #0xd7
_0803CACA:
	ldr r0, _0803CAE0 @ =0x0300479C
	strb r2, [r0]
	ldrb r1, [r1, #6]
_0803CAD0:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
_0803CAD4:
	movs r1, #4
	bl sub_0803CE34
	b _0803CCAE
	.align 2, 0
_0803CADC: .4byte 0x08B98AEC
_0803CAE0: .4byte 0x0300479C
_0803CAE4:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0xd4
	cmp r0, #0xa
	bls _0803CAF4
	b _0803CCAE
_0803CAF4:
	lsls r0, r0, #2
	ldr r1, _0803CB00 @ =_0803CB04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803CB00: .4byte _0803CB04
_0803CB04: @ jump table
	.4byte _0803CCA4 @ case 0
	.4byte _0803CC3C @ case 1
	.4byte _0803CC68 @ case 2
	.4byte _0803CBF8 @ case 3
	.4byte _0803CCAE @ case 4
	.4byte _0803CB30 @ case 5
	.4byte _0803CCAE @ case 6
	.4byte _0803CCAE @ case 7
	.4byte _0803CCAE @ case 8
	.4byte _0803CCAE @ case 9
	.4byte _0803CB48 @ case 10
_0803CB30:
	ldr r0, _0803CB44 @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r2, [r1, #0xa]
	orrs r0, r2
	strb r0, [r1, #0xa]
	b _0803CCAA
	.align 2, 0
_0803CB44: .4byte 0x08B98AEC
_0803CB48:
	ldr r6, _0803CBEC @ =0x08B98AEC
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803CB5C
	b _0803CCAE
_0803CB5C:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne _0803CB6A
	b _0803CCAE
_0803CB6A:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq _0803CB74
	b _0803CCAE
_0803CB74:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #2]
	cmp r5, r0
	beq _0803CB84
	b _0803CCAE
_0803CB84:
	movs r0, #1
	lsls r0, r4
	ldrb r4, [r3, #0xf]
	orrs r0, r4
	strb r0, [r3, #0xf]
	ldr r0, _0803CBF0 @ =0x030013D0
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xf]
	ands r0, r1
	ldrb r2, [r4, #9]
	cmp r0, r2
	beq _0803CBA8
	b _0803CCAE
_0803CBA8:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, _0803CBF4 @ =0x00001B74
	adds r1, r4, r2
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	adds r0, r4, r0
	movs r4, #0x9c
	lsls r4, r4, #1
	adds r0, r0, r4
	strb r3, [r0]
	ldr r0, [r6]
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0x1f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b _0803CCAE
	.align 2, 0
_0803CBEC: .4byte 0x08B98AEC
_0803CBF0: .4byte 0x030013D0
_0803CBF4: .4byte 0x00001B74
_0803CBF8:
	ldrb r0, [r5, #2]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803CCAE
	ldr r3, _0803CC38 @ =0x08B98AEC
	ldr r0, [r3]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r2, #2
	strb r2, [r0]
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r4, [r1, #2]
	ands r0, r4
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r2, [r1]
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r2, [r0]
	ldr r1, [r3]
	b _0803CC5C
	.align 2, 0
_0803CC38: .4byte 0x08B98AEC
_0803CC3C:
	ldrb r0, [r5, #2]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _0803CCAE
	ldr r2, _0803CC64 @ =0x08B98AEC
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
_0803CC5C:
	movs r0, #6
	strh r0, [r1, #4]
	b _0803CCAE
	.align 2, 0
_0803CC64: .4byte 0x08B98AEC
_0803CC68:
	ldr r0, _0803CC9C @ =0x0203D90C
	adds r0, #0x9c
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, _0803CCA0 @ =0x08B98AEC
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	movs r1, #5
	strb r1, [r0]
	ldr r0, [r3]
	ldrh r1, [r5, #2]
	lsls r2, r1
	ldrb r1, [r0, #9]
	orrs r2, r1
	strb r2, [r0, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r5, r0
	strb r4, [r0]
	b _0803CCAA
	.align 2, 0
_0803CC9C: .4byte 0x0203D90C
_0803CCA0: .4byte 0x08B98AEC
_0803CCA4:
	ldrb r0, [r5, #1]
	bl sub_0803C90C
_0803CCAA:
	adds r7, #1
	mov r8, r7
_0803CCAE:
	mov r7, r8
	cmp r7, #3
	bgt _0803CCB6
	b _0803C964
_0803CCB6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
