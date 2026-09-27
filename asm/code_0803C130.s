	.include "macro.inc"

	.syntax unified

	thumb_func_start SioPollingMsg
SioPollingMsg: @ 0x0803C130
	push {r4, r5, lr}
	ldr r4, _0803C144 @ =0x03004748
	ldr r3, [r4]
	cmp r3, #0
	beq _0803C14C
	cmp r3, #1
	beq _0803C1B8
	ldr r0, _0803C148 @ =0x030013CC
	ldr r0, [r0]
	b _0803C242
	.align 2, 0
_0803C144: .4byte 0x03004748
_0803C148: .4byte 0x030013CC
_0803C14C:
	ldr r0, _0803C19C @ =0x04000134
	strh r3, [r0]
	ldr r2, _0803C1A0 @ =0x04000128
	ldr r0, _0803C1A4 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r1, _0803C1A8 @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r1, _0803C1AC @ =0x030013C8
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r0, r5, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0803C23E
	ldr r1, _0803C1B0 @ =0x030013CC
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	cmp r0, #0
	beq _0803C190
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_0803C190:
	ldr r0, _0803C1B4 @ =0x030046B8
	str r3, [r0]
	movs r0, #1
	str r0, [r4]
	b _0803C23E
	.align 2, 0
_0803C19C: .4byte 0x04000134
_0803C1A0: .4byte 0x04000128
_0803C1A4: .4byte 0x08B98AEC
_0803C1A8: .4byte 0x00001B78
_0803C1AC: .4byte 0x030013C8
_0803C1B0: .4byte 0x030013CC
_0803C1B4: .4byte 0x030046B8
_0803C1B8:
	ldr r0, _0803C1EC @ =0x04000128
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, _0803C1F0 @ =0x030046B8
	ldr r0, [r0]
	ldr r3, _0803C1F4 @ =0x08B98AEC
	cmp r0, #0
	beq _0803C200
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _0803C200
	ldr r1, [r3]
	ldr r0, _0803C1F8 @ =0x0000FFFF
	ldrh r1, [r1, #0x14]
	cmp r1, r0
	beq _0803C200
	ldr r1, _0803C1FC @ =0x030013CC
	movs r0, #0x30
	ands r2, r0
	lsrs r0, r2, #4
	str r0, [r1]
	movs r1, #2
	str r1, [r4]
	b _0803C242
	.align 2, 0
_0803C1EC: .4byte 0x04000128
_0803C1F0: .4byte 0x030046B8
_0803C1F4: .4byte 0x08B98AEC
_0803C1F8: .4byte 0x0000FFFF
_0803C1FC: .4byte 0x030013CC
_0803C200:
	ldr r2, _0803C220 @ =0x04000128
	ldr r0, [r3]
	ldr r1, _0803C224 @ =0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, _0803C228 @ =0x030013CC
	ldr r0, [r0]
	cmp r0, #0
	beq _0803C230
	ldr r1, _0803C22C @ =0x030013C8
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r0, r3, #0
	b _0803C238
	.align 2, 0
_0803C220: .4byte 0x04000128
_0803C224: .4byte 0x00001B78
_0803C228: .4byte 0x030013CC
_0803C22C: .4byte 0x030013C8
_0803C230:
	ldr r1, _0803C248 @ =0x030013C8
	movs r5, #0xc1
	lsls r5, r5, #7
	adds r0, r5, #0
_0803C238:
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0803C23E:
	movs r0, #1
	rsbs r0, r0, #0
_0803C242:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803C248: .4byte 0x030013C8
