	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateExtendedMovementMapOnRangeNeglectWall
GenerateExtendedMovementMapOnRangeNeglectWall: @ 0x0803BF60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BF88 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803BF88: .4byte 0x0202E3E8

	thumb_func_start sub_0803BF8C
sub_0803BF8C: @ 0x0803BF8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _0803BFBC @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803BFBC: .4byte 0x0202E3E8

	thumb_func_start sub_0803BFC0
sub_0803BFC0: @ 0x0803BFC0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_0803BE3C
	ldr r0, _0803BFF0 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BFF0: .4byte 0x0202E3E8

	thumb_func_start sub_0803BFF4
sub_0803BFF4: @ 0x0803BFF4
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_0803BE3C
	ldr r0, _0803C020 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C020: .4byte 0x0202E3E8

	thumb_func_start sub_0803C024
sub_0803C024: @ 0x0803C024
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_0803BE6C
	ldr r0, _0803C054 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C054: .4byte 0x0202E3E8

	thumb_func_start sub_0803C058
sub_0803C058: @ 0x0803C058
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_0803BE6C
	ldr r0, _0803C088 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C088: .4byte 0x0202E3E8

	thumb_func_start sub_0803C08C
sub_0803C08C: @ 0x0803C08C
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803C0C4 @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl BeginMapFlood
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C0C4: .4byte 0x0202E3E8

	thumb_func_start sub_0803C0C8
sub_0803C0C8: @ 0x0803C0C8
	adds r0, #0x40
	movs r1, #0x80
	lsls r1, r1, #6
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0803C0E8
	ldr r0, _0803C0E4 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0803C0F4
	.align 2, 0
_0803C0E4: .4byte 0x0203A8EC
_0803C0E8:
	ldr r1, _0803C0F8 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #0xfd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_0803C0F4:
	bx lr
	.align 2, 0
_0803C0F8: .4byte 0x0203A8EC

	thumb_func_start AiMapFloodRangeFrom
AiMapFloodRangeFrom: @ 0x0803C0FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _0803C12C @ =0x0202E3E8
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl BeginMapFlood
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C12C: .4byte 0x0202E3E8

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

	thumb_func_start GetSioIndex
GetSioIndex: @ 0x0803C24C
	ldr r0, _0803C258 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_0803C258: .4byte 0x04000128

	thumb_func_start sub_0803C25C
sub_0803C25C: @ 0x0803C25C
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0803C284 @ =0x08B98AEC
	ldr r3, [r3]
	ldr r5, _0803C288 @ =0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, _0803C28C @ =0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, _0803C290 @ =0x030013C8
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C284: .4byte 0x08B98AEC
_0803C288: .4byte 0x00001B78
_0803C28C: .4byte 0x00001B7A
_0803C290: .4byte 0x030013C8

	thumb_func_start sub_0803C294
sub_0803C294: @ 0x0803C294
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0803C3E4 @ =0x030046B4
	movs r3, #0
	str r3, [r0]
	ldr r2, _0803C3E8 @ =0x08B98AEC
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, _0803C3EC @ =0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, _0803C3F0 @ =0x030013D8
	mov sb, r0
	ldr r1, _0803C3F4 @ =0x030013DA
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
_0803C2E8:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble _0803C2E8
	movs r3, #0
	ldr r5, _0803C3F8 @ =0x030047B0
	movs r2, #0
	ldr r4, _0803C3E8 @ =0x08B98AEC
_0803C318:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble _0803C318
	movs r4, #0
	ldr r5, _0803C3E8 @ =0x08B98AEC
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
_0803C336:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
_0803C342:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C342
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble _0803C336
	movs r4, #0
	ldr r2, _0803C3E8 @ =0x08B98AEC
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, _0803C3FC @ =0x000012B4
_0803C360:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
_0803C376:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0803C376
	adds r4, r2, #0
	cmp r4, #0xf
	ble _0803C360
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, sb
	strh r0, [r1]
	movs r1, #0
	ldr r0, _0803C400 @ =0x0203C50C
	movs r3, #0x80
	lsls r3, r3, #2
_0803C398:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0803C398
	movs r4, #0
	ldr r2, _0803C404 @ =0x030013E0
	mov r8, r2
	movs r5, #0
	ldr r0, _0803C408 @ =0x000001FF
	mov ip, r0
	ldr r7, _0803C40C @ =0x0203C90C
	ldr r6, _0803C410 @ =0x030013E8
_0803C3B2:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
_0803C3C6:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne _0803C3C6
	adds r4, r2, #0
	cmp r4, #3
	ble _0803C3B2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C3E4: .4byte 0x030046B4
_0803C3E8: .4byte 0x08B98AEC
_0803C3EC: .4byte 0x00001B74
_0803C3F0: .4byte 0x030013D8
_0803C3F4: .4byte 0x030013DA
_0803C3F8: .4byte 0x030047B0
_0803C3FC: .4byte 0x000012B4
_0803C400: .4byte 0x0203C50C
_0803C404: .4byte 0x030013E0
_0803C408: .4byte 0x000001FF
_0803C40C: .4byte 0x0203C90C
_0803C410: .4byte 0x030013E8

	thumb_func_start sub_0803C414
sub_0803C414: @ 0x0803C414
	push {r4, lr}
	ldr r2, _0803C470 @ =0x08B98AEC
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, _0803C474 @ =0x00006581
	movs r1, #3
	movs r2, #0x88
	bl sub_0803C25C
	movs r0, #0
	bl sub_0803D500
	bl sub_0803C294
	ldr r0, _0803C478 @ =0x030013D4
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C470: .4byte 0x08B98AEC
_0803C474: .4byte 0x00006581
_0803C478: .4byte 0x030013D4

	thumb_func_start SioRegisterIrq
SioRegisterIrq: @ 0x0803C47C
	push {r4, lr}
	ldr r0, _0803C4CC @ =0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, _0803C4D0 @ =0x04000128
	ldr r1, _0803C4D4 @ =0x030013C8
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0803C4D8 @ =0x0400010E
	strh r3, [r0]
	ldr r2, _0803C4DC @ =0x030046B8
	ldr r1, _0803C4E0 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C4E4 @ =0x03004748
	str r0, [r1]
	ldr r1, _0803C4E8 @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	ldr r1, _0803C4EC @ =sub_0803C558
	movs r0, #7
	bl SetIrqFunc
	ldr r1, _0803C4F0 @ =sub_0803C8E8
	movs r0, #6
	bl SetIrqFunc
	ldr r2, _0803C4F4 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C4CC: .4byte 0x04000134
_0803C4D0: .4byte 0x04000128
_0803C4D4: .4byte 0x030013C8
_0803C4D8: .4byte 0x0400010E
_0803C4DC: .4byte 0x030046B8
_0803C4E0: .4byte 0x030046B4
_0803C4E4: .4byte 0x03004748
_0803C4E8: .4byte 0x030013CC
_0803C4EC: .4byte sub_0803C558
_0803C4F0: .4byte sub_0803C8E8
_0803C4F4: .4byte 0x04000200

	thumb_func_start SioReleaseIrq
SioReleaseIrq: @ 0x0803C4F8
	push {lr}
	ldr r1, _0803C53C @ =0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803C540 @ =0x030046B8
	ldr r1, _0803C544 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _0803C548 @ =0x03004748
	str r0, [r1]
	ldr r1, _0803C54C @ =0x030013CC
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIrqFunc
	movs r0, #6
	movs r1, #0
	bl SetIrqFunc
	ldr r2, _0803C550 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0803C554 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0803C53C: .4byte 0x04000134
_0803C540: .4byte 0x030046B8
_0803C544: .4byte 0x030046B4
_0803C548: .4byte 0x03004748
_0803C54C: .4byte 0x030013CC
_0803C550: .4byte 0x04000200
_0803C554: .4byte 0x0000FF3F

	thumb_func_start sub_0803C558
sub_0803C558: @ 0x0803C558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov sb, r0
	ldr r0, _0803C5EC @ =0x030046B8
	movs r2, #1
	str r2, [r0]
	ldr r1, _0803C5F0 @ =0x08B98AEC
	ldr r0, [r1]
	mov r3, sb
	strb r3, [r0, #0x1e]
	ldr r0, _0803C5F4 @ =0x030046B4
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, _0803C5F8 @ =0x0400010E
	mov r5, sb
	strh r5, [r0]
	ldr r2, [r1]
	ldr r3, _0803C5FC @ =0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq _0803C59C
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
_0803C59C:
	ldr r0, _0803C600 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, _0803C604 @ =0x030013C8
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r0, r2, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _0803C608 @ =0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, _0803C60C @ =0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
_0803C5C2:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803C610
	cmp r0, sl
	beq _0803C610
	ldr r1, _0803C5F0 @ =0x08B98AEC
	ldr r0, [r1]
	adds r0, #0xb
	adds r2, r0, r5
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803C5DE
	movs r0, #1
	strb r0, [r2]
_0803C5DE:
	ldr r1, [r1]
	movs r0, #1
	lsls r0, r5
	ldrb r2, [r1, #8]
	orrs r0, r2
	strb r0, [r1, #8]
	b _0803C64A
	.align 2, 0
_0803C5EC: .4byte 0x030046B8
_0803C5F0: .4byte 0x08B98AEC
_0803C5F4: .4byte 0x030046B4
_0803C5F8: .4byte 0x0400010E
_0803C5FC: .4byte 0x04000128
_0803C600: .4byte 0x04000120
_0803C604: .4byte 0x030013C8
_0803C608: .4byte 0x00007FFF
_0803C60C: .4byte 0x0000FFFF
_0803C610:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C64A
	ldr r0, _0803C63C @ =0x08B98AEC
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne _0803C640
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	ldrb r1, [r0]
	adds r1, #1
	b _0803C648
	.align 2, 0
_0803C63C: .4byte 0x08B98AEC
_0803C640:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
_0803C648:
	strb r1, [r0]
_0803C64A:
	ldr r3, _0803C6A4 @ =0x08B98AEC
	mov r8, r3
	ldr r6, [r3]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	mov ip, r3
	ldr r1, _0803C6A8 @ =0x0203C90C
	ldr r2, _0803C6AC @ =0x030013E8
	adds r2, r7, r2
	ldrh r3, [r2]
	lsls r0, r3, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldr r0, _0803C6B0 @ =0x0000FFFF
	ldrh r1, [r4]
	ands r0, r1
	mov r3, ip
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r1, _0803C6B4 @ =0x000001FF
	mov ip, r1
	mov r3, ip
	ands r0, r3
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _0803C5C2
	mov r4, r8
	adds r0, r6, #0
	ldrh r5, [r0, #4]
	cmp r5, #4
	bls _0803C770
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _0803C6B8
	cmp r0, #3
	beq _0803C718
	b _0803C770
	.align 2, 0
_0803C6A4: .4byte 0x08B98AEC
_0803C6A8: .4byte 0x0203C90C
_0803C6AC: .4byte 0x030013E8
_0803C6B0: .4byte 0x0000FFFF
_0803C6B4: .4byte 0x000001FF
_0803C6B8:
	ldr r0, _0803C704 @ =0x030013DA
	ldr r2, _0803C708 @ =0x030013D8
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq _0803C6DE
	ldr r1, _0803C70C @ =0x0203C50C
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl SioSend16
_0803C6DE:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0803C770
	ldr r5, _0803C710 @ =0x00001B7C
	adds r2, r1, r5
	ldrh r0, [r2]
	cmp r0, #0
	beq _0803C770
	ldr r1, _0803C714 @ =0x0400010C
	ldrh r2, [r2]
	rsbs r0, r2, #0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b _0803C770
	.align 2, 0
_0803C704: .4byte 0x030013DA
_0803C708: .4byte 0x030013D8
_0803C70C: .4byte 0x0203C50C
_0803C710: .4byte 0x00001B7C
_0803C714: .4byte 0x0400010C
_0803C718:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0803C732
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl SioSend16
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0803C788 @ =0x00005FFF
	strh r0, [r1, #0x30]
_0803C732:
	movs r5, #0
	ldr r6, _0803C78C @ =0x00001286
	mov r4, sp
_0803C738:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C756
	ldrh r1, [r4]
	cmp r1, r6
	beq _0803C756
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_0803C756:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _0803C738
	mov r2, sb
	cmp r2, #0
	bne _0803C770
	ldr r0, _0803C790 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r3, _0803C794 @ =0x00001B7E
	adds r0, r0, r3
	movs r1, #1
	strh r1, [r0]
_0803C770:
	ldr r1, _0803C798 @ =0x030046B4
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C788: .4byte 0x00005FFF
_0803C78C: .4byte 0x00001286
_0803C790: .4byte 0x08B98AEC
_0803C794: .4byte 0x00001B7E
_0803C798: .4byte 0x030046B4

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

	thumb_func_start sub_0803C8E8
sub_0803C8E8: @ 0x0803C8E8
	ldr r1, _0803C900 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803C904 @ =0x04000128
	ldr r1, _0803C908 @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0803C900: .4byte 0x0400010E
_0803C904: .4byte 0x04000128
_0803C908: .4byte 0x030013C8

	thumb_func_start sub_0803C90C
sub_0803C90C: @ 0x0803C90C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, _0803C93C @ =0x081D3BFC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0803C940 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803C934
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_0803C934:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803C93C: .4byte 0x081D3BFC
_0803C940: .4byte 0x0202BBF8

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

	thumb_func_start sub_0803CCC0
sub_0803CCC0: @ 0x0803CCC0
	bx lr
	.align 2, 0

	thumb_func_start sub_0803CCC4
sub_0803CCC4: @ 0x0803CCC4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0803CCCA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CCE0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803CCE0:
	adds r4, #1
	cmp r4, #3
	ble _0803CCCA
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803CCF0
sub_0803CCF0: @ 0x0803CCF0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0803CCF6:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD0C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803CD0C:
	adds r4, #1
	cmp r4, #3
	ble _0803CCF6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803CD1C
sub_0803CD1C: @ 0x0803CD1C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CD38 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803CD3C
	movs r0, #0
	b _0803CD3E
	.align 2, 0
_0803CD38: .4byte 0x08B98AEC
_0803CD3C:
	movs r0, #1
_0803CD3E:
	bx lr

	thumb_func_start sub_0803CD40
sub_0803CD40: @ 0x0803CD40
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CD5C @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	adds r0, r1, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0803CD60
	movs r0, #0
	b _0803CD62
	.align 2, 0
_0803CD5C: .4byte 0x08B98AEC
_0803CD60:
	movs r0, #1
_0803CD62:
	bx lr

	thumb_func_start sub_0803CD64
sub_0803CD64: @ 0x0803CD64
	push {r4, lr}
	ldr r2, _0803CD90 @ =0x08B98AEC
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne _0803CD98
	ldr r0, _0803CD94 @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0803CD98
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0803CDA0
	.align 2, 0
_0803CD90: .4byte 0x08B98AEC
_0803CD94: .4byte 0x04000128
_0803CD98:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
_0803CDA0:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _0803CDAE
	movs r0, #1
	b _0803CDB0
_0803CDAE:
	movs r0, #0
_0803CDB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803CDB8
sub_0803CDB8: @ 0x0803CDB8
	ldr r0, _0803CDD4 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r2, _0803CDD8 @ =0x00001B75
	adds r1, r0, r2
	ldr r3, _0803CDDC @ =0x00001B74
	adds r0, r0, r3
	ldrb r2, [r1]
	ldrb r3, [r0]
	cmp r2, r3
	bhs _0803CDE0
	adds r0, r3, #0
	subs r0, #0x20
	subs r0, r2, r0
	b _0803CDE6
	.align 2, 0
_0803CDD4: .4byte 0x08B98AEC
_0803CDD8: .4byte 0x00001B75
_0803CDDC: .4byte 0x00001B74
_0803CDE0:
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r0, r1, r0
_0803CDE6:
	bx lr

	thumb_func_start sub_0803CDE8
sub_0803CDE8: @ 0x0803CDE8
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _0803CE28 @ =0x08B98AEC
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
_0803CDF6:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0803CE00
	adds r2, #1
_0803CE00:
	adds r1, #1
	cmp r1, #3
	ble _0803CDF6
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _0803CE12
	cmp r2, #2
	beq _0803CE22
_0803CE12:
	cmp r0, #7
	bne _0803CE1A
	cmp r2, #3
	beq _0803CE22
_0803CE1A:
	cmp r0, #0xf
	bne _0803CE2C
	cmp r2, #4
	bne _0803CE2C
_0803CE22:
	movs r0, #1
	b _0803CE2E
	.align 2, 0
_0803CE28: .4byte 0x08B98AEC
_0803CE2C:
	movs r0, #0
_0803CE2E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803CE34
sub_0803CE34: @ 0x0803CE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _0803CED4 @ =0x030013DA
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi _0803CECC
	lsrs r5, r1, #0x11
	ldr r1, _0803CED8 @ =0x00004FFF
	adds r4, r5, r1
	ldr r2, _0803CEDC @ =0x0203C50C
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, _0803CEE0 @ =0x000001FF
	ands r3, r6
	ldr r0, _0803CEE4 @ =0x030013D8
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq _0803CECC
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq _0803CECC
	movs r2, #0
	cmp r2, r5
	bge _0803CEA8
	mov r3, sb
_0803CE8A:
	adds r2, #1
	ldrh r0, [r3]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt _0803CE8A
_0803CEA8:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, _0803CEE0 @ =0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq _0803CECC
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne _0803CEE8
_0803CECC:
	movs r0, #1
	rsbs r0, r0, #0
	b _0803CF18
	.align 2, 0
_0803CED4: .4byte 0x030013DA
_0803CED8: .4byte 0x00004FFF
_0803CEDC: .4byte 0x0203C50C
_0803CEE0: .4byte 0x000001FF
_0803CEE4: .4byte 0x030013D8
_0803CEE8:
	movs r2, #0
	cmp r2, r5
	bge _0803CF10
	mov r8, ip
	adds r7, r4, #0
	mov r4, sb
	mov r6, sl
_0803CEF6:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq _0803CECC
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt _0803CEF6
_0803CF10:
	ldr r1, _0803CF28 @ =0x030013DA
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
_0803CF18:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803CF28: .4byte 0x030013DA

	thumb_func_start sub_0803CF2C
sub_0803CF2C: @ 0x0803CF2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r1, _0803CFA4 @ =0x030013E0
	lsrs r3, r0, #0x18
	str r3, [sp]
	asrs r2, r0, #0x17
	adds r3, r2, r1
	ldr r0, _0803CFA8 @ =0x030013E8
	adds r7, r2, r0
	ldrh r5, [r7]
	mov sl, r1
	ldrh r0, [r3]
	cmp r0, r5
	beq _0803D02E
	ldr r1, _0803CFAC @ =0x0203C90C
	ldrh r4, [r3]
	lsls r0, r4, #3
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r6, _0803CFB0 @ =0x00004FFF
	mov sb, r1
	ldrh r0, [r0]
	cmp r0, r6
	beq _0803CFB8
	cmp r4, r5
	beq _0803CFE6
	adds r4, r2, #0
	adds r2, r3, #0
	mov ip, r6
	adds r3, r7, #0
	ldr r6, _0803CFB4 @ =0x000001FF
	mov r5, sb
_0803CF80:
	ldrh r0, [r2]
	adds r0, #1
	ands r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne _0803CF9C
	ldrh r7, [r3]
	cmp r1, r7
	bne _0803CFB8
_0803CF9C:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0803CF80
	b _0803CFE6
	.align 2, 0
_0803CFA4: .4byte 0x030013E0
_0803CFA8: .4byte 0x030013E8
_0803CFAC: .4byte 0x0203C90C
_0803CFB0: .4byte 0x00004FFF
_0803CFB4: .4byte 0x000001FF
_0803CFB8:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, _0803CFD8 @ =0x030013E8
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bhs _0803CFDC
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b _0803CFDE
	.align 2, 0
_0803CFD8: .4byte 0x030013E8
_0803CFDC:
	subs r0, r2, r1
_0803CFDE:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi _0803CFEC
_0803CFE6:
	movs r0, #4
	rsbs r0, r0, #0
	b _0803D0D4
_0803CFEC:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r3, [r0]
	adds r3, #1
	ldr r0, _0803D000 @ =0x000001FF
	cmp r3, r0
	bgt _0803D004
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b _0803D006
	.align 2, 0
_0803D000: .4byte 0x000001FF
_0803D004:
	movs r0, #0
_0803D006:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r6, [r0]
	cmp r6, #0x80
	bls _0803D028
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _0803D024 @ =0x000001FF
	ands r1, r2
	strh r1, [r0]
	b _0803CFE6
	.align 2, 0
_0803D024: .4byte 0x000001FF
_0803D028:
	adds r0, r6, #6
	cmp r0, r1
	ble _0803D034
_0803D02E:
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D0D4
_0803D034:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, _0803D0C8 @ =0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, sb
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, _0803D0CC @ =0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge _0803D0B6
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
_0803D07E:
	ldrh r7, [r4]
	lsls r0, r7, #3
	add r0, ip
	add r0, sb
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, _0803D0C8 @ =0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt _0803D07E
_0803D0B6:
	ldr r2, [sp, #8]
	cmp r8, r2
	bne _0803D0C2
	ldr r3, [sp, #0xc]
	cmp r3, sl
	beq _0803D0D0
_0803D0C2:
	movs r0, #3
	rsbs r0, r0, #0
	b _0803D0D4
	.align 2, 0
_0803D0C8: .4byte 0x000001FF
_0803D0CC: .4byte 0x00004FFF
_0803D0D0:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
_0803D0D4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SioSend16
SioSend16: @ 0x0803D0E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803D0FC @ =0x08B98AEC
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0803D100
	adds r0, r2, #0
	b _0803D122
	.align 2, 0
_0803D0FC: .4byte 0x08B98AEC
_0803D100:
	ldr r2, _0803D128 @ =0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0803D120
	cmp r1, #0
	bge _0803D120
	ldr r1, _0803D12C @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
_0803D120:
	movs r0, #0
_0803D122:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803D128: .4byte 0x04000128
_0803D12C: .4byte 0x030013C8

	thumb_func_start sub_0803D130
sub_0803D130: @ 0x0803D130
	push {r4, r5, r6, r7, lr}
	adds r2, r1, #0
	ldr r1, _0803D158 @ =0x030013E0
	ldr r0, _0803D15C @ =0x030013E8
	ldrh r3, [r1]
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803D164
	ldr r7, _0803D160 @ =0x00007FFF
	adds r0, r7, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	rsbs r0, r0, #0
	b _0803D18E
	.align 2, 0
_0803D158: .4byte 0x030013E0
_0803D15C: .4byte 0x030013E8
_0803D160: .4byte 0x00007FFF
_0803D164:
	movs r4, #0
	ldr r6, _0803D194 @ =0x0203C90C
	ldr r5, _0803D198 @ =0x000001FF
	adds r3, r1, #0
_0803D16C:
	lsls r0, r4, #1
	ldrh r7, [r3]
	lsls r1, r7, #3
	adds r0, r0, r1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _0803D16C
	movs r0, #0
_0803D18E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D194: .4byte 0x0203C90C
_0803D198: .4byte 0x000001FF

	thumb_func_start sub_0803D19C
sub_0803D19C: @ 0x0803D19C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _0803D204 @ =0x08B98AEC
	ldr r2, [r3]
	ldr r0, _0803D208 @ =0x00001B77
	adds r1, r2, r0
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D20C @ =0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge _0803D1E4
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
_0803D1D4:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt _0803D1D4
_0803D1E4:
	ldr r0, [r6]
	ldr r2, _0803D208 @ =0x00001B77
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D204: .4byte 0x08B98AEC
_0803D208: .4byte 0x00001B77
_0803D20C: .4byte 0x000012B4

	thumb_func_start sub_0803D210
sub_0803D210: @ 0x0803D210
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0803D260 @ =0x08B98AEC
	ldr r3, [r0]
	ldr r0, _0803D264 @ =0x00001B74
	adds r4, r3, r0
	movs r6, #0x8c
	ldrb r1, [r4]
	adds r5, r1, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xdf
	bne _0803D26C
	ldr r1, _0803D268 @ =0x030013D0
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r1, [r4]
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r4, [r4]
	adds r0, r4, #0
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b _0803D26E
	.align 2, 0
_0803D260: .4byte 0x08B98AEC
_0803D264: .4byte 0x00001B74
_0803D268: .4byte 0x030013D0
_0803D26C:
	movs r0, #0
_0803D26E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SioEmitData
SioEmitData: @ 0x0803D274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, _0803D310 @ =0x030013D4
	movs r0, #1
	str r0, [r6]
	ldr r4, _0803D314 @ =0x08B98AEC
	ldr r1, [r4]
	ldr r2, _0803D318 @ =0x00001B75
	adds r0, r1, r2
	movs r5, #0x8c
	ldrb r0, [r0]
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r2, [r2]
	adds r0, r2, #0
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0xdf
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bhs _0803D2E8
	adds r2, #6
_0803D2D4:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	blo _0803D2D4
_0803D2E8:
	ldr r1, [r6]
	ldr r3, _0803D318 @ =0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	movs r1, #0x1f
	ldrb r3, [r2]
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D310: .4byte 0x030013D4
_0803D314: .4byte 0x08B98AEC
_0803D318: .4byte 0x00001B75

	thumb_func_start SioReceiveData
SioReceiveData: @ 0x0803D31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	mov sl, r2
_0803D32E:
	ldr r0, _0803D35C @ =0x08B98AEC
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _0803D360 @ =0x00001B76
	adds r1, r2, r7
	movs r0, #0x8c
	ldrb r1, [r1]
	muls r0, r1, r0
	ldr r1, _0803D364 @ =0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r3, [r5, #4]
	cmp r3, #0xdf
	bne _0803D356
	ldrb r0, [r6, #1]
	ldrb r1, [r6, #1]
	ldrb r3, [r2, #6]
	cmp r1, r3
	bne _0803D368
_0803D356:
	movs r0, #0
	b _0803D490
	.align 2, 0
_0803D35C: .4byte 0x08B98AEC
_0803D360: .4byte 0x00001B76
_0803D364: .4byte 0x000012B4
_0803D368:
	lsls r0, r0, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0803D3B4
	ldr r0, _0803D3B0 @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldrb r2, [r2, #6]
	lsls r1, r2, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r6, [r6, #1]
	lsls r1, r6, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	strb r4, [r5, #4]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r3]
	adds r1, r1, r7
	b _0803D422
	.align 2, 0
_0803D3B0: .4byte 0x0300479C
_0803D3B4:
	movs r2, #0
	ldrh r3, [r6, #4]
	cmp r2, r3
	bhs _0803D3D6
	adds r3, r5, #0
	adds r3, #0xa
_0803D3C0:
	mov r0, sb
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	blo _0803D3C0
_0803D3D6:
	mov r2, sl
	cmp r2, #0
	beq _0803D438
	mov r0, sb
	bl sub_080BFC74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D438
	ldr r0, _0803D42C @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldr r4, _0803D430 @ =0x08B98AEC
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	movs r5, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	strb r5, [r6]
	ldr r0, [r4]
	ldr r2, _0803D434 @ =0x00001B76
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r4]
	adds r1, r1, r2
_0803D422:
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	b _0803D32E
	.align 2, 0
_0803D42C: .4byte 0x0300479C
_0803D430: .4byte 0x08B98AEC
_0803D434: .4byte 0x00001B76
_0803D438:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _0803D4A0 @ =0x08B98AEC
	ldr r2, [r4]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x26
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r3, _0803D4A4 @ =0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	movs r0, #0xf
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	ldr r0, [sp]
	strb r5, [r0]
	ldr r0, _0803D4A8 @ =0x0300479C
	movs r1, #0xde
	strb r1, [r0]
	ldr r2, [r4]
	ldrb r3, [r2, #6]
	lsls r1, r3, #4
	ldrb r3, [r6, #1]
	orrs r1, r3
	strb r1, [r0, #1]
	ldrb r3, [r6, #1]
	lsls r1, r3, #1
	adds r2, #0x26
	adds r2, r2, r1
	ldrh r1, [r2]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	ldrh r0, [r6, #4]
_0803D490:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D4A0: .4byte 0x08B98AEC
_0803D4A4: .4byte 0x00001B76
_0803D4A8: .4byte 0x0300479C

	thumb_func_start sub_0803D4AC
sub_0803D4AC: @ 0x0803D4AC
	push {lr}
	sub sp, #4
	ldr r1, _0803D4E8 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0803D4EC @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803D4F0 @ =0x030013DA
	ldr r0, _0803D4F4 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803D4F8 @ =0x030013E0
	ldr r2, _0803D4FC @ =0x030013E8
	movs r1, #3
_0803D4D4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D4D4
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803D4E8: .4byte 0x00007FFF
_0803D4EC: .4byte 0x08B98AEC
_0803D4F0: .4byte 0x030013DA
_0803D4F4: .4byte 0x030013D8
_0803D4F8: .4byte 0x030013E0
_0803D4FC: .4byte 0x030013E8

	thumb_func_start sub_0803D500
sub_0803D500: @ 0x0803D500
	ldr r1, _0803D50C @ =0x08B98AEC
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D50C: .4byte 0x08B98AEC

	thumb_func_start sub_0803D510
sub_0803D510: @ 0x0803D510
	push {lr}
	sub sp, #4
	ldr r1, _0803D564 @ =0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0803D568 @ =0x08B98AEC
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _0803D56C @ =0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl SioSend16
	ldr r1, _0803D570 @ =0x030013DA
	ldr r0, _0803D574 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _0803D578 @ =0x030013E0
	ldr r2, _0803D57C @ =0x030013E8
	movs r1, #3
_0803D540:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D540
	ldr r0, _0803D568 @ =0x08B98AEC
	ldr r2, [r0]
	ldr r0, _0803D580 @ =0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0803D564: .4byte 0x00007FFF
_0803D568: .4byte 0x08B98AEC
_0803D56C: .4byte 0x00001B7C
_0803D570: .4byte 0x030013DA
_0803D574: .4byte 0x030013D8
_0803D578: .4byte 0x030013E0
_0803D57C: .4byte 0x030013E8
_0803D580: .4byte 0x00001B7E

	thumb_func_start sub_0803D584
sub_0803D584: @ 0x0803D584
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803D5E0 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803D5E4 @ =0x08B98AEC
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803D5E8 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, _0803D5EC @ =0x030013DA
	ldr r0, _0803D5F0 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803D5F4 @ =0x030013E0
	ldr r2, _0803D5F8 @ =0x030013E8
	movs r1, #3
_0803D5B4:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D5B4
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D5E0: .4byte 0x00002586
_0803D5E4: .4byte 0x08B98AEC
_0803D5E8: .4byte 0x00001B7C
_0803D5EC: .4byte 0x030013DA
_0803D5F0: .4byte 0x030013D8
_0803D5F4: .4byte 0x030013E0
_0803D5F8: .4byte 0x030013E8

	thumb_func_start sub_0803D5FC
sub_0803D5FC: @ 0x0803D5FC
	push {r4, lr}
	sub sp, #4
	ldr r1, _0803D658 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _0803D65C @ =0x08B98AEC
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _0803D660 @ =0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, _0803D664 @ =0x030013DA
	ldr r0, _0803D668 @ =0x030013D8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _0803D66C @ =0x030013E0
	ldr r2, _0803D670 @ =0x030013E8
	movs r1, #3
_0803D62C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0803D62C
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D658: .4byte 0x00002586
_0803D65C: .4byte 0x08B98AEC
_0803D660: .4byte 0x00001B7C
_0803D664: .4byte 0x030013DA
_0803D668: .4byte 0x030013D8
_0803D66C: .4byte 0x030013E0
_0803D670: .4byte 0x030013E8

	thumb_func_start sub_0803D674
sub_0803D674: @ 0x0803D674
	ldr r0, _0803D680 @ =0x030013DA
	ldr r1, _0803D684 @ =0x030013D8
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0803D680: .4byte 0x030013DA
_0803D684: .4byte 0x030013D8

	thumb_func_start sub_0803D688
sub_0803D688: @ 0x0803D688
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0803D6E4 @ =0x08B98AEC
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_0803C294
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D6E4: .4byte 0x08B98AEC

	thumb_func_start sub_0803D6E8
sub_0803D6E8: @ 0x0803D6E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803D6F6
	bl _call_via_r1
_0803D6F6:
	ldr r5, _0803D754 @ =0x08B98AEC
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne _0803D74C
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq _0803D72A
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803D72A:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl SioEmitData
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803D74C
	adds r0, r4, #0
	bl Proc_Break
_0803D74C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D754: .4byte 0x08B98AEC

	thumb_func_start sub_0803D758
sub_0803D758: @ 0x0803D758
	push {lr}
	ldr r2, _0803D77C @ =0x08B98AEC
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_0803C294
	pop {r0}
	bx r0
	.align 2, 0
_0803D77C: .4byte 0x08B98AEC

	thumb_func_start sub_0803D780
sub_0803D780: @ 0x0803D780
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D7BC
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0803D7BC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0803D7C4
sub_0803D7C4: @ 0x0803D7C4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0803D800 @ =0x02020140
	ldrh r0, [r4, #0x36]
	subs r0, #1
	ldrh r1, [r4, #0x38]
	cmp r1, r0
	bge _0803D804
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D84E
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b _0803D848
	.align 2, 0
_0803D800: .4byte 0x02020140
_0803D804:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D84E
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge _0803D83A
_0803D824:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _0803D824
_0803D83A:
	movs r0, #0x64
	ldrh r1, [r4, #0x38]
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
_0803D848:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_0803D84E:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0803D85A
	adds r0, r4, #0
	bl _call_via_r1
_0803D85A:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _0803D868
	adds r0, r4, #0
	bl Proc_Break
_0803D868:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start StartSioBigSend
StartSioBigSend: @ 0x0803D870
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _0803D88C @ =0x0079FF86
	cmp r4, r0
	bls _0803D890
	movs r0, #1
	rsbs r0, r0, #0
	b _0803D8E2
	.align 2, 0
_0803D88C: .4byte 0x0079FF86
_0803D890:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D8B2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0803D8B2:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0803D8EC @ =0x08B98AF0
	ldr r1, [sp, #0x18]
	bl SpawnProcLocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
_0803D8E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D8EC: .4byte 0x08B98AF0

	thumb_func_start StartSioBigReceive
StartSioBigReceive: @ 0x0803D8F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _0803D918 @ =0x08B98B10
	bl SpawnProcLocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803D918: .4byte 0x08B98B10

	thumb_func_start IsSioBigTransferActive
IsSioBigTransferActive: @ 0x0803D91C
	push {lr}
	ldr r0, _0803D938 @ =0x08B98AF0
	bl Proc_Find
	cmp r0, #0
	bne _0803D940
	ldr r0, _0803D93C @ =0x08B98B10
	bl Proc_Find
	cmp r0, #0
	bne _0803D940
	movs r0, #0
	b _0803D942
	.align 2, 0
_0803D938: .4byte 0x08B98AF0
_0803D93C: .4byte 0x08B98B10
_0803D940:
	movs r0, #1
_0803D942:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioStrCpy
SioStrCpy: @ 0x0803D948
	movs r3, #0
	b _0803D954
_0803D94C:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
_0803D954:
	ldrb r2, [r0]
	cmp r2, #0
	bne _0803D94C
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start SioDrawNumber
SioDrawNumber: @ 0x0803D964
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SioInit
SioInit: @ 0x0803D988
	push {lr}
	bl SioRegisterIrq
	bl sub_0803C414
	ldr r2, _0803D9A4 @ =0x08B98AEC
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_0803D9A4: .4byte 0x08B98AEC

	thumb_func_start SioPollingMsgAndAck
SioPollingMsgAndAck: @ 0x0803D9A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0803D9EC @ =0x00002586
	mov r1, sp
	strh r0, [r1]
	bl SioPollingMsg
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, r5
	beq _0803D9E4
	ldr r4, _0803D9F0 @ =0x08B98AEC
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl GetSioIndex
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl Proc_Break
_0803D9E4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D9EC: .4byte 0x00002586
_0803D9F0: .4byte 0x08B98AEC

	thumb_func_start SetBmStLinkArenaFlag
SetBmStLinkArenaFlag: @ 0x0803D9F4
	ldr r0, _0803DA00 @ =0x0202BBB8
	movs r1, #0x40
	ldrb r2, [r0, #4]
	orrs r1, r2
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_0803DA00: .4byte 0x0202BBB8

	thumb_func_start UnsetBmStLinkArenaFlag
UnsetBmStLinkArenaFlag: @ 0x0803DA04
	ldr r1, _0803DA10 @ =0x0202BBB8
	movs r0, #0xbf
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DA10: .4byte 0x0202BBB8

	thumb_func_start CheckInLinkArena
CheckInLinkArena: @ 0x0803DA14
	ldr r0, _0803DA20 @ =0x0202BBB8
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0803DA20: .4byte 0x0202BBB8

	thumb_func_start sub_0803DA24
sub_0803DA24: @ 0x0803DA24
	ldr r1, _0803DA2C @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_0803DA2C: .4byte 0x0203D90C

	thumb_func_start sub_0803DA30
sub_0803DA30: @ 0x0803DA30
	push {r4, lr}
	ldr r3, _0803DA64 @ =0x030028AC
	ldr r1, _0803DA68 @ =0x0000FFE0
	ldrh r2, [r3]
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	ldr r2, _0803DA6C @ =0x0000E0FF
	ands r1, r2
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r2, r4, #0
	orrs r1, r2
	strh r1, [r3]
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	strb r1, [r3]
	movs r1, #0
	strb r1, [r3, #8]
	strb r1, [r3, #9]
	strb r1, [r3, #0xa]
	str r1, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DA64: .4byte 0x030028AC
_0803DA68: .4byte 0x0000FFE0
_0803DA6C: .4byte 0x0000E0FF

	thumb_func_start sub_0803DA70
sub_0803DA70: @ 0x0803DA70
	push {r4, r5, lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	adds r3, r4, #0
	ands r3, r1
	cmp r3, #0x1f
	ble _0803DA86
	movs r0, #0x40
	subs r3, r0, r3
_0803DA86:
	cmp r3, #0x10
	ble _0803DA8C
	movs r3, #0x10
_0803DA8C:
	ldr r2, _0803DAC4 @ =0x030028AC
	ldr r0, _0803DAC8 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0803DACC @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xd8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	strb r3, [r2, #8]
	movs r0, #0x10
	subs r0, r0, r3
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DAC4: .4byte 0x030028AC
_0803DAC8: .4byte 0x0000FFE0
_0803DACC: .4byte 0x0000E0FF

	thumb_func_start sub_0803DAD0
sub_0803DAD0: @ 0x0803DAD0
	ldr r0, _0803DAE0 @ =0x03002870
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_0803DAE0: .4byte 0x03002870

	thumb_func_start sub_0803DAE4
sub_0803DAE4: @ 0x0803DAE4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803DB04 @ =0x08B98AEC
	ldr r0, [r0]
	ldr r1, _0803DB08 @ =0x00001286
	strh r1, [r0, #0x30]
	ldr r1, _0803DB0C @ =0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0803DB00
	adds r0, r2, #0
	bl Proc_Break
_0803DB00:
	pop {r0}
	bx r0
	.align 2, 0
_0803DB04: .4byte 0x08B98AEC
_0803DB08: .4byte 0x00001286
_0803DB0C: .4byte 0x00001B7E

	thumb_func_start sub_0803DB10
sub_0803DB10: @ 0x0803DB10
	ldr r0, _0803DB20 @ =0x08B98AEC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_0803DB20: .4byte 0x08B98AEC

	thumb_func_start sub_0803DB24
sub_0803DB24: @ 0x0803DB24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803DB64 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _0803DB68 @ =0x08B98AEC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	bne _0803DB5E
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
_0803DB5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB64: .4byte 0x0300479C
_0803DB68: .4byte 0x08B98AEC

	thumb_func_start SioHold_Loop
SioHold_Loop: @ 0x0803DB6C
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge _0803DB84
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble _0803DB84
	ldr r0, [r2, #0x2c]
	bl DisplayFrozenUiHand
_0803DB84:
	pop {r0}
	bx r0

	thumb_func_start StartSioHold
StartSioHold: @ 0x0803DB88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0803DBB4 @ =0x08B98BC4
	adds r1, r4, #0
	bl SpawnProc
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DBB4: .4byte 0x08B98BC4

	thumb_func_start sub_0803DBB8
sub_0803DBB8: @ 0x0803DBB8
	push {lr}
	ldr r0, _0803DBC4 @ =0x08B98BC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0803DBC4: .4byte 0x08B98BC4

	thumb_func_start sub_0803DBC8
sub_0803DBC8: @ 0x0803DBC8
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	thumb_func_start ClearSioBG
ClearSioBG: @ 0x0803DBD0
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0803DC1C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC20 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC24 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803DC1C: .4byte 0x02022C60
_0803DC20: .4byte 0x02023460
_0803DC24: .4byte 0x02023C60

	thumb_func_start sub_0803DC28
sub_0803DC28: @ 0x0803DC28
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0803DC7C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC80 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC84 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC88 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803DC7C: .4byte 0x02022C60
_0803DC80: .4byte 0x02023460
_0803DC84: .4byte 0x02023C60
_0803DC88: .4byte 0x02024460

	thumb_func_start PutSioText
PutSioText: @ 0x0803DC8C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, _0803DCB8 @ =0x0203DC08
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge _0803DCC0
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803DCBC @ =0x02023C62
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b _0803DCE6
	.align 2, 0
_0803DCB8: .4byte 0x0203DC08
_0803DCBC: .4byte 0x02023C62
_0803DCC0:
	adds r0, r6, #0
	bl GetMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _0803DCEC @ =0x02023C62
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl EnableBgSync
_0803DCE6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DCEC: .4byte 0x02023C62

	thumb_func_start sub_0803DCF0
sub_0803DCF0: @ 0x0803DCF0
	push {r4, r5, lr}
	ldr r5, _0803DD34 @ =0x0203D970
	movs r4, #5
_0803DCF6:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DCF6
	ldr r5, _0803DD38 @ =0x0203D918
	movs r4, #0xa
_0803DD0A:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DD0A
	ldr r5, _0803DD3C @ =0x0203DC08
	movs r4, #1
_0803DD1E:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803DD1E
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DD34: .4byte 0x0203D970
_0803DD38: .4byte 0x0203D918
_0803DD3C: .4byte 0x0203DC08

	thumb_func_start sub_0803DD40
sub_0803DD40: @ 0x0803DD40
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _0803DD94 @ =0x081D5218
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
_0803DD58:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _0803DD58
	movs r4, #0
_0803DD64:
	cmp r4, #4
	beq _0803DD86
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803DD86
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0xff
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
_0803DD86:
	adds r4, #1
	cmp r4, #7
	ble _0803DD64
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DD94: .4byte 0x081D5218

	thumb_func_start SioPlaySoundEffect
SioPlaySoundEffect: @ 0x0803DD98
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0803DDC8 @ =0x081D5220
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _0803DDCC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803DDBE
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_0803DDBE:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDC8: .4byte 0x081D5220
_0803DDCC: .4byte 0x0202BBF8

	thumb_func_start sub_0803DDD0
sub_0803DDD0: @ 0x0803DDD0
	push {r4, lr}
	ldr r4, _0803DDF0 @ =0x0203DA0C
	adds r0, r4, #0
	bl sub_080A1F90
	movs r0, #8
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl sub_080A1F54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDF0: .4byte 0x0203DA0C

	thumb_func_start IsKeyInputSequenceComplete
IsKeyInputSequenceComplete: @ 0x0803DDF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0803DE18 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne _0803DE24
	ldr r1, _0803DE1C @ =0x0203DC48
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3b
	ble _0803DE78
	ldr r0, _0803DE20 @ =0x030013F4
	str r3, [r1]
	str r3, [r0]
	b _0803DE78
	.align 2, 0
_0803DE18: .4byte 0x08B857F8
_0803DE1C: .4byte 0x0203DC48
_0803DE20: .4byte 0x030013F4
_0803DE24:
	ldr r0, _0803DE58 @ =0x0203DC48
	movs r6, #0
	str r6, [r0]
	ldr r1, _0803DE5C @ =0x0203DC28
	ldr r2, _0803DE60 @ =0x030013F0
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, _0803DE64 @ =0x030013F4
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne _0803DE6C
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0803DE68 @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	bne _0803DE6E
	movs r0, #1
	b _0803DE7A
	.align 2, 0
_0803DE58: .4byte 0x0203DC48
_0803DE5C: .4byte 0x0203DC28
_0803DE60: .4byte 0x030013F0
_0803DE64: .4byte 0x030013F4
_0803DE68: .4byte 0x0000FFFF
_0803DE6C:
	str r6, [r1]
_0803DE6E:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
_0803DE78:
	movs r0, #0
_0803DE7A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0803DE80
sub_0803DE80: @ 0x0803DE80
	push {lr}
	ldr r0, _0803DE90 @ =0x08B98BEC
	bl IsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_0803DE90: .4byte 0x08B98BEC

	thumb_func_start sub_0803DE94
sub_0803DE94: @ 0x0803DE94
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803DEA4 @ =0x08B98CB4
	bl SpawnProcLocking
	pop {r0}
	bx r0
	.align 2, 0
_0803DEA4: .4byte 0x08B98CB4

	thumb_func_start sub_0803DEA8
sub_0803DEA8: @ 0x0803DEA8
	mov ip, r0
	mov r2, ip
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0
	movs r0, #0xd8
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x48
	strb r3, [r0]
	mov r0, ip
	str r1, [r0, #0x40]
	str r1, [r0, #0x3c]
	adds r0, #0x52
	strb r3, [r0]
	adds r2, #0xa
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x53
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x4c
	strb r3, [r0]
	bx lr
	.align 2, 0

	thumb_func_start sub_0803DEE4
sub_0803DEE4: @ 0x0803DEE4
	push {r4, lr}
	ldr r0, _0803DEF0 @ =0x0203D90C
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0803DEF8
	b _0803DF10
	.align 2, 0
_0803DEF0: .4byte 0x0203D90C
_0803DEF4:
	movs r0, #1
	b _0803DF12
_0803DEF8:
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803DF18 @ =0x0203DA78
_0803DEFE:
	adds r0, r3, #0
	ldrb r4, [r1, #0x13]
	ands r0, r4
	cmp r0, #0
	bne _0803DEF4
	adds r1, #0x18
	adds r2, #1
	cmp r2, #9
	ble _0803DEFE
_0803DF10:
	movs r0, #0
_0803DF12:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DF18: .4byte 0x0203DA78

	thumb_func_start sub_0803DF1C
sub_0803DF1C: @ 0x0803DF1C
	push {r4, lr}
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803DF34 @ =0x0203DA78
_0803DF24:
	adds r0, r3, #0
	ldrb r4, [r1, #0x13]
	ands r0, r4
	cmp r0, #0
	bne _0803DF38
	movs r0, #1
	b _0803DF42
	.align 2, 0
_0803DF34: .4byte 0x0203DA78
_0803DF38:
	adds r1, #0x18
	adds r2, #1
	cmp r2, #9
	ble _0803DF24
	movs r0, #0
_0803DF42:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803DF48
sub_0803DF48: @ 0x0803DF48
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	ldr r1, _0803DF78 @ =0x08B98C9C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r7, [r0]
	bl InitUnits
	cmp r4, #0
	beq _0803DF7C
	cmp r4, #0
	blt _0803E02A
	cmp r4, #2
	bgt _0803E02A
	movs r6, #0
	b _0803DFE8
	.align 2, 0
_0803DF78: .4byte 0x08B98C9C
_0803DF7C:
	movs r6, #0
	mov r1, r8
	lsls r0, r1, #4
	adds r5, r0, r7
	movs r0, #1
	mov r8, r0
	movs r7, #0
_0803DF8A:
	ldr r0, _0803DFA8 @ =0x0203DA78
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803DFAC
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x14]
	strb r6, [r4, #0x13]
	b _0803DFC4
	.align 2, 0
_0803DFA8: .4byte 0x0203DA78
_0803DFAC:
	ldr r0, _0803DFE4 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x14]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
_0803DFC4:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_080A1E8C
	movs r1, #5
	add r8, r1
	adds r7, #0x18
	adds r6, #1
	cmp r6, #9
	ble _0803DF8A
	adds r5, r6, #0
	b _0803E02A
	.align 2, 0
_0803DFE4: .4byte 0x081D5228
_0803DFE8:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #3
	ldr r1, _0803E03C @ =0x0203DA78
	adds r4, r0, r1
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_080A1C44
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E024
	mov r1, r8
	lsls r0, r1, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x14]
	strb r6, [r4, #0x13]
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_080A1E8C
	adds r5, #1
_0803E024:
	adds r6, #1
	cmp r6, #9
	ble _0803DFE8
_0803E02A:
	adds r0, r5, #0
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E03C: .4byte 0x0203DA78

	thumb_func_start DrawLinkArenaTeamName
DrawLinkArenaTeamName: @ 0x0803E040
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _0803E0A8 @ =0x0203D918
	adds r0, r0, r6
	mov sb, r0
	bl ClearText
	mov r0, sb
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0803E0AC @ =0x0203DA78
	adds r4, r4, r0
	mov r0, sb
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	ldr r1, _0803E0B0 @ =0x00000FFF
	mov r2, r8
	ldrh r2, [r2, #0xc]
	ands r1, r2
	movs r0, #0xf
	ldrb r4, [r4, #0x14]
	ands r0, r4
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _0803E0B4 @ =0x02023476
	adds r5, r5, r0
	mov r0, sb
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E0A8: .4byte 0x0203D918
_0803E0AC: .4byte 0x0203DA78
_0803E0B0: .4byte 0x00000FFF
_0803E0B4: .4byte 0x02023476

	thumb_func_start sub_0803E0B8
sub_0803E0B8: @ 0x0803E0B8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0803E0C8
_0803E0C0:
	adds r0, r4, #0
	bl DrawLinkArenaTeamName
	adds r4, #1
_0803E0C8:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt _0803E0C0
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0803E0D4
sub_0803E0D4: @ 0x0803E0D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _0803E118 @ =0x08B98C9C
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r1, [r1]
	mov sb, r1
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _0803E168
	ldr r0, _0803E11C @ =0x0203D90C
	adds r5, r0, #0
	adds r5, #0xc
	mov r8, r5
	ldr r3, _0803E120 @ =0x0203DA78
	movs r2, #0
_0803E100:
	ldr r0, _0803E120 @ =0x0203DA78
	adds r1, r2, r0
	movs r0, #0x80
	ldrb r7, [r1, #0x13]
	ands r0, r7
	cmp r0, #0
	bne _0803E124
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, sb
	ldrb r0, [r0, #4]
	b _0803E12C
	.align 2, 0
_0803E118: .4byte 0x08B98C9C
_0803E11C: .4byte 0x0203D90C
_0803E120: .4byte 0x0203DA78
_0803E124:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	add r0, sb
	ldrb r0, [r0, #5]
_0803E12C:
	strb r0, [r1, #0x14]
	ldr r0, _0803E17C @ =0x00000FFF
	adds r1, r0, #0
	ldrh r7, [r5]
	ands r1, r7
	movs r0, #0xf
	ldrb r7, [r3, #0x14]
	ands r0, r7
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _0803E180 @ =0x02023476
	adds r1, r1, r0
	mov r0, r8
	str r2, [sp]
	str r3, [sp, #4]
	bl PutText
	movs r0, #8
	add r8, r0
	adds r5, #8
	ldr r3, [sp, #4]
	adds r3, #0x18
	ldr r2, [sp]
	adds r2, #0x18
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _0803E100
_0803E168:
	movs r0, #2
	bl EnableBgSync
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E17C: .4byte 0x00000FFF
_0803E180: .4byte 0x02023476

	thumb_func_start sub_0803E184
sub_0803E184: @ 0x0803E184
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _0803E20C @ =0x08B98C9C
	ldr r0, _0803E210 @ =0x0203D90C
	mov sb, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r0, r5, #2
	adds r0, r0, r5
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _0803E214 @ =0x0203DA78
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #3
	adds r4, r4, r0
	movs r0, #0x7f
	ldrb r3, [r4, #0x13]
	ands r0, r3
	bl sub_080A1CC4
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_080A1E8C
	ldr r0, _0803E218 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x14]
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	bl DrawLinkArenaTeamName
	bl sub_0803DF1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E21C
	mov r1, sb
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_0803E358
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803E230
	.align 2, 0
_0803E20C: .4byte 0x08B98C9C
_0803E210: .4byte 0x0203D90C
_0803E214: .4byte 0x0203DA78
_0803E218: .4byte 0x081D5228
_0803E21C:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E230
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_0803E358
_0803E230:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	movs r0, #2
	bl EnableBgSync
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0803E258
sub_0803E258: @ 0x0803E258
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r6, [r0, #0x40]
	adds r0, #0x53
	ldrb r7, [r0]
	ldr r2, _0803E2C4 @ =0x0203DA78
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0x7f
	adds r0, r1, #0
	ldrb r3, [r5, #0x13]
	ands r0, r3
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #3
	adds r4, r4, r2
	ldrb r2, [r4, #0x13]
	ands r1, r2
	bl sub_080A1D90
	ldrb r1, [r5, #0x14]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	strb r1, [r4, #0x14]
	lsls r0, r7, #2
	adds r0, r0, r7
	adds r0, #1
	bl GetUnit
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r5, #0
	bl sub_080A1E8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E2CC
	ldr r0, _0803E2C8 @ =0x081D5228
	adds r1, r5, #0
	bl SioStrCpy
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r5, #0x13]
	b _0803E2CE
	.align 2, 0
_0803E2C4: .4byte 0x0203DA78
_0803E2C8: .4byte 0x081D5228
_0803E2CC:
	strb r7, [r5, #0x13]
_0803E2CE:
	lsls r0, r6, #2
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r3, r0, #0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	ldr r1, _0803E30C @ =0x0203DA78
	adds r4, r0, r1
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r4, #0
	bl sub_080A1E8C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E314
	ldr r0, _0803E310 @ =0x081D5228
	adds r1, r4, #0
	bl SioStrCpy
	movs r0, #0x80
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0x13]
	b _0803E316
	.align 2, 0
_0803E30C: .4byte 0x0203DA78
_0803E310: .4byte 0x081D5228
_0803E314:
	strb r6, [r4, #0x13]
_0803E316:
	adds r0, r6, #0
	bl DrawLinkArenaTeamName
	adds r0, r7, #0
	bl DrawLinkArenaTeamName
	mov r1, r8
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	mov r2, r8
	ldr r0, [r2, #0x30]
	bl Proc_End
	mov r1, r8
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0803E358
sub_0803E358: @ 0x0803E358
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _0803E3CC @ =0x08B98C9C
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _0803E3DC
	ldr r1, _0803E3D0 @ =0x0203D90C
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _0803E3C2
	mov sb, r1
	movs r0, #5
	mov r8, r0
	mov r5, sb
	adds r5, #0x64
	movs r7, #0
_0803E38C:
	ldr r4, _0803E3D4 @ =0x0203DC4C
	adds r4, r7, r4
	ldr r0, _0803E3D8 @ =0x081D5230
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl PutDrawTextCentered
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0x13
	adds r6, #1
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _0803E38C
_0803E3C2:
	ldr r0, _0803E3D0 @ =0x0203D90C
	ldrb r0, [r0, #5]
	adds r0, #2
	b _0803E444
	.align 2, 0
_0803E3CC: .4byte 0x08B98C9C
_0803E3D0: .4byte 0x0203D90C
_0803E3D4: .4byte 0x0203DC4C
_0803E3D8: .4byte 0x081D5230
_0803E3DC:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803E3EA
	adds r0, r6, #0
	b _0803E444
_0803E3EA:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0803E40A
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E40A
	strb r5, [r4]
	movs r5, #1
_0803E40A:
	lsls r4, r6, #3
	ldr r0, _0803E440 @ =0x0203D970
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl GetMsg
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	bl PutDrawTextCentered
	adds r6, #1
	b _0803E3DC
	.align 2, 0
_0803E440: .4byte 0x0203D970
_0803E444:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0803E454
sub_0803E454: @ 0x0803E454
	adds r3, r0, #0
	ldr r2, _0803E470 @ =0x08B98C9C
	ldr r0, _0803E474 @ =0x0203D90C
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _0803E478
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _0803E48C
	.align 2, 0
_0803E470: .4byte 0x08B98C9C
_0803E474: .4byte 0x0203D90C
_0803E478:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _0803E488
	ldr r0, _0803E484 @ =0x000003C1
	b _0803E48C
	.align 2, 0
_0803E484: .4byte 0x000003C1
_0803E488:
	movs r0, #0xf0
	lsls r0, r0, #2
_0803E48C:
	bx lr
	.align 2, 0

	thumb_func_start sub_0803E490
sub_0803E490: @ 0x0803E490
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r4, _0803E670 @ =0x08194674
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _0803E674 @ =0x081C5BE0
	ldr r1, _0803E678 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r0, _0803E67C @ =0x02023D72
	ldr r1, _0803E680 @ =0x081C827C
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r0, _0803E684 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _0803E688 @ =0x081C64A4
	ldr r1, _0803E68C @ =0x06016000
	bl Decompress
	ldr r0, _0803E690 @ =0x0840624C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r2, _0803E694 @ =0x02022860
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r2, #0x42
	movs r3, #2
_0803E4EE:
	ldrh r0, [r4, #8]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0803E4EE
	bl EnablePalSync
	ldr r0, _0803E698 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r7, #0x3c]
	ldr r1, _0803E69C @ =0x0203D90C
	ldrb r1, [r1]
	bl sub_0803DF48
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #0xc
_0803E536:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #8
	cmp r0, r2
	bge _0803E536
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0803E69C @ =0x0203D90C
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_0803E358
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl sub_0803E0B8
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #8
	bl sub_08048504
	str r0, [r7, #0x2c]
	movs r3, #0
	adds r4, #6
	movs r2, #0xff
_0803E570:
	adds r1, r3, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r3, #1
	cmp r3, #3
	ble _0803E570
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, _0803E6A0 @ =0x03002870
	mov ip, r0
	movs r0, #0x20
	mov r1, ip
	ldrb r1, [r1, #1]
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r2, #1
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r2
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r5
	orrs r2, r4
	orrs r2, r3
	orrs r2, r6
	strb r2, [r0]
	ldr r0, [r7, #0x2c]
	ldr r1, _0803E6A4 @ =0x081D5260
	ldr r4, _0803E69C @ =0x0203D90C
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_08047D80
	ldr r0, _0803E6A8 @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _0803E6AC @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r7, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	adds r0, r7, #0
	bl sub_0803E454
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E670: .4byte 0x08194674
_0803E674: .4byte 0x081C5BE0
_0803E678: .4byte 0x06014800
_0803E67C: .4byte 0x02023D72
_0803E680: .4byte 0x081C827C
_0803E684: .4byte 0x081C7F04
_0803E688: .4byte 0x081C64A4
_0803E68C: .4byte 0x06016000
_0803E690: .4byte 0x0840624C
_0803E694: .4byte 0x02022860
_0803E698: .4byte 0x0203DA60
_0803E69C: .4byte 0x0203D90C
_0803E6A0: .4byte 0x03002870
_0803E6A4: .4byte 0x081D5260
_0803E6A8: .4byte 0x08B98CA8
_0803E6AC: .4byte 0x081D5254

	thumb_func_start SioTeamList_Main_HandleDPadInput
SioTeamList_Main_HandleDPadInput: @ 0x0803E6B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _0803E710 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0803E6E6
	ldr r0, [r4]
	cmp r0, r5
	bgt _0803E6DA
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _0803E6E6
_0803E6DA:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _0803E6E6
	subs r0, r6, #1
	str r0, [r4]
_0803E6E6:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0803E70A
	ldr r0, [r4]
	cmp r0, r7
	blt _0803E6FE
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0803E70A
_0803E6FE:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_0803E70A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E710: .4byte 0x08B857F8

	thumb_func_start sub_0803E714
sub_0803E714: @ 0x0803E714
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _0803E7E0 @ =0x08B98C9C
	ldr r0, _0803E7E4 @ =0x0203D90C
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r3, #0
	mov sl, r3
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl SioTeamList_Main_HandleDPadInput
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _0803E792
	movs r0, #3
	bl SioPlaySoundEffect
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r4, #0
	bl sub_0803E0D4
	adds r0, r4, #0
	bl sub_0803E454
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl PutSioText
_0803E792:
	ldr r0, _0803E7E8 @ =0x08B857F8
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E824
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E802
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E7FA
	lsls r0, r1, #4
	add r0, sb
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _0803E7EC
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1, #3]
	b _0803E880
	.align 2, 0
_0803E7E0: .4byte 0x08B98C9C
_0803E7E4: .4byte 0x0203D90C
_0803E7E8: .4byte 0x08B857F8
_0803E7EC:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r4, #0
	bl Proc_Break
	b _0803E824
_0803E7FA:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803E824
_0803E802:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r2, sl
	str r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0803E880
_0803E824:
	ldr r5, _0803E890 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E846
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _0803E894 @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1, #3]
_0803E846:
	ldr r1, [r5]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E880
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803E880
	ldr r0, _0803E898 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803E872
	ldr r0, _0803E89C @ =0x0000038A
	bl m4aSongNumStart
_0803E872:
	ldr r1, _0803E894 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0803E880:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E890: .4byte 0x08B857F8
_0803E894: .4byte 0x0203D90C
_0803E898: .4byte 0x0202BBF8
_0803E89C: .4byte 0x0000038A

	thumb_func_start sub_0803E8A0
sub_0803E8A0: @ 0x0803E8A0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl sub_08047CA8
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _0803E8E0 @ =0x0203DA78
	ldr r2, [r4, #0x40]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x13]
	mov r2, sp
	bl sub_080A1E8C
	adds r0, r4, #0
	bl StartUnitListScreenUnk
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8E0: .4byte 0x0203DA78

	thumb_func_start sub_0803E8E4
sub_0803E8E4: @ 0x0803E8E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803E900 @ =0x08CC32A4
	bl Proc_Find
	cmp r0, #0
	bne _0803E8F8
	adds r0, r4, #0
	bl Proc_Break
_0803E8F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E900: .4byte 0x08CC32A4

	thumb_func_start sub_0803E904
sub_0803E904: @ 0x0803E904
	movs r1, #0
	ldr r2, _0803E920 @ =0x0203D90C
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge _0803E92A
	adds r3, r2, #6
	adds r2, r0, #0
_0803E914:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0803E924
	movs r0, #0
	b _0803E92C
	.align 2, 0
_0803E920: .4byte 0x0203D90C
_0803E924:
	adds r1, #1
	cmp r1, r2
	blt _0803E914
_0803E92A:
	movs r0, #1
_0803E92C:
	bx lr
	.align 2, 0

	thumb_func_start sub_0803E930
sub_0803E930: @ 0x0803E930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov sb, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _0803E974 @ =0x08B98BDC
	bl IsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E97C
	ldr r0, _0803E978 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803E97C
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _0803EE24
	.align 2, 0
_0803E974: .4byte 0x08B98BDC
_0803E978: .4byte 0x0203DA78
_0803E97C:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x48
	ldr r0, [r7, #0x40]
	ldrb r3, [r1]
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r2, [sp, #4]
	str r0, [r2, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	mov sl, r1
	str r0, [sp, #8]
	cmp r2, #0
	ble _0803E9DE
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803E9CE
	movs r1, #4
	bl sub_0803DBC8
_0803E9CE:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r0, sl
	ldrb r0, [r0]
	subs r1, r1, r0
	b _0803EA1C
_0803E9DE:
	cmp r2, #0
	bge _0803EA3A
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EA0C
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_0803DBC8
_0803EA0C:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	ldr r1, [r7, #0x40]
	mov r2, sl
	ldrb r2, [r2]
	subs r1, r1, r2
_0803EA1C:
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	b _0803EE24
_0803EA3A:
	ldr r1, [r7, #0x40]
	mov r3, sl
	ldrb r3, [r3]
	subs r1, r1, r3
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl PutUiHand
	ldr r0, _0803EA78 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _0803EA5C
	b _0803EC76
_0803EA5C:
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r1, [r0]
	subs r1, #1
	adds r4, r0, #0
	cmp r1, #7
	bls _0803EA6C
	b _0803EC76
_0803EA6C:
	lsls r0, r1, #2
	ldr r1, _0803EA7C @ =_0803EA80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803EA78: .4byte 0x08B857F8
_0803EA7C: .4byte _0803EA80
_0803EA80: @ jump table
	.4byte _0803EAA0 @ case 0
	.4byte _0803EAD0 @ case 1
	.4byte _0803EAF8 @ case 2
	.4byte _0803EB24 @ case 3
	.4byte _0803EB88 @ case 4
	.4byte _0803EB96 @ case 5
	.4byte _0803EC76 @ case 6
	.4byte _0803EBE4 @ case 7
_0803EAA0:
	ldr r0, _0803EAC8 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EAB8
	b _0803EBDC
_0803EAB8:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _0803EACC @ =0x0203D90C
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _0803EAE8
	.align 2, 0
_0803EAC8: .4byte 0x0203DA78
_0803EACC: .4byte 0x0203D90C
_0803EAD0:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r2, _0803EAF0 @ =0x0203D90C
	ldr r1, _0803EAF4 @ =0x0203DA78
	mov r3, sb
	lsls r0, r3, #1
	add r0, sb
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x13]
	strb r0, [r2, #3]
_0803EAE8:
	adds r0, r7, #0
	bl Proc_Break
	b _0803EE24
	.align 2, 0
_0803EAF0: .4byte 0x0203D90C
_0803EAF4: .4byte 0x0203DA78
_0803EAF8:
	ldr r0, _0803EB20 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EBDC
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _0803EE24
	.align 2, 0
_0803EB20: .4byte 0x0203DA78
_0803EB24:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _0803EB2C
	b _0803EC76
_0803EB2C:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, sb
	strb r3, [r0]
	mov r1, sl
	ldrb r1, [r1]
	subs r2, r3, r1
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	mov r1, sb
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _0803EB70
	ldr r0, _0803EB6C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r2, [r1, #6]
	orrs r0, r2
	b _0803EB7A
	.align 2, 0
_0803EB6C: .4byte 0x08B857F8
_0803EB70:
	ldr r0, _0803EB84 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r3, [r1, #6]
	orrs r0, r3
_0803EB7A:
	strh r0, [r1, #6]
	movs r0, #5
	strb r0, [r4]
	b _0803EC76
	.align 2, 0
_0803EB84: .4byte 0x08B857F8
_0803EB88:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	bl sub_0803E258
	b _0803EC76
_0803EB96:
	ldr r0, _0803EBD8 @ =0x0203DA78
	mov r2, sb
	lsls r1, r2, #1
	add r1, sb
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0x80
	ldrb r1, [r1, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _0803EBDC
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	mov r3, sl
	ldrb r3, [r3]
	subs r2, r0, r3
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _0803EC76
	.align 2, 0
_0803EBD8: .4byte 0x0203DA78
_0803EBDC:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803EC76
_0803EBE4:
	movs r0, #2
	bl SioPlaySoundEffect
	mov r0, sb
	lsls r4, r0, #1
	add r4, sb
	lsls r4, r4, #3
	ldr r0, _0803ECA0 @ =0x0203DA78
	adds r4, r4, r0
	movs r1, #0x53
	adds r1, r1, r7
	mov r8, r1
	ldrb r0, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	ldr r6, _0803ECA4 @ =0x0203DC4C
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, _0803ECA8 @ =0x0203D90C
	adds r0, r5, #6
	mov r2, r8
	ldrb r2, [r2]
	adds r0, r2, r0
	ldrb r1, [r4, #0x13]
	strb r1, [r0]
	mov r3, r8
	ldrb r3, [r3]
	lsls r0, r3, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #2
	adds r3, r3, r1
	lsls r3, r3, #2
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl PutDrawTextCentered
	bl sub_0803E904
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EC6A
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x40]
	cmp r0, #0
	bne _0803EC6A
	movs r0, #8
	str r0, [r1, #0x40]
_0803EC6A:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803EC76:
	ldr r0, _0803ECAC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ECCA
	movs r0, #1
	bl SioPlaySoundEffect
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _0803ECB0
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _0803EE24
	.align 2, 0
_0803ECA0: .4byte 0x0203DA78
_0803ECA4: .4byte 0x0203DC4C
_0803ECA8: .4byte 0x0203D90C
_0803ECAC: .4byte 0x08B857F8
_0803ECB0:
	cmp r0, #8
	beq _0803ECBE
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0803ECCA
_0803ECBE:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0803ECCA:
	ldr r0, _0803ED74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803ED06
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803ED06
	ldr r0, _0803ED78 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803ECF8
	ldr r0, _0803ED7C @ =0x0000038A
	bl m4aSongNumStart
_0803ECF8:
	ldr r1, _0803ED80 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_0803ED06:
	ldr r0, _0803ED74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803ED8E
	mov r2, sl
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803ED84
	ldr r0, [r7, #0x40]
	ldrb r3, [r2]
	subs r0, r0, r3
	cmp r0, #1
	bgt _0803ED84
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803ED3C
	movs r1, #4
	bl sub_0803DBC8
_0803ED3C:
	movs r0, #4
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r0, #3
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	b _0803ED8E
	.align 2, 0
_0803ED74: .4byte 0x08B857F8
_0803ED78: .4byte 0x0202BBF8
_0803ED7C: .4byte 0x0000038A
_0803ED80: .4byte 0x0203D90C
_0803ED84:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _0803ED8E
	subs r0, #1
	str r0, [r7, #0x40]
_0803ED8E:
	ldr r0, _0803EE08 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803EE18
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _0803EE0C
	mov r3, sl
	ldrb r2, [r3]
	adds r0, r2, #6
	cmp r0, r1
	bge _0803EE0C
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _0803EE0C
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0803EDCC
	movs r1, #4
	rsbs r1, r1, #0
	bl sub_0803DBC8
_0803EDCC:
	movs r0, #4
	rsbs r0, r0, #0
	bl ScrollMultiArenaTeamSprites
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_08048C50
	b _0803EE18
	.align 2, 0
_0803EE08: .4byte 0x08B857F8
_0803EE0C:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _0803EE18
	adds r0, r1, #1
	str r0, [r7, #0x40]
_0803EE18:
	ldr r0, [r7, #0x40]
	cmp sb, r0
	beq _0803EE24
	movs r0, #3
	bl SioPlaySoundEffect
_0803EE24:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0803EE34
sub_0803EE34: @ 0x0803EE34
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	rsbs r1, r1, #0
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
_0803EE40:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0803EE40
	bx lr

	thumb_func_start sub_0803EE4C
sub_0803EE4C: @ 0x0803EE4C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, _0803EEB0 @ =0x081D5263
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EE6C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0803EE6C:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EEB8
	ldr r3, _0803EEB4 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _0803EECC
	.align 2, 0
_0803EEB0: .4byte 0x081D5263
_0803EEB4: .4byte 0x03002870
_0803EEB8:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0803EE34
_0803EECC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803EED4
sub_0803EED4: @ 0x0803EED4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _0803EF3C @ =0x081D5263
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	rsbs r7, r7, #0
	cmp r5, r7
	bne _0803EEF4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0803EEF4:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EF44
	ldr r3, _0803EF40 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b _0803EF58
	.align 2, 0
_0803EF3C: .4byte 0x081D5263
_0803EF40: .4byte 0x03002870
_0803EF44:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0803EE34
_0803EF58:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803EF60
sub_0803EF60: @ 0x0803EF60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_08049220
	adds r1, r5, #0
	adds r1, #0x48
	ldr r0, [r5, #0x40]
	ldrb r1, [r1]
	subs r0, r0, r1
	cmp r0, #2
	ble _0803EF84
	lsls r0, r0, #1
	subs r0, #2
	b _0803EF88
_0803EF84:
	lsls r0, r0, #1
	adds r0, #5
_0803EF88:
	str r0, [r5, #0x58]
	ldr r4, _0803EFB8 @ =0x0203D998
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0803EFBC @ =0x081D5270
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _0803EFC0 @ =0x02022C7E
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803EFB8: .4byte 0x0203D998
_0803EFBC: .4byte 0x081D5270
_0803EFC0: .4byte 0x02022C7E

	thumb_func_start sub_0803EFC4
sub_0803EFC4: @ 0x0803EFC4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl sub_0804925C
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803EFF6
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803EFF6
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_0803EFF6:
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _0803F018
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F018
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySoundEffect
_0803F018:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl PutUiHand
	ldr r0, _0803F068 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F070
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F06C @ =0x02022C7E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_t
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
	b _0803F0B8
	.align 2, 0
_0803F068: .4byte 0x08B857F8
_0803F06C: .4byte 0x02022C7E
_0803F070:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803F0B8
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803F092
	adds r0, r4, #0
	bl sub_0803E184
	movs r0, #2
	bl SioPlaySoundEffect
	b _0803F098
_0803F092:
	movs r0, #1
	bl SioPlaySoundEffect
_0803F098:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0803F0C0 @ =0x02022C7E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_t
	movs r0, #1
	bl EnableBgSync
	adds r0, r4, #0
	bl Proc_Break
_0803F0B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F0C0: .4byte 0x02022C7E

	thumb_func_start sub_0803F0C4
sub_0803F0C4: @ 0x0803F0C4
	push {r4, lr}
	sub sp, #0x14
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl sub_080A1E8C
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetTacticianTextConf
GetTacticianTextConf: @ 0x0803F0E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0803F0F0 @ =0x081D3C0C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803F0F0: .4byte 0x081D3C0C

	thumb_func_start sub_0803F0F4
sub_0803F0F4: @ 0x0803F0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov sb, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F196
_0803F10E:
	movs r1, #0
	mov r8, r1
	mov r3, sb
	adds r3, #1
	str r3, [sp, #8]
_0803F118:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetTacticianTextConf
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _0803F16C @ =0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0803F130:
	movs r4, #0
	mov r3, sb
	ldrb r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x48
	mov r5, sl
	adds r3, r0, r5
_0803F150:
	ldr r0, [r2]
	ldrb r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _0803F170
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _0803F18C
	.align 2, 0
_0803F16C: .4byte 0x00003FFF
_0803F170:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _0803F150
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0803F130
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _0803F118
_0803F18C:
	ldr r0, [sp, #8]
	mov sb, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F10E
_0803F196:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803F1A8
sub_0803F1A8: @ 0x0803F1A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r6, #0
	adds r4, r0, #0
	adds r4, #0x31
	ldr r1, _0803F284 @ =0x0203DA10
	mov r8, r1
	adds r7, r0, #0
	adds r7, #0x30
_0803F1C2:
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	bl ClearText
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColor
	movs r2, #0
	lsls r3, r6, #4
	mov sb, r3
	lsls r0, r6, #1
	mov sl, r0
	adds r1, r6, #1
	str r1, [sp]
_0803F1F2:
	mov r3, sb
	subs r0, r3, r6
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _0803F288 @ =0x081D516A
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #6
	ldr r1, _0803F28C @ =0x081D3C0C
	adds r5, r0, r1
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F24C
	ldrb r3, [r4]
	lsls r0, r3, #2
	adds r0, r0, r3
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r5, #0x30]
	str r2, [sp, #4]
	bl Text_SetCursor
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	ldrb r3, [r7]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r1, [r1]
	bl Text_DrawString
	ldr r2, [sp, #4]
_0803F24C:
	adds r2, #1
	cmp r2, #0xe
	ble _0803F1F2
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r6, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, _0803F290 @ =0x02023460
	adds r1, r1, r2
	bl PutText
	ldr r6, [sp]
	cmp r6, #4
	ble _0803F1C2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F284: .4byte 0x0203DA10
_0803F288: .4byte 0x081D516A
_0803F28C: .4byte 0x081D3C0C
_0803F290: .4byte 0x02023460

	thumb_func_start TacticianDrawCharacters
TacticianDrawCharacters: @ 0x0803F294
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, _0803F2DC @ =0x0203DC18
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F2C6
	adds r6, r5, #0
	movs r5, #0
_0803F2AC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_SetCursor
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_DrawCharacter
	adds r4, r0, #0
	adds r5, #7
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803F2AC
_0803F2C6:
	ldr r0, _0803F2DC @ =0x0203DC18
	ldr r1, _0803F2E0 @ =0x02022DB8
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F2DC: .4byte 0x0203DC18
_0803F2E0: .4byte 0x02022DB8

	thumb_func_start sub_0803F2E4
sub_0803F2E4: @ 0x0803F2E4
	adds r1, r0, #0
	movs r2, #0
	b _0803F2EE
_0803F2EA:
	adds r2, #1
	adds r1, #1
_0803F2EE:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803F2EA
	adds r0, r2, #0
	bx lr

	thumb_func_start sub_0803F2F8
sub_0803F2F8: @ 0x0803F2F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r1, _0803F370 @ =0x081D527E
	add r0, sp, #8
	movs r2, #0xa
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _0803F374 @ =0x081C5BE0
	ldr r1, _0803F378 @ =0x06014800
	bl Decompress
	ldr r0, _0803F37C @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0803F380 @ =0x081C8144
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	ldr r0, _0803F384 @ =0x02023E60
	ldr r1, _0803F388 @ =0x081C84CC
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r0, _0803F38C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0803F390
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #9
	b _0803F39A
	.align 2, 0
_0803F370: .4byte 0x081D527E
_0803F374: .4byte 0x081C5BE0
_0803F378: .4byte 0x06014800
_0803F37C: .4byte 0x081C7F04
_0803F380: .4byte 0x081C8144
_0803F384: .4byte 0x02023E60
_0803F388: .4byte 0x081C84CC
_0803F38C: .4byte 0x0203DA60
_0803F390:
	ldr r0, _0803F4F0 @ =0x0203D90C
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
_0803F39A:
	strb r0, [r1]
	movs r4, #0
	adds r5, r1, #0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0x38
	adds r2, r2, r6
	mov r8, r2
	ldr r3, _0803F4F4 @ =0x0203DC18
	mov ip, r3
	adds r7, r6, #0
	adds r7, #0x30
	movs r2, #0x39
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x31
	adds r3, r3, r6
	mov sl, r3
	adds r2, r6, #0
	adds r2, #0x32
	str r2, [sp, #0x20]
	cmp r4, r0
	bge _0803F3DA
	adds r2, #0xb
	movs r3, #0
_0803F3CC:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	cmp r4, r0
	blt _0803F3CC
_0803F3DA:
	movs r4, #0
	ldrb r3, [r1]
	cmp r4, r3
	bge _0803F3F4
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x48
_0803F3E8:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt _0803F3E8
_0803F3F4:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	movs r1, #8
	bl InitText
	movs r0, #2
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl GetTacticianTextConf
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl StartNameEntrySpriteDraw
	str r0, [r6, #0x2c]
	mov r2, sb
	strb r4, [r2]
	ldr r5, _0803F4F8 @ =0x0203DA10
	movs r4, #9
_0803F428:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0803F428
	ldr r4, _0803F4FC @ =0x0203D998
	adds r0, r4, #0
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r1, #3
	bl sub_08047D80
	subs r4, #0x8c
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #0xa
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r1, _0803F500 @ =0x0203DC20
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r3, sl
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_0803F1A8
	ldr r1, [sp, #0x20]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F4DA
	movs r4, #0
	bl GetTacticianName
	adds r2, r0, #0
	ldrb r1, [r2]
	add r3, sp, #0x14
	mov ip, r3
	cmp r1, #0
	beq _0803F4BC
	adds r7, r6, #0
	adds r7, #0x3d
	mov sb, ip
	mov r5, r8
	adds r3, r6, #0
	adds r3, #0x33
_0803F498:
	adds r0, r7, r4
	strb r1, [r0]
	mov r0, sb
	adds r1, r0, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	ldrb r1, [r3]
	cmp r0, r1
	bge _0803F4B6
	mov r1, r8
	strb r0, [r1]
_0803F4B6:
	ldrb r1, [r2]
	cmp r1, #0
	bne _0803F498
_0803F4BC:
	adds r0, r6, #0
	mov r1, ip
	bl sub_0803F0F4
	adds r0, r6, #0
	bl TacticianDrawCharacters
	ldr r1, [r6, #0x2c]
	mov r2, r8
	ldrb r2, [r2]
	lsls r0, r2, #3
	mov r3, r8
	ldrb r3, [r3]
	subs r0, r0, r3
	str r0, [r1, #0x40]
_0803F4DA:
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F4F0: .4byte 0x0203D90C
_0803F4F4: .4byte 0x0203DC18
_0803F4F8: .4byte 0x0203DA10
_0803F4FC: .4byte 0x0203D998
_0803F500: .4byte 0x0203DC20

	thumb_func_start SioUpdateTeam
SioUpdateTeam: @ 0x0803F504
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov sb, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
_0803F51E:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _0803F51E
	movs r6, #0
	mov r7, r8
_0803F530:
	ldr r0, _0803F580 @ =0x0203E788
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F55E
	bl GetUnitByPid
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne _0803F55E
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl MemCpy
_0803F55E:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble _0803F530
	mov r0, sb
	mov r1, r8
	mov r2, sl
	bl WriteMultiArenaSaveTeam
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F580: .4byte 0x0203E788

	thumb_func_start sub_0803F584
sub_0803F584: @ 0x0803F584
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r5, r1, #1
	adds r2, #0x36
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #6
	ldr r6, _0803F5D8 @ =0x081D3C0C
	adds r2, r0, r6
	adds r1, r7, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F5CE
	adds r1, r5, #0
	adds r5, r6, #0
_0803F5B4:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #6
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F5B4
_0803F5CE:
	strh r4, [r7, #0x34]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5D8: .4byte 0x081D3C0C

	thumb_func_start sub_0803F5DC
sub_0803F5DC: @ 0x0803F5DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r6]
	ldrb r2, [r0]
	cmp r1, r2
	bhs _0803F65C
	movs r0, #2
	bl SioPlaySoundEffect
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl SioStrCpy
	ldrb r2, [r6]
	lsls r0, r2, #1
	adds r2, r5, #0
	adds r2, #0x48
	adds r2, r2, r0
	ldr r1, _0803F644 @ =0x00003FFF
	ldrh r0, [r5, #0x34]
	ands r1, r0
	movs r0, #3
	ldrb r4, [r4]
	ands r0, r4
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r2]
	ldrb r0, [r6]
	adds r0, #1
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bge _0803F648
	strb r0, [r6]
	b _0803F64C
	.align 2, 0
_0803F644: .4byte 0x00003FFF
_0803F648:
	movs r0, #5
	strh r0, [r5, #0x34]
_0803F64C:
	adds r0, r5, #0
	bl TacticianDrawCharacters
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _0803F662
_0803F65C:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F662:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0803F66C
sub_0803F66C: @ 0x0803F66C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F6B8
	movs r0, #2
	bl SioPlaySoundEffect
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r2, r5, #0
	adds r2, #0x48
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803F694
	subs r0, r1, #1
	strb r0, [r4]
_0803F694:
	ldrb r1, [r4]
	adds r0, r1, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r4, [r4]
	lsls r0, r4, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl TacticianDrawCharacters
	b _0803F6BE
_0803F6B8:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F6BE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SaveTactician
SaveTactician: @ 0x0803F6C4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803F702
	movs r0, #2
	bl SioPlaySoundEffect
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F6F4
	ldr r0, _0803F6F0 @ =0x0203D90C
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl SioUpdateTeam
	b _0803F6FA
	.align 2, 0
_0803F6F0: .4byte 0x0203D90C
_0803F6F4:
	adds r0, r4, #0
	bl SetTacticianName
_0803F6FA:
	adds r0, r5, #0
	bl Proc_Break
	b _0803F708
_0803F702:
	movs r0, #0
	bl SioPlaySoundEffect
_0803F708:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803F710
sub_0803F710: @ 0x0803F710
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0803F790 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F72E
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_0803F584
_0803F72E:
	ldr r1, [r6]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F744
	adds r0, r4, #0
	movs r1, #1
	adds r2, r5, #0
	bl sub_0803F584
_0803F744:
	ldr r1, [r6]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F75A
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl sub_0803F584
_0803F75A:
	ldr r1, [r6]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0803F770
	adds r0, r4, #0
	movs r1, #3
	adds r2, r5, #0
	bl sub_0803F584
_0803F770:
	ldr r1, [r6]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7B6
	adds r0, r5, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #4
	beq _0803F7A4
	cmp r0, #4
	bgt _0803F794
	cmp r0, #0
	beq _0803F79A
	b _0803F7B6
	.align 2, 0
_0803F790: .4byte 0x08B857F8
_0803F794:
	cmp r0, #5
	beq _0803F7AE
	b _0803F7B6
_0803F79A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F5DC
	b _0803F7B6
_0803F7A4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
	b _0803F7B6
_0803F7AE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SaveTactician
_0803F7B6:
	ldr r6, _0803F804 @ =0x08B857F8
	ldr r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7CE
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
_0803F7CE:
	ldr r1, [r6]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F7E4
	movs r0, #3
	bl SioPlaySoundEffect
	movs r0, #5
	strh r0, [r4, #0x34]
_0803F7E4:
	ldr r1, [r6]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803F820
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803F808
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F66C
	b _0803F820
	.align 2, 0
_0803F804: .4byte 0x08B857F8
_0803F808:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F820
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0803F820:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803F828
sub_0803F828: @ 0x0803F828
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0803F710
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	beq _0803F872
	movs r0, #3
	bl SioPlaySoundEffect
_0803F872:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl SioStrCpy
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #1
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_0803F2E4
	lsls r1, r0, #3
	subs r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r1, [r5, #0x30]
	subs r1, #4
	ldrh r2, [r5, #0x32]
	adds r2, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
	cmp r4, #1
	bhi _0803F8BC
	ldrb r0, [r0]
	b _0803F8BE
_0803F8BC:
	movs r0, #2
_0803F8BE:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl UpdateNameEntrySpriteDraw
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803F8D8
sub_0803F8D8: @ 0x0803F8D8
	ldr r0, _0803F900 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi _0803F924
	cmp r0, #0x27
	bhi _0803F90C
	ldr r1, _0803F904 @ =0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0803F908 @ =0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b _0803F924
	.align 2, 0
_0803F900: .4byte 0x04000006
_0803F904: .4byte 0x04000050
_0803F908: .4byte 0x00000F08
_0803F90C:
	ldr r1, _0803F928 @ =0x04000050
	ldr r2, _0803F92C @ =0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0803F930 @ =0x04000052
	ldr r0, _0803F934 @ =0x030013F8
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_0803F924:
	bx lr
	.align 2, 0
_0803F928: .4byte 0x04000050
_0803F92C: .4byte 0x00000442
_0803F930: .4byte 0x04000052
_0803F934: .4byte 0x030013F8

	thumb_func_start sub_0803F938
sub_0803F938: @ 0x0803F938
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803F94C @ =sub_0803F8D8
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_0803F94C: .4byte sub_0803F8D8

	thumb_func_start sub_0803F950
sub_0803F950: @ 0x0803F950
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _0803F98C @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0803F982
	adds r0, r6, #0
	bl Proc_Break
_0803F982:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F98C: .4byte 0x030013F8

	thumb_func_start sub_0803F990
sub_0803F990: @ 0x0803F990
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_0803F1A8
	movs r0, #2
	bl EnableBgSync
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803F9BC
sub_0803F9BC: @ 0x0803F9BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _0803F9FC @ =0x030013F8
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0803F9F4
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r6, #0
	bl Proc_Break
_0803F9F4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9FC: .4byte 0x030013F8

	thumb_func_start sub_0803FA00
sub_0803FA00: @ 0x0803FA00
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_08049220
	ldr r4, _0803FA30 @ =0x0203D998
	adds r0, r4, #0
	bl ClearText
	ldr r1, _0803FA34 @ =0x081D5288
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0803FA38 @ =0x02022F76
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803FA30: .4byte 0x0203D998
_0803FA34: .4byte 0x081D5288
_0803FA38: .4byte 0x02022F76

	thumb_func_start sub_0803FA3C
sub_0803FA3C: @ 0x0803FA3C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl sub_0804925C
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FA6A
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803FA6A
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_0803FA6A:
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _0803FA8C
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803FA8C
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl SioPlaySoundEffect
_0803FA8C:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl PutUiHand
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803FAD4
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, _0803FAD0 @ =0x02022F76
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_t
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _0803FB1A
	.align 2, 0
_0803FACC: .4byte 0x08B857F8
_0803FAD0: .4byte 0x02022F76
_0803FAD4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FB1A
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803FAFC
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _0803FAF8 @ =0x0203DC20
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0803FB02
	.align 2, 0
_0803FAF8: .4byte 0x0203DC20
_0803FAFC:
	movs r0, #1
	bl SioPlaySoundEffect
_0803FB02:
	ldr r0, _0803FB20 @ =0x02022F76
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_t
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
_0803FB1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803FB20: .4byte 0x02022F76

	thumb_func_start sub_0803FB24
sub_0803FB24: @ 0x0803FB24
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803FB34
	bl sub_08047CA8
_0803FB34:
	pop {r0}
	bx r0

	thumb_func_start SioPostBattleSprites_Init
SioPostBattleSprites_Init: @ 0x0803FB38
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl UnpackFaceChibiSprGraphics
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0803FB64
sub_0803FB64: @ 0x0803FB64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _0803FB88
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble _0803FB82
	adds r0, r6, #0
	bl Proc_Break
_0803FB82:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _0803FB8E
_0803FB88:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
_0803FB8E:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge _0803FB9C
	movs r0, #0
	str r0, [r6, #0x38]
_0803FB9C:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq _0803FBA4
	b _0803FCB4
_0803FBA4:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt _0803FBBC
	movs r1, #0x50
	rsbs r1, r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r6, #0x30]
_0803FBBC:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, _0803FC68 @ =0x08B98EE4
	movs r0, #0x43
	adds r0, r0, r6
	mov r8, r0
	ldrb r5, [r0]
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, _0803FC6C @ =0x08B98ED4
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r7, [r5]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0803FC70 @ =0x081D52DE
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0803FC74 @ =0x081D5314
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _0803FC78 @ =0x081D52E6
	movs r0, #0xf
	ldrb r7, [r5]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, _0803FC7C @ =0x081D5300
	ldrb r0, [r5]
	cmp r0, #3
	beq _0803FC80
	lsls r0, r0, #3
	ldrb r4, [r5]
	adds r0, r0, r4
	b _0803FC82
	.align 2, 0
_0803FC68: .4byte 0x08B98EE4
_0803FC6C: .4byte 0x08B98ED4
_0803FC70: .4byte 0x081D52DE
_0803FC74: .4byte 0x081D5314
_0803FC78: .4byte 0x081D52E6
_0803FC7C: .4byte 0x081D5300
_0803FC80:
	movs r0, #0x40
_0803FC82:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _0803FCC0 @ =0x081D531C
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
_0803FCB4:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FCC0: .4byte 0x081D531C

	thumb_func_start sub_0803FCC4
sub_0803FCC4: @ 0x0803FCC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, _0803FD74 @ =0x08B98EE4
	movs r0, #0x43
	adds r0, r0, r5
	mov r8, r0
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, _0803FD78 @ =0x08B98ED4
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r7, [r6]
	lsls r0, r7, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0803FD7C @ =0x081D52DE
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0803FD80 @ =0x081D5314
	mov r4, r8
	ldrb r4, [r4]
	lsls r0, r4, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _0803FD84 @ =0x081D52E6
	movs r0, #0xf
	ldrb r7, [r6]
	ands r0, r7
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	rsbs r0, r0, #0
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, _0803FD88 @ =0x081D5300
	ldrb r0, [r6]
	cmp r0, #3
	beq _0803FD8C
	lsls r0, r0, #3
	ldrb r6, [r6]
	adds r0, r0, r6
	b _0803FD8E
	.align 2, 0
_0803FD74: .4byte 0x08B98EE4
_0803FD78: .4byte 0x08B98ED4
_0803FD7C: .4byte 0x081D52DE
_0803FD80: .4byte 0x081D5314
_0803FD84: .4byte 0x081D52E6
_0803FD88: .4byte 0x081D5300
_0803FD8C:
	movs r0, #0x40
_0803FD8E:
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	rsbs r1, r1, #0
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _0803FDD0 @ =0x081D531C
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FDD0: .4byte 0x081D531C

	thumb_func_start StartDrawLinkArenaRankSprites
StartDrawLinkArenaRankSprites: @ 0x0803FDD4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0803FE20 @ =0x08B98EF4
	mov r1, r8
	bl SpawnProc
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, sb
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803FE20: .4byte 0x08B98EF4

	thumb_func_start sub_0803FE24
sub_0803FE24: @ 0x0803FE24
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, _0803FE64 @ =0x02023C60
	adds r3, r2, #0
	adds r3, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _0803FE74
	ldr r2, _0803FE68 @ =0x081D532A
	lsls r0, r1, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, _0803FE6C @ =0x081C81C4
	ldr r2, _0803FE70 @ =0x00002060
	bl TmApplyTsa_t
	b _0803FE9E
	.align 2, 0
_0803FE64: .4byte 0x02023C60
_0803FE68: .4byte 0x081D532A
_0803FE6C: .4byte 0x081C81C4
_0803FE70: .4byte 0x00002060
_0803FE74:
	movs r2, #0
	ldr r7, _0803FEA4 @ =0x081D532A
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, _0803FEA8 @ =0x00001034
	adds r4, r5, #0
_0803FE80:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble _0803FE80
_0803FE9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FEA4: .4byte 0x081D532A
_0803FEA8: .4byte 0x00001034

	thumb_func_start sub_0803FEAC
sub_0803FEAC: @ 0x0803FEAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _0803FF00 @ =0x02000C60
	bl SetTextFont
	movs r5, #0
	cmp r5, sb
	bge _0803FF3A
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
_0803FED6:
	ldr r0, _0803FF04 @ =0x0203D9AD
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextLen
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt _0803FF0C
	adds r1, r7, r1
	ldr r0, _0803FF08 @ =0x0203DA10
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
	b _0803FF16
	.align 2, 0
_0803FF00: .4byte 0x02000C60
_0803FF04: .4byte 0x0203D9AD
_0803FF08: .4byte 0x0203DA10
_0803FF0C:
	ldr r0, _0803FF4C @ =0x0203DA18
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertDrawString
_0803FF16:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, _0803FF4C @ =0x0203DA18
	mov r1, r8
	movs r2, #2
	bl SioDrawNumber
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0x13
	adds r5, #1
	cmp r5, sb
	blt _0803FED6
_0803FF3A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF4C: .4byte 0x0203DA18

	thumb_func_start SioPostBattle_StartMusicProc
SioPostBattle_StartMusicProc: @ 0x0803FF50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803FF70 @ =0x08B98F74
	adds r1, r4, #0
	bl SpawnProc
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne _0803FF74
	movs r0, #1
	b _0803FF76
	.align 2, 0
_0803FF70: .4byte 0x08B98F74
_0803FF74:
	movs r0, #0
_0803FF76:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0803FF80
sub_0803FF80: @ 0x0803FF80
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _080400E4 @ =0x081C5BE0
	ldr r1, _080400E8 @ =0x06014800
	bl Decompress
	ldr r0, _080400EC @ =0x081C6DEC
	ldr r1, _080400F0 @ =0x06016000
	bl Decompress
	ldr r0, _080400F4 @ =0x081C7018
	ldr r1, _080400F8 @ =0x06016800
	bl Decompress
	ldr r0, _080400FC @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _08040100 @ =0x081C80A4
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08040104 @ =0x081C7794
	ldr r1, _08040108 @ =0x06000C00
	bl Decompress
	ldr r0, _0804010C @ =0x081C80E4
	movs r1, #0x40
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _08040110 @ =0x081C9F68
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08040114 @ =0x081CB5BC
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl ApplyPaletteExt
	ldr r0, _08040118 @ =0x02024460
	ldr r1, _0804011C @ =0x081CB63C
	movs r2, #0
	bl TmApplyTsa_t
	ldr r0, _08040120 @ =0x02000C60
	ldr r1, _08040124 @ =0x06012000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _08040128 @ =0x08194674
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _0804012C @ =0x0203DA10
	movs r5, #1
_08040020:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08040020
	ldr r0, _08040130 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	mov r0, sp
	movs r5, #0
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, _08040134 @ =0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl sub_080440E8
	adds r0, r6, #0
	bl sub_0803FEAC
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl SetBgOffset
	ldr r3, _08040138 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _0804013C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _08040140 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	adds r0, r6, #0
	bl SioPostBattle_StartMusicProc
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080400E4: .4byte 0x081C5BE0
_080400E8: .4byte 0x06014800
_080400EC: .4byte 0x081C6DEC
_080400F0: .4byte 0x06016000
_080400F4: .4byte 0x081C7018
_080400F8: .4byte 0x06016800
_080400FC: .4byte 0x081C7F04
_08040100: .4byte 0x081C80A4
_08040104: .4byte 0x081C7794
_08040108: .4byte 0x06000C00
_0804010C: .4byte 0x081C80E4
_08040110: .4byte 0x081C9F68
_08040114: .4byte 0x081CB5BC
_08040118: .4byte 0x02024460
_0804011C: .4byte 0x081CB63C
_08040120: .4byte 0x02000C60
_08040124: .4byte 0x06012000
_08040128: .4byte 0x08194674
_0804012C: .4byte 0x0203DA10
_08040130: .4byte 0x08B98AEC
_08040134: .4byte 0x01000010
_08040138: .4byte 0x03002870
_0804013C: .4byte 0x0000FFE0
_08040140: .4byte 0x0000E0FF

	thumb_func_start sub_08040144
sub_08040144: @ 0x08040144
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	bl sub_080490D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq _080401CE
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, _080401E4 @ =0x081D532A
	ldrb r0, [r5]
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne _080401CE
	adds r0, r4, #0
	bl sub_0803FE24
	movs r0, #4
	bl EnableBgSync
	ldr r2, _080401E8 @ =0x0203DC9C
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl StartDrawLinkArenaRankSprites
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_080401CE:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _080401DA
	adds r0, r4, #0
	bl Proc_Break
_080401DA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080401E4: .4byte 0x081D532A
_080401E8: .4byte 0x0203DC9C

	thumb_func_start sub_080401EC
sub_080401EC: @ 0x080401EC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080490D4
	ldr r0, _08040228 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08040222
	ldr r2, _0804022C @ =0x0869D668
	ldr r1, _08040230 @ =0x0869D6E0
	ldr r0, _08040234 @ =0x0000040C
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
_08040222:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040228: .4byte 0x08B857F8
_0804022C: .4byte 0x0869D668
_08040230: .4byte 0x0869D6E0
_08040234: .4byte 0x0000040C

	thumb_func_start sub_08040238
sub_08040238: @ 0x08040238
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0804024C
	movs r0, #0x2d
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	b _08040256
_0804024C:
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
_08040256:
	ldr r0, _0804026C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040268
	movs r0, #0x81
	bl m4aSongNumStart
_08040268:
	pop {r0}
	bx r0
	.align 2, 0
_0804026C: .4byte 0x0202BBF8

	thumb_func_start sub_08040270
sub_08040270: @ 0x08040270
	push {lr}
	movs r0, #0x2e
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0

	thumb_func_start sub_08040280
sub_08040280: @ 0x08040280
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r1, r3, #0
	movs r2, #0
	ldr r4, _080402B8 @ =0x0203DB68
_0804029C:
	lsls r0, r2, #4
	adds r0, r0, r4
	ldr r0, [r0]
	lsrs r0, r0, #5
	cmp r0, r1
	bhs _080402BC
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble _0804032E
	b _080402C8
	.align 2, 0
_080402B8: .4byte 0x0203DB68
_080402BC:
	adds r2, #1
	cmp r2, #9
	ble _0804029C
	movs r0, #1
	rsbs r0, r0, #0
	b _08040392
_080402C8:
	ldr r6, _080403A4 @ =0x0203DB68
	lsls r1, r2, #4
	adds r4, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r5, r2, #4
	adds r5, r5, r6
	ldrb r0, [r5]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #0x1e
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldr r3, [r5]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r4]
	movs r2, #0xc
	ldrb r0, [r5]
	ands r2, r0
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	movs r3, #0x10
	ldrb r5, [r5]
	ands r3, r5
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	adds r0, r6, #0
	subs r0, #0xc
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl SioStrCpy
	mov r2, r8
	cmp r2, r7
	bgt _080402C8
_0804032E:
	ldr r5, _080403A4 @ =0x0203DB68
	lsls r1, r7, #4
	adds r4, r1, r5
	movs r3, #3
	ldr r2, [sp]
	ands r2, r3
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r6, [r4]
	ands r0, r6
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r6, sb
	ands r6, r3
	lsls r2, r6, #2
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r3, [r4]
	ands r0, r3
	orrs r0, r2
	movs r2, #1
	mov r6, sl
	ands r6, r2
	lsls r3, r6, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _080403A8 @ =0x08B98AEC
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	subs r0, r0, r2
	ldr r2, _080403AC @ =0x0203D9AD
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl SioStrCpy
	adds r0, r7, #0
_08040392:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080403A4: .4byte 0x0203DB68
_080403A8: .4byte 0x08B98AEC
_080403AC: .4byte 0x0203D9AD

	thumb_func_start sub_080403B0
sub_080403B0: @ 0x080403B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, _08040420 @ =0x0203D90C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r5, r1, #0x1e
	lsrs r5, r5, #0x1f
	adds r0, #0xa0
	ldrb r0, [r0]
	subs r0, #1
	mov sb, r0
	bl sub_0804528C
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08040424 @ =0x0203DC9C
	ldr r0, _08040428 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r6, _0804042C @ =0x0203DB68
	adds r0, r6, #0
	bl sub_080A1F2C
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl sub_08040280
	str r0, [r7, #0x58]
	adds r0, r6, #0
	bl sub_080A1EF0
	ldr r1, [r7, #0x58]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08040430
	adds r0, r1, #0
	adds r1, r7, #0
	bl StartSioResultNewHighScore
	b _08040436
	.align 2, 0
_08040420: .4byte 0x0203D90C
_08040424: .4byte 0x0203DC9C
_08040428: .4byte 0x08B98AEC
_0804042C: .4byte 0x0203DB68
_08040430:
	movs r0, #1
	bl FadeBgmOut
_08040436:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08040444
sub_08040444: @ 0x08040444
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _080404CC @ =0x081D5352
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, _080404D0 @ =0x0203D90C
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08040520
	mov sb, r1
_0804046C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, sb
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	subs r2, r2, r6
	ldr r1, _080404D4 @ =0x0203D9AD
	adds r2, r2, r1
	adds r1, r5, #0
	bl sub_080A1E8C
	movs r7, #0
	adds r2, r6, #1
	mov sl, r2
	lsls r0, r6, #1
	ldr r1, _080404D8 @ =0x0203DCC0
	adds r0, r0, r1
	mov r8, r0
_080404A0:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r2, #0
	strb r2, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	movs r0, #0
	strb r0, [r5, #0x1b]
	movs r0, #4
	ldr r1, _080404DC @ =0x0203DA0C
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080404E0
	adds r0, r5, #0
	bl sub_0803DD40
	b _080404E6
	.align 2, 0
_080404CC: .4byte 0x081D5352
_080404D0: .4byte 0x0203D90C
_080404D4: .4byte 0x0203D9AD
_080404D8: .4byte 0x0203DCC0
_080404DC: .4byte 0x0203DA0C
_080404E0:
	adds r0, r5, #0
	bl sub_08048E0C
_080404E6:
	cmp r7, #0
	bne _080404F4
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	mov r2, r8
	strh r0, [r2]
_080404F4:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _0804050C
	movs r0, #1
	ldr r1, _08040558 @ =0x0203DA0C
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804050C
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_0804050C:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _080404A0
	mov r6, sl
	mov r2, sb
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r6, r0
	blt _0804046C
_08040520:
	ldr r0, _0804055C @ =0x0203DC9C
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08040560 @ =0x08B98AEC
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08040564 @ =0x0203D90C
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040558: .4byte 0x0203DA0C
_0804055C: .4byte 0x0203DC9C
_08040560: .4byte 0x08B98AEC
_08040564: .4byte 0x0203D90C

	thumb_func_start sub_08040568
sub_08040568: @ 0x08040568
	push {lr}
	ldr r0, _08040578 @ =0x08B9A0E8
	movs r1, #2
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08040578: .4byte 0x08B9A0E8

	thumb_func_start sub_0804057C
sub_0804057C: @ 0x0804057C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080405B4 @ =0x08B9A0E8
	bl Proc_Find
	cmp r0, #0
	bne _080405AE
	ldr r5, _080405B8 @ =0x0203D90C
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _0804059A
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0804059A:
	ldrb r5, [r5, #0xb]
	cmp r5, #2
	bne _080405A8
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080405A8:
	adds r0, r4, #0
	bl Proc_Break
_080405AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080405B4: .4byte 0x08B9A0E8
_080405B8: .4byte 0x0203D90C

	thumb_func_start sub_080405BC
sub_080405BC: @ 0x080405BC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ResetTextFont
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkPrintDelay
	movs r0, #1
	bl SetActiveTalkFace
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08040610
sub_08040610: @ 0x08040610
	push {lr}
	ldr r0, _08040628 @ =0x08B98B60
	bl Proc_EndEach
	ldr r0, _0804062C @ =0x08B98B88
	bl Proc_EndEach
	ldr r0, _08040630 @ =0x08B98B38
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08040628: .4byte 0x08B98B60
_0804062C: .4byte 0x08B98B88
_08040630: .4byte 0x08B98B38

	thumb_func_start sub_08040634
sub_08040634: @ 0x08040634
	push {lr}
	bl SioReleaseIrq
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08040640
sub_08040640: @ 0x08040640
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _080406BC @ =0x0203D90C
	mov sb, r0
	movs r1, #0x98
	lsls r1, r1, #2
	mov r8, r1
	movs r0, #0xa1
	add r0, sb
	mov sl, r0
	movs r7, #5
_08040660:
	mov r0, sb
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _080406C0 @ =0x08B98AEC
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r0, [r0]
	ldrb r1, [r5]
	cmp r1, r0
	beq _080406F0
	strb r0, [r5]
	lsls r1, r6, #3
	mov r0, sb
	adds r0, #0xc
	adds r4, r1, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldrb r0, [r5]
	cmp r0, #4
	bhi _080406CC
	ldr r1, _080406C4 @ =0x081D5204
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	bl PutDrawTextCentered
	ldr r0, _080406C8 @ =0x081C8164
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080406EA
	.align 2, 0
_080406BC: .4byte 0x0203D90C
_080406C0: .4byte 0x08B98AEC
_080406C4: .4byte 0x081D5204
_080406C8: .4byte 0x081C8164
_080406CC:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	adds r2, r7, #0
	mov r3, sl
	bl PutDrawTextCentered
	lsls r0, r6, #5
	ldr r1, _08040710 @ =0x081C7F04
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl ApplyPaletteExt
_080406EA:
	movs r0, #1
	bl EnableBgSync
_080406F0:
	movs r1, #0x20
	add r8, r1
	movs r0, #0x13
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08040660
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040710: .4byte 0x081C7F04

	thumb_func_start sub_08040714
sub_08040714: @ 0x08040714
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _08040830 @ =0x081C5BE0
	ldr r1, _08040834 @ =0x06014800
	bl Decompress
	ldr r0, _08040838 @ =0x081C6DEC
	ldr r1, _0804083C @ =0x06016000
	bl Decompress
	ldr r0, _08040840 @ =0x081C64A4
	ldr r1, _08040844 @ =0x06016800
	bl Decompress
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08040740:
	ldr r0, _08040848 @ =0x081C8164
	adds r1, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08040740
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r4, _0804084C @ =0x0203D90C
	ldrb r0, [r4, #3]
	add r1, sp, #8
	bl sub_080A1C44
	ldr r0, _08040850 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_0804077C:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _0804077C
	bl sub_08040640
	movs r5, #0
	ldr r2, _08040854 @ =0x030046C6
_08040792:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #8
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x12
	ble _08040792
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0x48
	movs r1, #0x20
	adds r2, r6, #0
	bl StartLinkArenaVersusSpriteDraw
	str r0, [r6, #0x2c]
	ldr r0, _08040858 @ =0x08B99064
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	ldr r0, [r6, #0x2c]
	ldr r1, _0804085C @ =0x081D5260
	ldr r4, _0804084C @ =0x0203D90C
	ldrb r2, [r4]
	adds r1, r2, r1
	ldrb r1, [r1]
	bl sub_08047D80
	ldr r0, _08040860 @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _08040864 @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	ldr r2, [r6, #0x2c]
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r0, [r6, #0x30]
	ldr r1, _08040868 @ =0x000003C6
	adds r0, r0, r1
	movs r1, #1
	bl PutSioText
	ldr r2, _0804086C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040830: .4byte 0x081C5BE0
_08040834: .4byte 0x06014800
_08040838: .4byte 0x081C6DEC
_0804083C: .4byte 0x06016000
_08040840: .4byte 0x081C64A4
_08040844: .4byte 0x06016800
_08040848: .4byte 0x081C8164
_0804084C: .4byte 0x0203D90C
_08040850: .4byte 0x0203DA60
_08040854: .4byte 0x030046C6
_08040858: .4byte 0x08B99064
_0804085C: .4byte 0x081D5260
_08040860: .4byte 0x08B98CA8
_08040864: .4byte 0x081D5254
_08040868: .4byte 0x000003C6
_0804086C: .4byte 0x03002870

	thumb_func_start sub_08040870
sub_08040870: @ 0x08040870
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080408A8 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _080408AC @ =0x08B98B60
	movs r1, #0
	bl SpawnProc
	ldr r0, _080408B0 @ =0x08B98B88
	adds r1, r4, #0
	bl SpawnProc
	ldr r0, _080408B4 @ =0x08B98B38
	adds r1, r4, #0
	bl SpawnProc
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080408A8: .4byte 0x00002586
_080408AC: .4byte 0x08B98B60
_080408B0: .4byte 0x08B98B88
_080408B4: .4byte 0x08B98B38

	thumb_func_start sub_080408B8
sub_080408B8: @ 0x080408B8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _080408F8 @ =0x0203DC24
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_08040640
	ldr r0, _080408FC @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	beq _08040904
	ldr r0, _08040900 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _080408EA
	b _08040ACE
_080408EA:
	movs r0, #1
	bl SioPlaySoundEffect
	bl EndLinkArenaButtonSpriteDraw
	b _08040938
	.align 2, 0
_080408F8: .4byte 0x0203DC24
_080408FC: .4byte 0x08B98B38
_08040900: .4byte 0x08B857F8
_08040904:
	bl EndLinkArenaButtonSpriteDraw
	ldr r2, _0804094C @ =0x08B98AEC
	ldr r1, [r2]
	movs r0, #6
	ldrsb r0, [r1, r0]
	str r0, [r5, #0x34]
	movs r3, #0
	adds r1, #0x1a
	adds r5, r2, #0
_08040918:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08040922
	adds r6, #1
_08040922:
	adds r3, #1
	cmp r3, #3
	ble _08040918
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08040950
_08040938:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08040ACE
	.align 2, 0
_0804094C: .4byte 0x08B98AEC
_08040950:
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040966
	ldr r0, [r5]
	ldrb r1, [r0, #0x1e]
	cmp r1, #0x3c
	bhi _08040966
	cmp r6, #0
	beq _08040990
_08040966:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	bl sub_08040870
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _0804098C @ =0x000003C6
	movs r1, #1
	bl PutSioText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	b _08040ACE
	.align 2, 0
_0804098C: .4byte 0x000003C6
_08040990:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08040A24
	bl sub_0803CDE8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040A24
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _080409BA
	movs r0, #2
	str r0, [r4, #0x30]
	movs r0, #0xf2
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
_080409BA:
	ldr r0, _08040A18 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08040A36
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_080409D8:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _080409D8
	movs r0, #2
	bl SioPlaySoundEffect
	bl sub_0803CCC4
	ldr r2, _08040A1C @ =0x08B98AEC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08040A20 @ =0x0203D90C
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_0803D674
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl SioEmitData
	str r0, [r4, #0x34]
	b _08040A94
	.align 2, 0
_08040A18: .4byte 0x08B857F8
_08040A1C: .4byte 0x08B98AEC
_08040A20: .4byte 0x0203D90C
_08040A24:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _08040A36
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _08040A9C @ =0x000003C7
	movs r1, #1
	bl PutSioText
_08040A36:
	ldr r5, _08040AA0 @ =0x08B98AEC
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08040AA8
	ldrb r0, [r1, #6]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040AA8
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040AA8
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r3, #0
	adds r2, r5, #0
	movs r1, #0
_08040A6E:
	ldr r0, [r2]
	adds r0, #0x1a
	adds r0, r0, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #3
	ble _08040A6E
	bl sub_0803CCC4
	ldr r2, _08040AA0 @ =0x08B98AEC
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08040AA4 @ =0x0203D90C
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_0803D674
_08040A94:
	adds r0, r4, #0
	bl Proc_Break
	b _08040ACE
	.align 2, 0
_08040A9C: .4byte 0x000003C7
_08040AA0: .4byte 0x08B98AEC
_08040AA4: .4byte 0x0203D90C
_08040AA8:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08040ACE
	ldr r0, _08040AD8 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldr r1, _08040ADC @ =0x08B98AEC
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl sub_0803CE34
_08040ACE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040AD8: .4byte 0x030046C0
_08040ADC: .4byte 0x08B98AEC

	thumb_func_start sub_08040AE0
sub_08040AE0: @ 0x08040AE0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08040640
	ldr r1, _08040B38 @ =0x0203DC24
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _08040B3C @ =0x0203D90C
	adds r0, #0xa0
	ldr r1, _08040B40 @ =0x08B98AEC
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _08040B08
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _08040B48
_08040B08:
	bl sub_08040610
	bl sub_08040634
	adds r0, r4, #0
	bl sub_08040870
	movs r0, #0
	str r0, [r4, #0x30]
	ldr r0, _08040B44 @ =0x000003C6
	movs r1, #1
	bl PutSioText
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl StartLinkArenaButtonSpriteDraw
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08040B6C
	.align 2, 0
_08040B38: .4byte 0x0203DC24
_08040B3C: .4byte 0x0203D90C
_08040B40: .4byte 0x08B98AEC
_08040B44: .4byte 0x000003C6
_08040B48:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08040B74
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r2, #9]
	ldrb r0, [r0]
	ands r1, r0
	adds r0, r1, #0
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08040B7A
_08040B6C:
	adds r0, r4, #0
	bl Proc_Break
	b _08040B7A
_08040B74:
	adds r0, r4, #0
	bl Proc_Break
_08040B7A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08040B80
sub_08040B80: @ 0x08040B80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _08040C18 @ =0x000003C7
	movs r1, #1
	bl PutSioText
	ldr r0, _08040C1C @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08040C04
	bl GetGameTime
	ldr r7, _08040C20 @ =0x0203D90C
	adds r4, r7, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	bl __umodsi3
	adds r5, r6, #0
	adds r5, #0x3b
	strb r0, [r5]
	bl RandNextB
	movs r1, #3
	ands r1, r0
	adds r1, #4
	ldrb r4, [r4]
	adds r3, r4, #0
	muls r3, r1, r3
	ldrb r0, [r5]
	adds r3, r0, r3
	adds r0, r6, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldrb r1, [r0]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r5]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl RandGetSt
	mov r0, sp
	movs r1, #0x10
	bl SioEmitData
	str r0, [r6, #0x34]
_08040C04:
	adds r0, r6, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040C18: .4byte 0x000003C7
_08040C1C: .4byte 0x08B98AEC
_08040C20: .4byte 0x0203D90C

	thumb_func_start sub_08040C24
sub_08040C24: @ 0x08040C24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _08040C64 @ =0x08B98AEC
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _08040C68
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08040CEE
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b _08040CEE
	.align 2, 0
_08040C64: .4byte 0x08B98AEC
_08040C68:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08040CEE
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040CEE
	ldr r4, _08040CF8 @ =0x0203D90C
	mov r0, sp
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r4, r2
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl RandSetSt
	movs r0, #0xf3
	lsls r0, r0, #2
	movs r1, #1
	bl PutSioText
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
_08040CEE:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040CF8: .4byte 0x0203D90C

	thumb_func_start sub_08040CFC
sub_08040CFC: @ 0x08040CFC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _08040DA0
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08040D78 @ =0x0203D90C
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _08040D7C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040D50
	movs r0, #0x7d
	bl m4aSongNumStart
_08040D50:
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040DA0
	adds r0, r6, #0
	adds r0, #0x3b
	ldr r1, _08040D80 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r2, [r0]
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r1, #6]
	cmp r0, r1
	beq _08040D88
	ldr r1, _08040D84 @ =0x000003CE
	adds r0, r2, r1
	movs r1, #1
	bl PutSioText
	b _08040D90
	.align 2, 0
_08040D78: .4byte 0x0203D90C
_08040D7C: .4byte 0x0202BBF8
_08040D80: .4byte 0x08B98AEC
_08040D84: .4byte 0x000003CE
_08040D88:
	ldr r0, _08040DA8 @ =0x000003CD
	movs r1, #1
	bl PutSioText
_08040D90:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _08040DAC @ =0x0203DC9C
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08040DA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040DA8: .4byte 0x000003CD
_08040DAC: .4byte 0x0203DC9C

	thumb_func_start sub_08040DB0
sub_08040DB0: @ 0x08040DB0
	push {lr}
	ldr r0, _08040DC8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040DC4
	movs r0, #0x7e
	bl m4aSongNumStart
_08040DC4:
	pop {r0}
	bx r0
	.align 2, 0
_08040DC8: .4byte 0x0202BBF8

	thumb_func_start sub_08040DCC
sub_08040DCC: @ 0x08040DCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r1, _08040DF8 @ =0x0203D90C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040DFC
	adds r0, r5, #0
	bl sub_0803DD40
	b _08040E02
	.align 2, 0
_08040DF8: .4byte 0x0203D90C
_08040DFC:
	adds r0, r5, #0
	bl sub_08048E0C
_08040E02:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08040E08
sub_08040E08: @ 0x08040E08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	ldr r0, _08040EC4 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _08040EC8 @ =0x0203DC24
	movs r0, #0
	str r0, [r1]
	bl InitUnits
	ldr r0, _08040ECC @ =0x0203D90C
	ldrb r0, [r0, #3]
	ldr r4, _08040ED0 @ =0x08B99084
	ldr r1, [r4]
	bl sub_080A1C10
	movs r6, #0
	ldr r0, _08040ED4 @ =0x0203DCC0
	mov sl, r0
	movs r7, #0x14
_08040E42:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, _08040ED0 @ =0x08B99084
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_08040DCC
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _08040E80
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08040EC4 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_08040E80:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _08040E42
	ldr r2, _08040EC4 @ =0x08B98AEC
	mov r3, sb
	adds r3, #0x64
	mov r4, sb
	adds r4, #0x4c
	ldr r0, _08040ECC @ =0x0203D90C
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_08040E9A:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _08040E9A
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040EC4: .4byte 0x08B98AEC
_08040EC8: .4byte 0x0203DC24
_08040ECC: .4byte 0x0203D90C
_08040ED0: .4byte 0x08B99084
_08040ED4: .4byte 0x0203DCC0

	thumb_func_start sub_08040ED8
sub_08040ED8: @ 0x08040ED8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov sb, r0
	movs r0, #0
	mov sl, r0
	mov r0, sb
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08040F08
	ldr r0, _08041044 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08040F08
	movs r0, #0x7c
	bl m4aSongNumStart
_08040F08:
	mov r1, sb
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08040F1E
	movs r0, #0
	strh r0, [r1]
_08040F1E:
	mov r4, sb
	adds r4, #0x64
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #4
	bgt _08040F5E
	ldr r2, _08041048 @ =0x08B99084
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x14
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl SioEmitData
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r3, sb
	str r0, [r3, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _0804104C @ =0x0203D90C
	ldr r0, _08041050 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_08040F5E:
	bl GetGameTime
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _08041034
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08040FF0
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _0804104C @ =0x0203D90C
	mov r8, r1
	mov r7, r8
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_08040DCC
	ldrb r3, [r6]
	adds r0, r3, r7
	ldrb r0, [r0]
	adds r4, r0, r4
	strb r4, [r5, #0xb]
	ldrb r1, [r6]
	adds r0, r1, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040FD0
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _08041054 @ =0x0203DC9C
	ldrb r3, [r6]
	lsls r2, r3, #1
	adds r1, #0x24
	adds r2, r2, r1
	strh r0, [r2]
_08040FD0:
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08040FE6
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08040FE6:
	ldrb r6, [r6]
	adds r1, r6, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08040FF0:
	movs r4, #0
	ldr r5, _08041058 @ =0x0203D9A8
_08040FF4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041014
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _08041014
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_08041014:
	adds r4, #1
	cmp r4, #3
	ble _08040FF4
	mov r0, sl
	cmp r0, #0
	bne _08041034
	ldr r0, _08041050 @ =0x08B98AEC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, sb
	bl Proc_Break
_08041034:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041044: .4byte 0x0202BBF8
_08041048: .4byte 0x08B99084
_0804104C: .4byte 0x0203D90C
_08041050: .4byte 0x08B98AEC
_08041054: .4byte 0x0203DC9C
_08041058: .4byte 0x0203D9A8

	thumb_func_start sub_0804105C
sub_0804105C: @ 0x0804105C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0804107C
	ldr r0, _080410F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804107C
	movs r0, #0x7c
	bl m4aSongNumStart
_0804107C:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _08041092
	strh r6, [r1]
_08041092:
	ldr r0, _080410F4 @ =0x0203DC24
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _080410A6
	bl StartSioErrorScreen
_080410A6:
	ldr r0, _080410F8 @ =0x0300479C
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _080410FC @ =0x08B98AEC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _080410E8
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _080410E8
	ldr r0, _08041100 @ =0x08B98BAC
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_Break
_080410E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410F0: .4byte 0x0202BBF8
_080410F4: .4byte 0x0203DC24
_080410F8: .4byte 0x0300479C
_080410FC: .4byte 0x08B98AEC
_08041100: .4byte 0x08B98BAC

	thumb_func_start sub_08041104
sub_08041104: @ 0x08041104
	push {r4, r5, lr}
	adds r5, r0, #0
	bl ClearSioBG
	bl sub_08047B34
	bl sub_080490B4
	movs r0, #3
	bl EndFaceById
	ldr r4, _0804115C @ =0x0203D960
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, _08041160 @ =0x00000785
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08041164 @ =0x02023F72
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041168 @ =0x08B98BAC
	adds r1, r5, #0
	bl SpawnProc
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	movs r0, #0xf
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804115C: .4byte 0x0203D960
_08041160: .4byte 0x00000785
_08041164: .4byte 0x02023F72
_08041168: .4byte 0x08B98BAC

	thumb_func_start sub_0804116C
sub_0804116C: @ 0x0804116C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	mov sb, r0
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _0804128C @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041290 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041294 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041298 @ =0x081C5BE0
	ldr r1, _0804129C @ =0x06014800
	bl Decompress
	ldr r0, _080412A0 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_08047C38
	ldr r0, _080412A4 @ =0x0203DA60
	bl SetTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	add r0, sp, #8
	bl sub_08041FD4
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _080412A8 @ =0x081D5358
_080411DE:
	lsls r4, r5, #3
	ldr r1, _080412AC @ =0x0203D918
	mov r8, r1
	add r4, r8
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r6]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _080412B0 @ =0x02022C6C
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_0804203C
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _080411DE
	ldr r5, _080412A8 @ =0x081D5358
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _080412B4 @ =0x0202369C
	adds r0, r0, r4
	movs r1, #0
	bl sub_080417BC
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_080417BC
	ldr r0, _080412B8 @ =0x081D5260
	mov r4, r8
	subs r4, #0xc
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	mov r0, sb
	bl sub_08047D80
	ldr r0, _080412BC @ =0x08B98CA8
	ldrb r3, [r4]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, _080412C0 @ =0x081D5254
	adds r1, r1, r2
	ldr r1, [r1]
	str r3, [sp]
	mov r2, sb
	str r2, [sp, #4]
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r0, _080412C4 @ =0x000003C9
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804128C: .4byte 0x081C6A18
_08041290: .4byte 0x06000C00
_08041294: .4byte 0x081C7F84
_08041298: .4byte 0x081C5BE0
_0804129C: .4byte 0x06014800
_080412A0: .4byte 0x081C7F04
_080412A4: .4byte 0x0203DA60
_080412A8: .4byte 0x081D5358
_080412AC: .4byte 0x0203D918
_080412B0: .4byte 0x02022C6C
_080412B4: .4byte 0x0202369C
_080412B8: .4byte 0x081D5260
_080412BC: .4byte 0x08B98CA8
_080412C0: .4byte 0x081D5254
_080412C4: .4byte 0x000003C9

	thumb_func_start sub_080412C8
sub_080412C8: @ 0x080412C8
	push {lr}
	movs r0, #3
	bl sub_0803D500
	pop {r0}
	bx r0

	thumb_func_start sub_080412D4
sub_080412D4: @ 0x080412D4
	push {lr}
	movs r0, #0
	bl sub_0803D500
	pop {r0}
	bx r0

	thumb_func_start sub_080412E0
sub_080412E0: @ 0x080412E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x5c]
	add r5, sp, #0x50
	ldr r1, _080413BC @ =0x081D5394
	adds r0, r5, #0
	movs r2, #6
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r0, _080413C0 @ =0x081C5BE0
	ldr r1, _080413C4 @ =0x06014800
	bl Decompress
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _080413C8 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	ldr r4, _080413CC @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _080413D0 @ =0x000003CA
	movs r1, #0
	bl PutSioText
	ldr r0, _080413D4 @ =0x000003CB
	movs r1, #1
	bl PutSioText
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x4c]
	movs r1, #2
	mov sb, r1
	mov r2, sp
	adds r2, #0x58
	str r2, [sp, #0x60]
	movs r6, #8
	mov r4, sp
	adds r4, #0x5a
	adds r5, r7, #0
	adds r5, #0x40
_0804136C:
	movs r0, #0
	strb r0, [r4]
	mov r0, sb
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804143E
	mov r0, sb
	add r1, sp, #8
	bl ReadGameSavePlaySt
	add r0, sp, #8
	bl GetChapterTitle
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r6
	str r0, [r1]
	add r1, sp, #8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _080413A8
	movs r0, #4
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
_080413A8:
	add r0, sp, #8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080413E2
	cmp r0, #2
	bgt _080413D8
	cmp r0, #1
	beq _080413DE
	b _080413F2
	.align 2, 0
_080413BC: .4byte 0x081D5394
_080413C0: .4byte 0x081C5BE0
_080413C4: .4byte 0x06014800
_080413C8: .4byte 0x0203DA60
_080413CC: .4byte 0x0203DC08
_080413D0: .4byte 0x000003CA
_080413D4: .4byte 0x000003CB
_080413D8:
	cmp r0, #3
	beq _080413EA
	b _080413F2
_080413DE:
	movs r0, #0x10
	b _080413EC
_080413E2:
	movs r0, #0x20
	ldrb r1, [r4]
	orrs r0, r1
	b _080413F0
_080413EA:
	movs r0, #0x40
_080413EC:
	ldrb r2, [r4]
	orrs r0, r2
_080413F0:
	strb r0, [r4]
_080413F2:
	add r0, sp, #8
	bl sub_080A0A10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804140E
	mov r1, sl
	adds r0, r1, r6
	ldr r0, [r0]
	str r0, [r5]
	movs r2, #0x38
	adds r2, r2, r7
	mov r8, r2
	b _0804141A
_0804140E:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5]
	movs r1, #0x38
	adds r1, r1, r7
	mov r8, r1
_0804141A:
	mov r2, r8
	adds r0, r2, r6
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08041454
	ldr r2, [sp, #0x5c]
	cmp r2, #0
	bne _08041438
	mov r0, sb
	str r0, [r7, #0x50]
	movs r1, #1
	str r1, [sp, #0x5c]
	b _08041454
_08041438:
	mov r2, sb
	str r2, [r7, #0x4c]
	b _08041454
_0804143E:
	adds r1, r7, #0
	adds r1, #0x2c
	adds r0, r1, r6
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r5]
	str r2, [r0]
	mov sl, r1
	movs r0, #0x38
	adds r0, r0, r7
	mov r8, r0
_08041454:
	subs r5, #4
	subs r6, #4
	subs r4, #1
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bge _0804136C
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08041476
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08041478
_08041476:
	str r1, [r7, #0x48]
_08041478:
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl SetBgOffset
	movs r0, #0xd0
	lsls r0, r0, #1
	bl PutChapterTitleBG
	movs r0, #0
	mov sb, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	str r1, [sp, #0x64]
	mov r2, sl
	str r2, [sp, #0x68]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #0x6c]
	ldr r6, [sp, #0x60]
	movs r1, #0
	str r1, [sp, #0x70]
	movs r2, #0x88
	lsls r2, r2, #7
	mov sl, r2
_080414AA:
	ldr r0, [sp, #0x70]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080414C0
	movs r0, #2
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
_080414C0:
	movs r0, #1
	ldrb r2, [r6]
	orrs r0, r2
	mov r4, sb
	adds r4, #4
	adds r1, r4, #0
	bl PutChapterTitlePalette
	ldrb r0, [r6]
	mov r5, sb
	adds r5, #7
	adds r1, r5, #0
	bl PutChapterTitlePalette
	ldr r0, _08041574 @ =0x02023464
	ldr r1, [sp, #0x6c]
	adds r0, r1, r0
	adds r1, r4, #0
	bl sub_08082460
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r2, [sp, #0x68]
	ldm r2!, {r1}
	str r2, [sp, #0x68]
	bl PutChapterTitleGfx
	ldr r0, _08041578 @ =0x02022C66
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r5, #0
	bl sub_08082440
	ldr r2, [sp, #0x64]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	str r2, [sp, #0x64]
	ldr r1, [sp, #0x6c]
	adds r1, r1, r0
	str r1, [sp, #0x6c]
	adds r6, #1
	ldr r2, [sp, #0x70]
	adds r2, #4
	str r2, [sp, #0x70]
	movs r0, #0x80
	lsls r0, r0, #4
	add sl, r0
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #2
	ble _080414AA
	ldr r2, _0804157C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r7, #0
	movs r1, #1
	bl sub_08047D80
	ldr r0, _08041580 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #0x50
	movs r1, #6
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041574: .4byte 0x02023464
_08041578: .4byte 0x02022C66
_0804157C: .4byte 0x03002870
_08041580: .4byte 0x0203D90C

	thumb_func_start sub_08041584
sub_08041584: @ 0x08041584
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _0804160C @ =0x08B857F8
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080415D2
	ldr r0, [r4]
	cmp r0, r6
	bgt _080415B4
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _080415D2
_080415B4:
	subs r2, r7, #1
	movs r3, #1
	rsbs r3, r3, #0
_080415BA:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _080415C6
	str r2, [r4]
_080415C6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _080415BA
_080415D2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08041606
	ldr r0, [r4]
	cmp r0, ip
	blt _080415EA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08041606
_080415EA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080415EA
_08041606:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804160C: .4byte 0x08B857F8

	thumb_func_start sub_08041610
sub_08041610: @ 0x08041610
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_08041584
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x18
	bl PutUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _0804164A
	movs r0, #3
	bl SioPlaySoundEffect
_0804164A:
	ldr r4, _08041688 @ =0x08B857F8
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041664
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r6, #0
	bl Proc_Break
_08041664:
	ldr r1, [r4]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804167E
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0804167E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041688: .4byte 0x08B857F8

	thumb_func_start sub_0804168C
sub_0804168C: @ 0x0804168C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, _080416CC @ =0x0202BBF8
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r1, _080416D0 @ =0x0203D90C
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl ApplyUnitSpritePalettes
	bl sub_08044ED8
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080416CC: .4byte 0x0202BBF8
_080416D0: .4byte 0x0203D90C

	thumb_func_start sub_080416D4
sub_080416D4: @ 0x080416D4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080416EC @ =0x0203D90C
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _080416E8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080416E8:
	pop {r0}
	bx r0
	.align 2, 0
_080416EC: .4byte 0x0203D90C

	thumb_func_start sub_080416F0
sub_080416F0: @ 0x080416F0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08041708 @ =0x0203D90C
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08041704
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08041704:
	pop {r0}
	bx r0
	.align 2, 0
_08041708: .4byte 0x0203D90C

	thumb_func_start sub_0804170C
sub_0804170C: @ 0x0804170C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041728 @ =0x08CC3BDC
	bl Proc_Find
	cmp r0, #0
	bne _08041720
	adds r0, r4, #0
	bl Proc_Break
_08041720:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041728: .4byte 0x08CC3BDC

	thumb_func_start sub_0804172C
sub_0804172C: @ 0x0804172C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041768 @ =0x0203DC20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041760
	bl sub_0803DC28
	bl BMapVSync_End
	bl sub_08047CA8
	bl sub_08047DA4
	bl sub_08047F1C
	bl EndLinkArenaButtonSpriteDraw
	bl StartPrepAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08041760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041768: .4byte 0x0203DC20

	thumb_func_start sub_0804176C
sub_0804176C: @ 0x0804176C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	pop {r0}
	bx r0

	thumb_func_start sub_0804177C
sub_0804177C: @ 0x0804177C
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r2, _080417B8 @ =0x00004060
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #2
	ble _08041798
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08041798:
	strh r2, [r3]
	adds r0, r2, #1
	strh r0, [r3, #2]
	adds r0, r2, #2
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080417B8: .4byte 0x00004060

	thumb_func_start sub_080417BC
sub_080417BC: @ 0x080417BC
	push {r4, lr}
	lsls r1, r1, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r2, r1, r3
	strh r2, [r0]
	ldr r4, _080417F0 @ =0x00006001
	adds r2, r1, r4
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	adds r0, #0x42
	ldr r2, _080417F4 @ =0x00006003
	adds r1, r1, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080417F0: .4byte 0x00006001
_080417F4: .4byte 0x00006003

	thumb_func_start sub_080417F8
sub_080417F8: @ 0x080417F8
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	movs r1, #8
	movs r2, #0
	mov r3, sb
	bl Text_InsertDrawString
	mov r0, r8
	movs r1, #0x60
	movs r2, #2
	adds r3, r6, #0
	bl SioDrawNumber
	ldr r3, _08041874 @ =0x081D53C8
	mov r0, r8
	movs r1, #0x68
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041878 @ =0x081D539C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x88
	movs r2, #2
	bl Text_InsertDrawString
	ldr r0, _0804187C @ =0x081D53B0
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl GetMsg
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0xa2
	movs r2, #0
	bl Text_InsertDrawString
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041874: .4byte 0x081D53C8
_08041878: .4byte 0x081D539C
_0804187C: .4byte 0x081D53B0

	thumb_func_start sub_08041880
sub_08041880: @ 0x08041880
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08041914 @ =0x0203DB6C
	ldr r1, _08041918 @ =0x02023464
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x24
	add r1, sl
	mov sb, r1
	mov r8, r0
_0804189E:
	lsls r5, r6, #3
	ldr r0, _0804191C @ =0x0203DA10
	adds r5, r5, r0
	adds r0, r5, #0
	bl ClearText
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl sub_080417F8
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl sub_0804177C
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r0, [r7]
	lsls r1, r0, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, sb
	bl sub_080417BC
	adds r7, #0x10
	movs r1, #0x80
	add sb, r1
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	cmp r6, #9
	ble _0804189E
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041914: .4byte 0x0203DB6C
_08041918: .4byte 0x02023464
_0804191C: .4byte 0x0203DA10

	thumb_func_start sub_08041920
sub_08041920: @ 0x08041920
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08041AF4 @ =0x081D53CB
	add r0, sp, #8
	movs r2, #8
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08041AF8 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041AFC @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041B00 @ =0x081C7FC4
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08041B04 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041B08 @ =0x081C5BE0
	ldr r1, _08041B0C @ =0x06014800
	bl Decompress
	ldr r0, _08041B10 @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #2
	bl sub_08047BD4
	ldr r0, _08041B14 @ =0x02023D62
	ldr r1, _08041B18 @ =0x081C87A0
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r0, _08041B1C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _08041B20 @ =0x0203DA10
	movs r4, #9
_080419B8:
	adds r0, r5, #0
	movs r1, #0x16
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080419B8
	ldr r4, _08041B24 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08041B28 @ =0x0000077F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xf0
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041B2C @ =0x00000781
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041B30 @ =0x00000782
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08041B34 @ =0x02022DAA
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041B38 @ =0x000003C2
	movs r1, #1
	bl PutSioText
	ldr r0, _08041B3C @ =0x0203DB68
	bl sub_080A1F2C
	bl sub_08041880
	ldr r1, _08041B40 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	movs r1, #1
	ldrb r0, [r5]
	orrs r0, r1
	movs r2, #2
	orrs r0, r2
	movs r6, #4
	orrs r0, r6
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r5]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r1, r0
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r6
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd8
	movs r1, #0x38
	movs r2, #0xa
	movs r3, #5
	bl StartLinkArenaMenuScrollBar
	adds r0, r7, #0
	movs r1, #5
	bl sub_08047D80
	ldr r0, _08041B44 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #8
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041AF4: .4byte 0x081D53CB
_08041AF8: .4byte 0x081C6A18
_08041AFC: .4byte 0x06000C00
_08041B00: .4byte 0x081C7FC4
_08041B04: .4byte 0x081C7F84
_08041B08: .4byte 0x081C5BE0
_08041B0C: .4byte 0x06014800
_08041B10: .4byte 0x081C7F04
_08041B14: .4byte 0x02023D62
_08041B18: .4byte 0x081C87A0
_08041B1C: .4byte 0x0203DA60
_08041B20: .4byte 0x0203DA10
_08041B24: .4byte 0x0203DC08
_08041B28: .4byte 0x0000077F
_08041B2C: .4byte 0x00000781
_08041B30: .4byte 0x00000782
_08041B34: .4byte 0x02022DAA
_08041B38: .4byte 0x000003C2
_08041B3C: .4byte 0x0203DB68
_08041B40: .4byte 0x03002870
_08041B44: .4byte 0x0203D90C

	thumb_func_start sub_08041B48
sub_08041B48: @ 0x08041B48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _08041B64
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b _08041B72
_08041B64:
	cmp r0, #0
	bge _08041B8E
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
_08041B72:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_08048C50
	b _08041C3A
_08041B8E:
	ldr r0, _08041C40 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08041BD4
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq _08041BD4
	movs r0, #3
	bl SioPlaySoundEffect
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_08048C50
_08041BD4:
	ldr r0, _08041C40 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _08041C20
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt _08041C20
	movs r0, #3
	bl SioPlaySoundEffect
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_08048C50
_08041C20:
	ldr r0, _08041C40 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041C3A
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	bl Proc_Break
_08041C3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041C40: .4byte 0x08B857F8

	thumb_func_start sub_08041C44
sub_08041C44: @ 0x08041C44
	cmp r0, #6
	ble _08041C4C
	movs r0, #5
	b _08041C58
_08041C4C:
	subs r0, #2
	cmp r0, #0
	bge _08041C54
	movs r0, #0
_08041C54:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08041C58:
	bx lr
	.align 2, 0

	thumb_func_start sub_08041C5C
sub_08041C5C: @ 0x08041C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, _08041E80 @ =0x081D53D3
	add r0, sp, #8
	movs r2, #7
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08041E84 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _08041E88 @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08041E8C @ =0x081C7FC4
	movs r1, #0x80
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r0, _08041E90 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08041E94 @ =0x081C5BE0
	ldr r1, _08041E98 @ =0x06014800
	bl Decompress
	ldr r0, _08041E9C @ =0x081C7B4C
	ldr r1, _08041EA0 @ =0x06016000
	bl Decompress
	ldr r0, _08041EA4 @ =0x081C80E4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #0
	bl sub_08047BD4
	ldr r0, _08041EA8 @ =0x02023D62
	ldr r1, _08041EAC @ =0x081C87A0
	movs r2, #0x80
	lsls r2, r2, #5
	bl TmApplyTsa_t
	ldr r0, _08041EB0 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl sub_08041C44
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r4, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldr r5, _08041EB4 @ =0x0203DA10
	movs r4, #9
_08041D1A:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08041D1A
	ldr r4, _08041EB8 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08041EBC @ =0x0000077F
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #0xf0
	lsls r0, r0, #3
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041EC0 @ =0x00000781
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertDrawString
	ldr r0, _08041EC4 @ =0x00000782
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08041EC8 @ =0x02022DAA
	adds r0, r4, #0
	bl PutText
	ldr r0, _08041ECC @ =0x0203DB68
	bl sub_080A1F2C
	bl sub_08041880
	ldr r1, _08041ED0 @ =0x03002870
	mov ip, r1
	movs r0, #0x20
	ldrb r2, [r1, #1]
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	mov r8, r2
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	movs r2, #0x38
	mov sl, r2
	mov r1, sl
	strb r1, [r0]
	subs r0, #5
	movs r6, #0xf0
	strb r6, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x88
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x34
	movs r2, #1
	ldrb r0, [r3]
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #4
	mov r1, sl
	strb r1, [r0]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	ands r0, r3
	orrs r0, r5
	orrs r0, r4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x36
	ldrb r1, [r0]
	orrs r2, r1
	ands r2, r3
	orrs r2, r5
	orrs r2, r4
	mov r1, sb
	orrs r2, r1
	strb r2, [r0]
	ldr r0, _08041ED4 @ =0x0203D90C
	ldrb r0, [r0]
	str r0, [sp]
	str r7, [sp, #4]
	add r0, sp, #8
	movs r1, #7
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl sub_080491F0
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041E80: .4byte 0x081D53D3
_08041E84: .4byte 0x081C6A18
_08041E88: .4byte 0x06000C00
_08041E8C: .4byte 0x081C7FC4
_08041E90: .4byte 0x081C7F84
_08041E94: .4byte 0x081C5BE0
_08041E98: .4byte 0x06014800
_08041E9C: .4byte 0x081C7B4C
_08041EA0: .4byte 0x06016000
_08041EA4: .4byte 0x081C80E4
_08041EA8: .4byte 0x02023D62
_08041EAC: .4byte 0x081C87A0
_08041EB0: .4byte 0x0203DA60
_08041EB4: .4byte 0x0203DA10
_08041EB8: .4byte 0x0203DC08
_08041EBC: .4byte 0x0000077F
_08041EC0: .4byte 0x00000781
_08041EC4: .4byte 0x00000782
_08041EC8: .4byte 0x02022DAA
_08041ECC: .4byte 0x0203DB68
_08041ED0: .4byte 0x03002870
_08041ED4: .4byte 0x0203D90C

	thumb_func_start sub_08041ED8
sub_08041ED8: @ 0x08041ED8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble _08041F8A
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r1, [r7]
	cmp r1, #5
	bne _08041EFE
	adds r0, r4, #0
	bl Proc_Break
_08041EFE:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _08041F38
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_08048C50
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b _08041F8A
_08041F38:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq _08041F74
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_08048C50
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
_08041F74:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08041F8A
	ldrb r6, [r6]
	ldrb r7, [r7]
	cmp r6, r7
	bne _08041F8A
	adds r0, r4, #0
	bl Proc_Break
_08041F8A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08041F94
sub_08041F94: @ 0x08041F94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041FB8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041FB2
	movs r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_08041FB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041FB8: .4byte 0x08B857F8

	thumb_func_start StartSioResultNewHighScore
StartSioResultNewHighScore: @ 0x08041FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041FD0 @ =0x08B99560
	bl SpawnProcLocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041FD0: .4byte 0x08B99560

	thumb_func_start sub_08041FD4
sub_08041FD4: @ 0x08041FD4
	ldr r1, _08041FF4 @ =0x0203D90C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
_08041FF4: .4byte 0x0203D90C

	thumb_func_start sub_08041FF8
sub_08041FF8: @ 0x08041FF8
	push {r4, r5, lr}
	ldr r5, _08042038 @ =0x0203D90C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r5, r5, r1
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r5]
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	rsbs r3, r3, #0
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r4, r0
	lsls r4, r4, #2
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r4
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042038: .4byte 0x0203D90C

	thumb_func_start sub_0804203C
sub_0804203C: @ 0x0804203C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, _080420E0 @ =0x081D53DC
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #0
	lsls r1, r0, #1
	ldr r2, _080420E4 @ =0x081D5358
	mov r8, r2
	adds r1, r1, r0
	adds r1, #6
	lsls r1, r1, #5
	mov sl, r1
	adds r2, #4
	lsls r6, r0, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	mov sb, r2
	adds r5, r1, #0
_08042074:
	ldr r4, _080420E8 @ =0x0203D970
	adds r4, r6, r4
	adds r0, r4, #0
	bl ClearText
	ldr r1, [sp, #8]
	adds r0, r1, r7
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_SetColor
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	mov r2, sb
	adds r2, #4
	mov sb, r2
	subs r2, #4
	ldm r2!, {r1}
	add r1, sl
	lsls r1, r1, #1
	ldr r0, _080420EC @ =0x02022C60
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r6, #8
	adds r5, #4
	adds r7, #1
	cmp r7, #1
	ble _08042074
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080420E0: .4byte 0x081D53DC
_080420E4: .4byte 0x081D5358
_080420E8: .4byte 0x0203D970
_080420EC: .4byte 0x02022C60

	thumb_func_start sub_080420F0
sub_080420F0: @ 0x080420F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r0
	add r6, sp, #0xc
	ldr r1, _08042264 @ =0x081D53E4
	adds r0, r6, #0
	movs r2, #0xe
	bl memcpy
	bl ClearSioBG
	bl sub_08047B34
	ldr r4, _08042268 @ =0x081C6A18
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0804226C @ =0x06000C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08042270 @ =0x081C7F84
	movs r1, #0xc0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08042274 @ =0x081C5BE0
	ldr r1, _08042278 @ =0x06014800
	bl Decompress
	ldr r0, _0804227C @ =0x081C7F04
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl sub_08047C38
	ldr r0, _08042280 @ =0x0203DA60
	bl SetTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	movs r0, #0
	mov r1, r8
	str r0, [r1, #0x30]
	mov r0, r8
	bl StartRuleSettingSpriteDrawInteractive
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl SetBgOffset
	add r0, sp, #8
	bl sub_08041FD4
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, _08042284 @ =0x081D5358
	mov r3, sp
	adds r3, r3, r4
	adds r3, #8
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r3, r2
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	movs r7, #0
	mov sl, r6
	movs r6, #0xc0
	lsls r6, r6, #1
_080421B8:
	lsls r4, r7, #3
	ldr r0, _08042288 @ =0x0203D918
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColor
	ldr r0, [r5]
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _0804228C @ =0x02022C6C
	adds r1, r6, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r7
	adds r0, #8
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_0804203C
	adds r6, #0xc0
	adds r5, #0x14
	adds r7, #1
	cmp r7, #2
	ble _080421B8
	ldr r5, _08042284 @ =0x081D5358
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08042290 @ =0x0202369C
	adds r0, r0, r4
	movs r1, #0
	bl sub_080417BC
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_080417BC
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	bl sub_08047D80
	mov r0, sb
	subs r0, #0xc
	ldrb r0, [r0]
	str r0, [sp]
	mov r2, r8
	ldr r0, [r2, #0x2c]
	str r0, [sp, #4]
	mov r0, sl
	movs r1, #0xe
	movs r2, #0
	movs r3, #8
	bl sub_08047E84
	mov r3, r8
	ldr r0, [r3, #0x30]
	ldr r4, _08042294 @ =0x000003C3
	adds r0, r0, r4
	movs r1, #1
	bl PutSioText
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042264: .4byte 0x081D53E4
_08042268: .4byte 0x081C6A18
_0804226C: .4byte 0x06000C00
_08042270: .4byte 0x081C7F84
_08042274: .4byte 0x081C5BE0
_08042278: .4byte 0x06014800
_0804227C: .4byte 0x081C7F04
_08042280: .4byte 0x0203DA60
_08042284: .4byte 0x081D5358
_08042288: .4byte 0x0203D918
_0804228C: .4byte 0x02022C6C
_08042290: .4byte 0x0202369C
_08042294: .4byte 0x000003C3

	thumb_func_start sub_08042298
sub_08042298: @ 0x08042298
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, _080423B4 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080422C2
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, _080423B8 @ =0x0203DA0C
	bl sub_080A1F54
	adds r0, r6, #0
	bl Proc_Break
_080422C2:
	mov r0, sp
	bl sub_08041FD4
	ldr r1, [r5]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080422E0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq _080422E0
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
_080422E0:
	ldr r2, _080423B4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08042300
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt _08042300
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042300:
	ldr r1, [r5]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042328
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_0804203C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042328:
	ldr r1, [r5]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042350
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_0804203C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08042350:
	mov r0, sp
	bl sub_08041FF8
	cmp r4, #0
	beq _080423AA
	movs r0, #3
	bl SioPlaySoundEffect
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne _0804236A
	movs r7, #2
	rsbs r7, r7, #0
_0804236A:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, _080423BC @ =0x081D5358
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r4, r2
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	ldr r0, [r6, #0x30]
	ldr r1, _080423C0 @ =0x000003C3
	adds r0, r0, r1
	movs r1, #1
	bl PutSioText
_080423AA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080423B4: .4byte 0x08B857F8
_080423B8: .4byte 0x0203DA0C
_080423BC: .4byte 0x081D5358
_080423C0: .4byte 0x000003C3

	thumb_func_start SioMenu_GetItemHelpText
SioMenu_GetItemHelpText: @ 0x080423C4
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, _080423F8 @ =0x081D53F4
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne _08042400
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042414
	ldr r0, _080423FC @ =0x000003B3
	b _08042420
	.align 2, 0
_080423F8: .4byte 0x081D53F4
_080423FC: .4byte 0x000003B3
_08042400:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042414
	movs r0, #1
	rsbs r0, r0, #0
	b _08042420
_08042414:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
_08042420:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start CheckSomethingSaveRelated
CheckSomethingSaveRelated: @ 0x08042428
	push {r4, lr}
	sub sp, #0x48
	movs r4, #0
_0804242E:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042452
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl sub_080A0A10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042452
	movs r0, #1
	b _0804245A
_08042452:
	adds r4, #1
	cmp r4, #2
	ble _0804242E
	movs r0, #0
_0804245A:
	add sp, #0x48
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SioMenu_Init
SioMenu_Init: @ 0x08042464
	push {lr}
	bl CheckSomethingSaveRelated
	ldr r1, _08042490 @ =0x0203D90C
	strb r0, [r1, #0xa]
	ldr r1, _08042494 @ =0x0203DC28
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_08042476:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08042476
	movs r1, #0
	ldr r3, _08042498 @ =0x030013F0
	ldr r2, _0804249C @ =0x030013F4
	ldr r0, _080424A0 @ =0x0203DC48
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08042490: .4byte 0x0203D90C
_08042494: .4byte 0x0203DC28
_08042498: .4byte 0x030013F0
_0804249C: .4byte 0x030013F4
_080424A0: .4byte 0x0203DC48

	thumb_func_start sub_080424A4
sub_080424A4: @ 0x080424A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _08042538 @ =0x081D5426
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _0804253C @ =0x0203DA0C
	adds r0, r4, #0
	bl sub_080A1F90
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_08047B34
	ldr r0, _08042540 @ =0x081C50C4
	ldr r1, _08042544 @ =0x06014800
	bl Decompress
	ldr r0, _08042548 @ =0x081C7EA4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _0804254C @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08042550
	movs r1, #0
	movs r0, #3
	b _08042554
	.align 2, 0
_08042538: .4byte 0x081D5426
_0804253C: .4byte 0x0203DA0C
_08042540: .4byte 0x081C50C4
_08042544: .4byte 0x06014800
_08042548: .4byte 0x081C7EA4
_0804254C: .4byte 0x0203DA60
_08042550:
	movs r1, #1
	movs r0, #4
_08042554:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _080425DC @ =0x0203D90C
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08042574:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl StartSioMenuItem
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08042574
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl sub_08047D80
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	movs r3, #0xa8
	bl sub_08047E84
	ldr r0, _080425E0 @ =0x08B99600
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	str r4, [r6, #0x54]
	movs r0, #0x47
	movs r1, #0
	bl StartBgm
	bl sub_08044FFC
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080425DC: .4byte 0x0203D90C
_080425E0: .4byte 0x08B99600

	thumb_func_start sub_080425E4
sub_080425E4: @ 0x080425E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	rsbs r1, r1, #0
	ldr r5, _0804268C @ =0x081D541C
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	mov sb, r0
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08042622:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl SioMenuItem_SetPosition
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042622
	mov r1, sb
	adds r1, #8
	movs r0, #0
	bl sub_08047F6C
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08042678
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r7, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	ldr r0, _0804268C @ =0x081D541C
	ldrb r1, [r0, #1]
	adds r1, #8
	movs r0, #0
	bl sub_08047F6C
	adds r0, r7, #0
	bl Proc_Break
_08042678:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804268C: .4byte 0x081D541C

	thumb_func_start sub_08042690
sub_08042690: @ 0x08042690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, _08042724 @ =0x081D541C
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov sb, r0
_080426B8:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl Interpolate
	adds r4, r0, #0
	mov r0, sb
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl SioMenuItem_SetPosition
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge _080426B8
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble _0804270C
	adds r0, r5, #0
	bl Proc_Break
_0804270C:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042724: .4byte 0x081D541C

	thumb_func_start sub_08042728
sub_08042728: @ 0x08042728
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, _080427C4 @ =0x081D5426
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	ldr r4, _080427C8 @ =0x0203DA0C
	adds r0, r4, #0
	bl sub_080A1F90
	ldrb r4, [r4]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_08047B34
	ldr r0, _080427CC @ =0x081C50C4
	ldr r1, _080427D0 @ =0x06014800
	bl Decompress
	ldr r0, _080427D4 @ =0x081C7EA4
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl ApplyPaletteExt
	movs r0, #0
	movs r1, #4
	bl sub_08047BD4
	ldr r0, _080427D8 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_0803DCF0
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080427DC
	movs r1, #0
	movs r0, #3
	b _080427E0
	.align 2, 0
_080427C4: .4byte 0x081D5426
_080427C8: .4byte 0x0203DA0C
_080427CC: .4byte 0x081C50C4
_080427D0: .4byte 0x06014800
_080427D4: .4byte 0x081C7EA4
_080427D8: .4byte 0x0203DA60
_080427DC:
	movs r1, #1
	movs r0, #4
_080427E0:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _080428AC @ =0x0203D90C
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov sb, r2
	ldr r2, _080428B0 @ =0x081D541C
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08042810:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl StartSioMenuItem
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08042810
	ldr r0, [r6, #0x2c]
	movs r1, #0
	bl sub_08047D80
	ldr r1, _080428B0 @ =0x081D541C
	ldr r0, [r6, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	adds r3, #8
	movs r4, #0
	str r4, [sp]
	ldr r0, [r6, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #5
	movs r2, #0
	bl sub_08047E84
	ldr r0, _080428B4 @ =0x08B99620
	bl SetFaceConfig
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0xdf
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	adds r0, r6, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r6, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	bl sub_08044FFC
	movs r0, #0x47
	movs r1, #0
	bl StartBgm
	str r4, [r6, #0x54]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080428AC: .4byte 0x0203D90C
_080428B0: .4byte 0x081D541C
_080428B4: .4byte 0x08B99620

	thumb_func_start sub_080428B8
sub_080428B8: @ 0x080428B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne _08042938
	ldr r0, _080429B0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042902
	ldr r1, _080429B4 @ =0x0203D90C
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080428EA
	movs r0, #2
	strb r0, [r1, #5]
_080428EA:
	ldr r0, [r5, #0x30]
	movs r1, #6
	rsbs r1, r1, #0
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl SioMenuItem_SetArrowConfig
	movs r0, #3
	bl SioPlaySoundEffect
_08042902:
	ldr r0, _080429B0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042938
	ldr r4, _080429B4 @ =0x0203D90C
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl SioMenuItem_SetArrowConfig
	movs r0, #3
	bl SioPlaySoundEffect
_08042938:
	ldr r1, _080429B0 @ =0x08B857F8
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq _08042972
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt _08042956
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08042972
_08042956:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_0804295C:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _08042968
	str r2, [r5, #0x48]
_08042968:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804295C
_08042972:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080429A6
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt _0804298C
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _080429A6
_0804298C:
	adds r4, r5, #0
	adds r4, #0x40
_08042990:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042990
_080429A6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080429B0: .4byte 0x08B857F8
_080429B4: .4byte 0x0203D90C

	thumb_func_start sub_080429B8
sub_080429B8: @ 0x080429B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	movs r1, #5
	bl sub_080428B8
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq _08042A36
	movs r0, #3
	bl SioPlaySoundEffect
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl sub_080489C0
	adds r0, r4, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r4, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	ldr r1, _08042A84 @ =0x081D541C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0
	bl sub_08047F50
	ldr r0, [r4, #0x48]
	bl sub_08047F8C
_08042A36:
	ldr r5, _08042A88 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042A5A
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _08042A8C @ =0x0203D90C
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08042A5A:
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042A7E
	movs r0, #1
	bl SioPlaySoundEffect
	movs r0, #2
	bl FadeBgmOut
	ldr r1, _08042A8C @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08042A7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042A84: .4byte 0x081D541C
_08042A88: .4byte 0x08B857F8
_08042A8C: .4byte 0x0203D90C

	thumb_func_start SioMenu_80480B4
SioMenu_80480B4: @ 0x08042A90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08042B3C @ =0x0203D90C
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08042AAC
	adds r0, r5, #0
	bl Proc_Break
_08042AAC:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _08042B1A
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _08042B40 @ =0x081D541C
	movs r4, #0x10
	mov sb, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_08042AD2:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, sb
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl SioMenuItem_SetPosition
	subs r6, #4
	subs r7, #2
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _08042AD2
_08042B1A:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _08042B26
	adds r0, r5, #0
	bl Proc_Break
_08042B26:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08042B3C: .4byte 0x0203D90C
_08042B40: .4byte 0x081D541C

	thumb_func_start sub_08042B44
sub_08042B44: @ 0x08042B44
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _08042B94 @ =0x081D542C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_08042B62:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _08042B62
	ldr r1, _08042B98 @ =0x0203D90C
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08042BA0
	bl BMapVSync_End
	bl sub_08047CA8
	bl UnsetBmStLinkArenaFlag
	ldr r0, _08042B9C @ =0x08B9333C
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b _08042BB0
	.align 2, 0
_08042B94: .4byte 0x081D542C
_08042B98: .4byte 0x0203D90C
_08042B9C: .4byte 0x08B9333C
_08042BA0:
	strb r2, [r1, #1]
	ldrb r1, [r1]
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl SpawnProcLocking
_08042BB0:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08042BB8
sub_08042BB8: @ 0x08042BB8
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	ldr r0, _08042C20 @ =0x0203DA60
	ldr r1, _08042C24 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08042BDC
	bl sub_080A1AC8
_08042BDC:
	ldr r1, _08042C28 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetBmStLinkArenaFlag
	bl sub_08044ED8
	bl StartBmVSync
	ldr r1, _08042C2C @ =0x0202BBF8
	movs r0, #0xdf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	movs r0, #0xd
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08042C30 @ =0x08B99640
	adds r1, r4, #0
	bl SpawnProcLocking
	ldr r0, _08042C34 @ =0x08B9333C
	movs r1, #3
	bl SpawnProc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042C20: .4byte 0x0203DA60
_08042C24: .4byte 0x06001800
_08042C28: .4byte 0x0203D90C
_08042C2C: .4byte 0x0202BBF8
_08042C30: .4byte 0x08B99640
_08042C34: .4byte 0x08B9333C

	thumb_func_start StartNameSelect
StartNameSelect: @ 0x08042C38
	push {lr}
	adds r1, r0, #0
	ldr r0, _08042C54 @ =0x08B98E14
	bl SpawnProcLocking
	adds r3, r0, #0
	adds r3, #0x33
	movs r2, #0
	movs r1, #7
	strb r1, [r3]
	adds r0, #0x32
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08042C54: .4byte 0x08B98E14

	thumb_func_start sub_08042C58
sub_08042C58: @ 0x08042C58
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	bl UnsetBmStLinkArenaFlag
	ldr r0, _08042CA4 @ =0x0203DA60
	ldr r1, _08042CA8 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r1, _08042CAC @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	ldr r1, _08042CB0 @ =0x0202BBF8
	adds r1, #0x41
	subs r0, #0xd
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08042CB4 @ =0x08B98E14
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #7
	strb r1, [r2]
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042CA4: .4byte 0x0203DA60
_08042CA8: .4byte 0x06001800
_08042CAC: .4byte 0x0203D90C
_08042CB0: .4byte 0x0202BBF8
_08042CB4: .4byte 0x08B98E14

	thumb_func_start sub_08042CB8
sub_08042CB8: @ 0x08042CB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r0, _08042CDC @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	beq _08042CE4
	ldr r0, _08042CE0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042D88
	adds r0, r6, #0
	movs r1, #4
	b _08042D2E
	.align 2, 0
_08042CDC: .4byte 0x08B98B38
_08042CE0: .4byte 0x08B857F8
_08042CE4:
	ldr r0, _08042D38 @ =0x08B98AEC
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #1
	bgt _08042D2A
	adds r1, r0, #0
	adds r0, r2, #0
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	beq _08042D2A
	movs r1, #0
	adds r2, #0x1a
_08042D02:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08042D0C
	adds r5, #1
_08042D0C:
	adds r1, #1
	cmp r1, #3
	ble _08042D02
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042D2A
	ldr r4, _08042D38 @ =0x08B98AEC
	ldr r2, [r4]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08042D2A
	cmp r5, #0
	beq _08042D3C
_08042D2A:
	adds r0, r6, #0
	movs r1, #0
_08042D2E:
	bl EventGotoLabel
_08042D32:
	movs r0, #0
	b _08042D8A
	.align 2, 0
_08042D38: .4byte 0x08B98AEC
_08042D3C:
	ldr r0, _08042D84 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_0803CE34
	ldr r1, [r4]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _08042D88
	strb r0, [r1, #9]
	bl sub_0803D674
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08042D32
	adds r0, r6, #0
	movs r1, #1
	bl EventGotoLabel
	b _08042D32
	.align 2, 0
_08042D84: .4byte 0x030046C0
_08042D88:
	movs r0, #1
_08042D8A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start XMapTransfer_80483F8
XMapTransfer_80483F8: @ 0x08042D90
	push {lr}
	adds r1, r0, #0
	ldr r0, _08042DAC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls _08042DA6
	adds r0, r1, #0
	movs r1, #0
	bl EventGotoLabel
_08042DA6:
	pop {r0}
	bx r0
	.align 2, 0
_08042DAC: .4byte 0x08B98AEC

	thumb_func_start XMapTransfer_8048418
XMapTransfer_8048418: @ 0x08042DB0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _08042DC8
	ldr r1, _08042DC4 @ =0x0203DC98
	movs r0, #0
	b _08042DCC
	.align 2, 0
_08042DC4: .4byte 0x0203DC98
_08042DC8:
	ldr r1, _08042DF4 @ =0x0203DC98
	movs r0, #1
_08042DCC:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl SioEmitData
	ldr r0, [r4]
	cmp r0, #0
	beq _08042DEA
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
_08042DEA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042DF4: .4byte 0x0203DC98

	thumb_func_start XMapTransfer_8048460
XMapTransfer_8048460: @ 0x08042DF8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, _08042E40 @ =0x08B98AEC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08042E0A:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08042E14
	adds r4, #1
_08042E14:
	adds r1, #1
	cmp r1, #3
	ble _08042E0A
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08042E32
	ldr r0, _08042E40 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi _08042E32
	cmp r4, #0
	beq _08042E44
_08042E32:
	adds r0, r5, #0
	movs r1, #0
	bl EventGotoLabel
_08042E3A:
	movs r0, #0
	b _08042E68
	.align 2, 0
_08042E40: .4byte 0x08B98AEC
_08042E44:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042E66
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _08042E3A
	adds r0, r5, #0
	movs r1, #5
	bl EventGotoLabel
	b _08042E3A
_08042E66:
	movs r0, #1
_08042E68:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start PutXMapProgressPercent
PutXMapProgressPercent: @ 0x08042E70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl SioDrawNumber
	ldr r3, _08042EB0 @ =0x081D5440
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _08042EB4 @ =0x02022F7E
	adds r0, r4, #0
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042EB0: .4byte 0x081D5440
_08042EB4: .4byte 0x02022F7E

	thumb_func_start DrawXMapSendProgress
DrawXMapSendProgress: @ 0x08042EB8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08042F10
	ldr r0, _08042F18 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08042EDC
	movs r0, #0x7d
	bl m4aSongNumStart
_08042EDC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08042F1C @ =0x0203D970
	ldr r1, _08042F20 @ =0x081D5444
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08042F24 @ =0x0202303C
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
_08042F10:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042F18: .4byte 0x0202BBF8
_08042F1C: .4byte 0x0203D970
_08042F20: .4byte 0x081D5444
_08042F24: .4byte 0x0202303C

	thumb_func_start DrawXMapReceiveProgress
DrawXMapReceiveProgress: @ 0x08042F28
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08042F80
	ldr r0, _08042F88 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08042F4C
	movs r0, #0x7d
	bl m4aSongNumStart
_08042F4C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08042F8C @ =0x0203D970
	ldr r1, _08042F90 @ =0x081D544C
	ldrb r2, [r5]
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08042F94 @ =0x0202303C
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	ldrb r4, [r5]
	str r4, [sp, #4]
	ldrb r5, [r5]
	subs r1, r1, r5
	str r1, [sp, #8]
	movs r1, #0xe
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
_08042F80:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042F88: .4byte 0x0202BBF8
_08042F8C: .4byte 0x0203D970
_08042F90: .4byte 0x081D544C
_08042F94: .4byte 0x0202303C

	thumb_func_start StartXMapTransfer
StartXMapTransfer: @ 0x08042F98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08042FDC @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	ldr r0, _08042FE0 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08042FF4
	ldr r1, _08042FE4 @ =0x03005E70
	ldr r0, _08042FE8 @ =0x0E007400
	ldr r4, _08042FEC @ =0x02000000
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, _08042FF0 @ =DrawXMapSendProgress
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartSioBigSend
	b _08042FFE
	.align 2, 0
_08042FDC: .4byte 0x0203DA60
_08042FE0: .4byte 0x08B98AEC
_08042FE4: .4byte 0x03005E70
_08042FE8: .4byte 0x0E007400
_08042FEC: .4byte 0x02000000
_08042FF0: .4byte DrawXMapSendProgress
_08042FF4:
	ldr r0, _08043008 @ =0x02000000
	ldr r1, _0804300C @ =DrawXMapReceiveProgress
	adds r2, r6, #0
	bl StartSioBigReceive
_08042FFE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043008: .4byte 0x02000000
_0804300C: .4byte DrawXMapReceiveProgress

	thumb_func_start XMapTransfer_AwaitCompletion
XMapTransfer_AwaitCompletion: @ 0x08043010
	push {lr}
	bl IsSioBigTransferActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043020
	movs r0, #1
	b _08043052
_08043020:
	ldr r0, _08043058 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043032
	movs r0, #0x7e
	bl m4aSongNumStart
_08043032:
	bl InitTalkTextFont
	ldr r0, _0804305C @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043050
	ldr r0, _08043060 @ =0x02000000
	ldr r1, _08043064 @ =0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
_08043050:
	movs r0, #0
_08043052:
	pop {r1}
	bx r1
	.align 2, 0
_08043058: .4byte 0x0202BBF8
_0804305C: .4byte 0x08B98AEC
_08043060: .4byte 0x02000000
_08043064: .4byte 0x0E007400

	thumb_func_start sub_08043068
sub_08043068: @ 0x08043068
	ldr r0, _08043078 @ =0x08B98AEC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_08043078: .4byte 0x08B98AEC

	thumb_func_start sub_0804307C
sub_0804307C: @ 0x0804307C
	push {r4, lr}
	ldr r0, _080430A8 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _080430AC @ =0x08B98AEC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	beq _080430B0
	movs r0, #1
	b _080430BC
	.align 2, 0
_080430A8: .4byte 0x0300479C
_080430AC: .4byte 0x08B98AEC
_080430B0:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
_080430BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start XMapTransfer_8048730
XMapTransfer_8048730: @ 0x080430C4
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r5, #0
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	ldr r0, _08043120 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	ldr r4, _08043124 @ =0x0203D970
	ldr r0, _08043128 @ =0x00000771
	bl GetMsg
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl PutXMapProgressPercent
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _0804312C @ =0x0202303C
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl PutDrawUiGauge
	movs r0, #1
	bl EnableBgSync
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043120: .4byte 0x0203DA60
_08043124: .4byte 0x0203D970
_08043128: .4byte 0x00000771
_0804312C: .4byte 0x0202303C

	thumb_func_start sub_08043130
sub_08043130: @ 0x08043130
	ldr r2, _08043150 @ =0x03002870
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08043150: .4byte 0x03002870

	thumb_func_start Shop_HandleBuyConfirmPrompt
Shop_HandleBuyConfirmPrompt: @ 0x08043154
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	beq _08043168
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
_08043168:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08043170
sub_08043170: @ 0x08043170
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkResult
	cmp r0, #1
	bne _08043192
	bl InitGlobalSaveInfo
	bl ResetFe6LinkSaveInfo
	bl EraseSaveRankData
	bl sub_0809F668
	bl EraseLinkArenaStruct2
	b _0804319A
_08043192:
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
_0804319A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080431A0
sub_080431A0: @ 0x080431A0
	push {lr}
	movs r0, #0xff
	bl SoftReset
	pop {r0}
	bx r0

	thumb_func_start sub_080431AC
sub_080431AC: @ 0x080431AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080431BC @ =0x08B9981C
	bl sub_0800AF68
	pop {r0}
	bx r0
	.align 2, 0
_080431BC: .4byte 0x08B9981C

	thumb_func_start sub_080431C0
sub_080431C0: @ 0x080431C0
	push {lr}
	sub sp, #4
	ldr r3, _080431DC @ =0x08B99868
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080431DC: .4byte 0x08B99868

	thumb_func_start Sio_DrawFe6CommImage
Sio_DrawFe6CommImage: @ 0x080431E0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r1, _0804337C @ =0x081D5454
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _08043380 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl sub_08047CA8
	ldr r4, _08043384 @ =0x081D245C
	movs r0, #1
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r2, _08043388 @ =0x06000C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0804338C @ =0x081D26E0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08043390 @ =0x081D2700
	ldr r1, _08043394 @ =0x06014000
	bl Decompress
	ldr r0, _08043398 @ =0x081D2B1C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r4, _0804339C @ =0x02023460
	ldr r1, _080433A0 @ =0x081D258C
	ldr r5, _080433A4 @ =0x00004060
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_t
	movs r0, #0x88
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080433A8 @ =0x081D2628
	adds r0, r4, #0
	adds r2, r5, #0
	bl TmApplyTsa_t
	ldr r4, _080433AC @ =0x081CE25C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080433B0 @ =0x081D1DF8
	ldr r4, _080433B4 @ =0x02024460
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080433B8 @ =0x081D235C
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl ApplyPaletteExt
	movs r0, #0xe0
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xa0
	lsls r5, r5, #2
_080432AC:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080432AC
	ldr r0, _080433BC @ =0x08B99870
	adds r1, r6, #0
	bl SpawnProc
	ldr r0, _080433C0 @ =0x0203DA60
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	ldr r4, _080433C4 @ =0x0203DC08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl ClearText
	ldr r0, _080433C8 @ =0x0000118D
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	ldr r1, _080433CC @ =0x020230EE
	adds r0, r4, #0
	bl PutText
	movs r0, #0xb
	bl EnableBgSync
	movs r0, #0
	movs r1, #0
	movs r2, #4
	bl SetBgOffset
	ldr r3, _08043380 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	ldr r0, _080433D0 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #2
	orrs r0, r1
	ldr r1, _080433D4 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl SoundVSyncOff_rev01
	ldr r0, _080433D8 @ =0x030046B0
	ldr r1, _080433DC @ =0x08CF0CD0
	str r1, [r0]
	ldr r2, _080433E0 @ =0x0300474C
	ldr r0, _080433E4 @ =0x08CF634C
	subs r0, r0, r1
	str r0, [r2]
	ldr r0, _080433E8 @ =0x03004750
	str r1, [r0, #0x28]
	adds r1, r0, #0
	adds r1, #0x4b
	strb r5, [r1]
	bl MultiBootInit
	ldr r0, _080433EC @ =0x08B98AEC
	ldr r1, [r0]
	movs r0, #4
	strb r0, [r1, #0xb]
	adds r0, r6, #0
	adds r0, #0x64
	strh r5, [r0]
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804337C: .4byte 0x081D5454
_08043380: .4byte 0x03002870
_08043384: .4byte 0x081D245C
_08043388: .4byte 0x06000C00
_0804338C: .4byte 0x081D26E0
_08043390: .4byte 0x081D2700
_08043394: .4byte 0x06014000
_08043398: .4byte 0x081D2B1C
_0804339C: .4byte 0x02023460
_080433A0: .4byte 0x081D258C
_080433A4: .4byte 0x00004060
_080433A8: .4byte 0x081D2628
_080433AC: .4byte 0x081CE25C
_080433B0: .4byte 0x081D1DF8
_080433B4: .4byte 0x02024460
_080433B8: .4byte 0x081D235C
_080433BC: .4byte 0x08B99870
_080433C0: .4byte 0x0203DA60
_080433C4: .4byte 0x0203DC08
_080433C8: .4byte 0x0000118D
_080433CC: .4byte 0x020230EE
_080433D0: .4byte 0x0000FFE0
_080433D4: .4byte 0x0000E0FF
_080433D8: .4byte 0x030046B0
_080433DC: .4byte 0x08CF0CD0
_080433E0: .4byte 0x0300474C
_080433E4: .4byte 0x08CF634C
_080433E8: .4byte 0x03004750
_080433EC: .4byte 0x08B98AEC

	thumb_func_start FE6Link_Loop
FE6Link_Loop: @ 0x080433F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #1
	ldr r5, _08043410 @ =0x03004750
	movs r4, #1
	ldr r3, _08043414 @ =0x08B98AEC
_080433FE:
	ldrb r1, [r5, #0x1d]
	asrs r1, r2
	ands r1, r4
	cmp r1, #0
	bne _08043418
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	b _08043434
	.align 2, 0
_08043410: .4byte 0x03004750
_08043414: .4byte 0x08B98AEC
_08043418:
	ldrb r0, [r5, #0x1e]
	asrs r0, r2
	ands r0, r4
	cmp r0, #0
	bne _0804342C
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	strb r4, [r0]
	b _08043436
_0804342C:
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	movs r1, #3
_08043434:
	strb r1, [r0]
_08043436:
	adds r2, #1
	cmp r2, #3
	ble _080433FE
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	bne _0804346C
	ldr r0, _08043468 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804346C
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080434D6
	.align 2, 0
_08043468: .4byte 0x08B857F8
_0804346C:
	adds r4, r6, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #1
	bne _08043490
	ldr r0, _080434E0 @ =0x03004750
	ldr r1, _080434E4 @ =0x030046B0
	ldr r1, [r1]
	adds r1, #0xc0
	ldr r2, _080434E8 @ =0x0300474C
	ldr r2, [r2]
	subs r2, #0xc0
	str r3, [sp]
	movs r3, #4
	bl sub_08049880
	movs r0, #2
	strh r0, [r4]
_08043490:
	ldr r4, _080434E0 @ =0x03004750
	adds r0, r4, #0
	bl sub_08049424
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080434C6
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080434C6
	ldrb r5, [r4, #0x1e]
	cmp r5, #2
	bne _080434C6
	ldr r0, _080434E4 @ =0x030046B0
	ldr r1, [r0]
	adds r1, #0xc0
	ldr r0, _080434E8 @ =0x0300474C
	ldr r2, [r0]
	subs r2, #0xc0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #4
	bl sub_08049880
	strh r5, [r6]
_080434C6:
	ldr r0, _080434E0 @ =0x03004750
	bl sub_08049944
	cmp r0, #0
	beq _080434D6
	adds r0, r7, #0
	bl Proc_Break
_080434D6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080434E0: .4byte 0x03004750
_080434E4: .4byte 0x030046B0
_080434E8: .4byte 0x0300474C

	thumb_func_start sub_080434EC
sub_080434EC: @ 0x080434EC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08043528 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0804352C @ =0x08B98B60
	movs r1, #0
	bl SpawnProc
	ldr r0, _08043530 @ =0x08B98B88
	adds r1, r4, #0
	bl SpawnProc
	ldr r0, _08043534 @ =0x08B98B38
	adds r1, r4, #0
	bl SpawnProc
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	bl SoundVSyncOn_rev01
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043528: .4byte 0x00002586
_0804352C: .4byte 0x08B98B60
_08043530: .4byte 0x08B98B88
_08043534: .4byte 0x08B98B38

	thumb_func_start sub_08043538
sub_08043538: @ 0x08043538
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08043584 @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	bne _080435C8
	movs r1, #0
	ldr r0, _08043588 @ =0x08B98AEC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08043552:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804355C
	adds r4, #1
_0804355C:
	adds r1, #1
	cmp r1, #3
	ble _08043552
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804357A
	ldr r5, _08043588 @ =0x08B98AEC
	ldr r2, [r5]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _0804357A
	cmp r4, #0
	beq _0804358C
_0804357A:
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080435C8
	.align 2, 0
_08043584: .4byte 0x08B98B38
_08043588: .4byte 0x08B98AEC
_0804358C:
	ldr r0, _080435D0 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_0803CE34
	ldr r1, [r5]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _080435C8
	strb r0, [r1, #9]
	bl sub_0803D674
	ldr r0, [r5]
	movs r1, #6
	strh r1, [r0, #4]
	movs r1, #0
	strb r1, [r0, #0x1e]
	movs r0, #3
	bl sub_0803D500
	adds r0, r6, #0
	bl Proc_Break
_080435C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080435D0: .4byte 0x030046C0

	thumb_func_start FE6Link_OnEnd
FE6Link_OnEnd: @ 0x080435D4
	push {lr}
	ldr r0, _080435F8 @ =0x08B98B60
	bl Proc_EndEach
	ldr r0, _080435FC @ =0x08B98B88
	bl Proc_EndEach
	ldr r0, _08043600 @ =0x08B98B38
	bl Proc_EndEach
	bl SioReleaseIrq
	bl CloseHelpBox
	bl sub_0803C414
	pop {r0}
	bx r0
	.align 2, 0
_080435F8: .4byte 0x08B98B60
_080435FC: .4byte 0x08B98B88
_08043600: .4byte 0x08B98B38

	thumb_func_start sub_08043604
sub_08043604: @ 0x08043604
	push {lr}
	ldr r2, _08043614 @ =0x081D546C
	movs r0, #8
	movs r1, #0x10
	bl sub_0800530C
	pop {r0}
	bx r0
	.align 2, 0
_08043614: .4byte 0x081D546C

	thumb_func_start sub_08043618
sub_08043618: @ 0x08043618
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08043626
	cmp r0, #0
	blt _08043626
	movs r0, #1
	b _08043628
_08043626:
	movs r0, #0
_08043628:
	bx lr
	.align 2, 0

	thumb_func_start sub_0804362C
sub_0804362C: @ 0x0804362C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08043654 @ =0x02000C00
	ldr r2, _08043658 @ =sub_08043618
	adds r0, r4, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804367E
	ldrb r0, [r4]
	cmp r0, #0
	bne _0804365C
	adds r0, r5, #0
	bl Proc_Break
	b _0804367E
	.align 2, 0
_08043654: .4byte 0x02000C00
_08043658: .4byte sub_08043618
_0804365C:
	cmp r0, #0
	blt _0804367E
	cmp r0, #2
	bgt _0804367E
	ldr r0, _08043688 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _0804368C @ =0x00001193
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_0804367E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043688: .4byte 0x06015000
_0804368C: .4byte 0x00001193

	thumb_func_start sub_08043690
sub_08043690: @ 0x08043690
	ldrb r0, [r0]
	cmp r0, #0x55
	beq _0804369A
	movs r0, #0
	b _0804369C
_0804369A:
	movs r0, #1
_0804369C:
	bx lr
	.align 2, 0

	thumb_func_start sub_080436A0
sub_080436A0: @ 0x080436A0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _080436DC @ =0x02000C04
	ldr r2, _080436E0 @ =sub_08043690
	adds r0, r5, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080436F6
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _080436EC
	ldr r0, _080436E4 @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	ldr r2, _080436E8 @ =0x00001194
	movs r0, #0x38
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080436F6
	.align 2, 0
_080436DC: .4byte 0x02000C04
_080436E0: .4byte sub_08043690
_080436E4: .4byte 0x06015000
_080436E8: .4byte 0x00001194
_080436EC:
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Break
_080436F6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08043700
sub_08043700: @ 0x08043700
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x54]
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x40
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043724
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _08043724
	subs r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl SioPlaySoundEffect
_08043724:
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043742
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bgt _08043742
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #3
	bl SioPlaySoundEffect
_08043742:
	ldr r0, _08043774 @ =0x08B857F8
	ldr r1, [r0]
	movs r6, #1
	adds r0, r6, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043782
	ldr r0, _08043778 @ =0x02000C04
	adds r0, #1
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804377C
	movs r0, #2
	bl SioPlaySoundEffect
	str r6, [r4, #0x50]
	ldr r0, [r4, #0x44]
	str r0, [r5, #0x60]
	adds r0, r5, #0
	bl Proc_Break
	b _08043782
	.align 2, 0
_08043774: .4byte 0x08B857F8
_08043778: .4byte 0x02000C04
_0804377C:
	movs r0, #0
	bl SioPlaySoundEffect
_08043782:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08043788
sub_08043788: @ 0x08043788
	ldrb r0, [r0]
	cmp r0, #0x66
	beq _08043792
	movs r0, #0
	b _08043794
_08043792:
	movs r0, #1
_08043794:
	bx lr
	.align 2, 0

	thumb_func_start sub_08043798
sub_08043798: @ 0x08043798
	push {r4, r5, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r4, _080437F8 @ =0x02000C1C
	add r1, sp, #0x24
	ldr r2, _080437FC @ =sub_08043788
	adds r0, r4, #0
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804381E
	bl CloseHelpBox
	movs r0, #0
	bl sub_0803D500
	ldr r0, _08043800 @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08043804 @ =0x00001195
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	mov r0, sp
	bl ReadFe6LinkSaveInfo
	adds r3, r4, #4
	mov r2, sp
	movs r1, #7
_080437D8:
	ldm r3!, {r0}
	stm r2!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _080437D8
	ldr r1, _08043808 @ =0x02000C04
	adds r1, #5
	ldr r0, [r5, #0x60]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _0804380C
	mov r1, sp
	movs r0, #2
	b _08043810
	.align 2, 0
_080437F8: .4byte 0x02000C1C
_080437FC: .4byte sub_08043788
_08043800: .4byte 0x06016800
_08043804: .4byte 0x00001195
_08043808: .4byte 0x02000C04
_0804380C:
	mov r1, sp
	movs r0, #1
_08043810:
	strh r0, [r1, #0x20]
	mov r0, sp
	bl WriteFe6LinkSaveInfo
	adds r0, r5, #0
	bl Proc_Break
_0804381E:
	add sp, #0x28
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08043828
sub_08043828: @ 0x08043828
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sb, r0
	adds r7, r1, #0
	mov sl, r3
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	str r4, [sp, #0x10]
	movs r6, #0
	cmp r7, #0
	bne _08043848
	b _08043960
_08043848:
	cmp r7, #0x32
	bne _0804387C
	ldr r7, _08043878 @ =0x00001186
	adds r0, r7, #0
	bl GetMsg
	bl GetStringTextLen
	adds r5, r0, #0
	cmp r4, #0
	beq _08043864
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_08043864:
	adds r0, r7, #0
	bl GetMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	b _08043960
	.align 2, 0
_08043878: .4byte 0x00001186
_0804387C:
	ldr r5, [sp]
	asrs r4, r7, #1
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r8, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	mov r0, r8
	cmp r0, #0
	beq _080438B0
	ldr r1, _08043970 @ =0x08B99880
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #4]
	adds r5, r5, r0
_080438B0:
	lsls r0, r4, #1
	ldr r1, _08043970 @ =0x08B99880
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldrh r0, [r0]
	bl GetMsg
	bl GetStringTextLen
	subs r0, #1
	str r0, [sp, #8]
	adds r5, r5, r0
	ldr r0, _08043974 @ =0x00001185
	bl GetMsg
	bl GetStringTextLen
	str r0, [sp, #0xc]
	adds r5, r5, r0
	movs r4, #1
	ands r4, r7
	cmp r4, #0
	beq _080438EA
	ldr r0, _08043978 @ =0x00001188
	bl GetMsg
	bl GetStringTextLen
	adds r5, r5, r0
_080438EA:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	beq _080438F6
	movs r0, #0x30
	subs r0, r0, r5
	asrs r6, r0, #1
_080438F6:
	ldr r0, [sp]
	adds r6, r6, r0
	mov r0, r8
	cmp r0, #0
	beq _0804391C
	lsls r0, r0, #1
	ldr r1, _08043970 @ =0x08B99880
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #4]
	adds r6, r6, r0
_0804391C:
	ldr r2, [sp, #0x14]
	ldrh r0, [r2]
	bl GetMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #8]
	adds r6, r6, r0
	ldr r0, _08043974 @ =0x00001185
	bl GetMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
	ldr r0, [sp, #0xc]
	adds r6, r6, r0
	cmp r4, #0
	beq _08043960
	ldr r0, _08043978 @ =0x00001188
	bl GetMsg
	adds r3, r0, #0
	mov r0, sb
	adds r1, r6, #0
	mov r2, sl
	bl Text_InsertDrawString
_08043960:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043970: .4byte 0x08B99880
_08043974: .4byte 0x00001185
_08043978: .4byte 0x00001188

	thumb_func_start sub_0804397C
sub_0804397C: @ 0x0804397C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _080439CC @ =0x08B99894
	lsls r2, r2, #2
	adds r5, r2, r0
	ldrh r4, [r5, #2]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_08043828
	ldrh r0, [r5]
	bl GetMsg
	bl GetStringTextLen
	movs r1, #0x46
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r4, #0
	bne _080439B0
	subs r1, #0x20
_080439B0:
	adds r4, r1, #0
	adds r4, #0x28
	ldrh r0, [r5]
	bl GetMsg
	adds r3, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl Text_InsertDrawString
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080439CC: .4byte 0x08B99894

	thumb_func_start sub_080439D0
sub_080439D0: @ 0x080439D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043A10 @ =0x00001191
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #1
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #2
	bl GetMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0
	bl Text_InsertDrawString
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043A10: .4byte 0x00001191

	thumb_func_start sub_08043A14
sub_08043A14: @ 0x08043A14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, _08043AF8 @ =0x081D2B3C
	ldr r1, _08043AFC @ =0x06012800
	bl Decompress
	ldr r0, _08043B00 @ =0x081D3598
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc0
	bl ApplyPaletteExt
	ldr r0, _08043B04 @ =0x02000C60
	ldr r1, _08043B08 @ =0x06015000
	movs r2, #0xe
	bl InitSpriteTextFont
	ldr r0, _08043B0C @ =0x08194674
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	movs r5, #0
	ldr r0, _08043B10 @ =0x02000C04
	mov r8, r0
	movs r1, #5
	add r1, r8
	mov sb, r1
_08043A5E:
	lsls r0, r5, #2
	adds r2, r6, #0
	adds r2, #0x2c
	adds r2, r2, r0
	mov r0, r8
	adds r0, #9
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, #1
	mov r0, r8
	adds r0, #1
	adds r0, r5, r0
	ldrb r3, [r0]
	subs r1, r1, r3
	str r1, [r2]
	ldrb r0, [r0]
	movs r7, #1
	cmp r0, #0
	beq _08043A88
	movs r7, #0
_08043A88:
	lsls r4, r5, #3
	ldr r0, _08043B14 @ =0x02000C40
	adds r4, r4, r0
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	mov r1, sb
	adds r0, r5, r1
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_0804397C
	lsls r2, r5, #1
	adds r0, r6, #0
	adds r0, #0x38
	adds r0, r0, r2
	movs r1, #0x18
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3e
	adds r1, r1, r2
	lsls r0, r5, #5
	adds r0, #0x20
	strh r0, [r1]
	adds r5, #1
	cmp r5, #2
	ble _08043A5E
	ldr r4, _08043B18 @ =0x02000C58
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r0, r4, #0
	bl sub_080439D0
	movs r0, #0
	str r0, [r6, #0x48]
	str r0, [r6, #0x44]
	str r0, [r6, #0x54]
	str r0, [r6, #0x50]
	str r0, [r6, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043AF8: .4byte 0x081D2B3C
_08043AFC: .4byte 0x06012800
_08043B00: .4byte 0x081D3598
_08043B04: .4byte 0x02000C60
_08043B08: .4byte 0x06015000
_08043B0C: .4byte 0x08194674
_08043B10: .4byte 0x02000C04
_08043B14: .4byte 0x02000C40
_08043B18: .4byte 0x02000C58

	thumb_func_start sub_08043B1C
sub_08043B1C: @ 0x08043B1C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r6, #0
	adds r3, r5, #0
	bl FormatTime
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #0x63
	bls _08043B44
	add r0, sp, #4
	movs r1, #0x63
	strh r1, [r0]
	movs r0, #0x3b
	strh r0, [r5]
	strh r0, [r6]
_08043B44:
	ldrh r0, [r5]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08043C04 @ =0x08B99984
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r5]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	movs r5, #0xa
	str r5, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x90
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl DivRem
	ldr r4, _08043C08 @ =0x08B9997C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r6]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	str r5, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl DivRem
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	cmp r0, #0
	ble _08043BFC
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl Div
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x88
	adds r3, r4, #0
	bl PutSprite
_08043BFC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043C04: .4byte 0x08B99984
_08043C08: .4byte 0x08B9997C

	thumb_func_start sub_08043C0C
sub_08043C0C: @ 0x08043C0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0x38
	adds r0, r0, r6
	mov r8, r0
	movs r2, #0x3e
	adds r2, r2, r6
	mov sb, r2
_08043C26:
	lsls r0, r7, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r5, r5, r0
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r6, #0
	adds r4, #0x3e
	adds r4, r4, r0
	movs r0, #0
	ldrsh r2, [r4, r0]
	lsls r3, r7, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r3
	ldr r0, [r0]
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043CBC @ =0x08B99968
	bl PutSprite
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r1, #0x28
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r2, #8
	lsls r0, r7, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043CC0 @ =0x08B9993C
	bl PutSprite
	adds r7, #1
	cmp r7, #2
	ble _08043C26
	ldr r1, _08043CC4 @ =0x02000C04
	ldr r0, [r6, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08043B1C
	ldr r1, [r6, #0x44]
	lsls r1, r1, #1
	mov r2, r8
	adds r0, r2, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	add r1, sb
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r1, #8
	bl PutUiHand
	ldr r0, [r6, #0x50]
	cmp r0, #1
	bne _08043CAE
	movs r0, #0
	str r0, [r6, #0x54]
	adds r0, r6, #0
	bl Proc_Break
_08043CAE:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043CBC: .4byte 0x08B99968
_08043CC0: .4byte 0x08B9993C
_08043CC4: .4byte 0x02000C04

	thumb_func_start sub_08043CC8
sub_08043CC8: @ 0x08043CC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08043CD8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _08043D06
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r2, #0xa0
	lsls r2, r2, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _08043D2C
_08043D06:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x3e
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_08043D2C:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _08043D9C @ =0x08B99968
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043DA0 @ =0x08B9993C
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08043CD8
	ldr r1, _08043DA4 @ =0x02000C04
	ldr r0, [r5, #0x44]
	lsls r0, r0, #2
	adds r1, #0xc
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_08043B1C
	ldr r0, [r5, #0x50]
	cmp r0, #2
	bne _08043D8E
	movs r0, #0
	str r0, [r5, #0x54]
	adds r0, r5, #0
	bl Proc_Break
_08043D8E:
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08043DA8
	adds r0, #1
	str r0, [r5, #0x54]
	b _08043DAC
	.align 2, 0
_08043D9C: .4byte 0x08B99968
_08043DA0: .4byte 0x08B9993C
_08043DA4: .4byte 0x02000C04
_08043DA8:
	movs r0, #0
	str r0, [r5, #0x50]
_08043DAC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08043DB8
sub_08043DB8: @ 0x08043DB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
_08043DC8:
	ldr r0, [r5, #0x44]
	cmp r8, r0
	beq _08043DF4
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r2, [r0, r1]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	movs r1, #0xf0
	bl Interpolate
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r4, [r0, r3]
	b _08043E1A
_08043DF4:
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r7
	movs r1, #0
	ldrsh r6, [r0, r1]
	movs r3, #0x3e
	ldrsh r1, [r5, r3]
	adds r0, r5, #0
	adds r0, #0x3e
	adds r0, r0, r7
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, [r5, #0x54]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
_08043E1A:
	mov r0, r8
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r4, #0
	ldr r3, _08043E78 @ =0x08B99968
	bl PutSprite
	adds r1, r6, #0
	adds r1, #0x28
	adds r2, r4, #0
	adds r2, #8
	mov r3, r8
	lsls r0, r3, #6
	str r0, [sp]
	movs r0, #4
	ldr r3, _08043E7C @ =0x08B9993C
	bl PutSprite
	adds r7, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #2
	ble _08043DC8
	ldr r0, _08043E80 @ =0x02000C04
	ldr r1, [r5, #0x44]
	lsls r1, r1, #2
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_08043B1C
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	bgt _08043E84
	adds r0, #1
	str r0, [r5, #0x54]
	b _08043E92
	.align 2, 0
_08043E78: .4byte 0x08B99968
_08043E7C: .4byte 0x08B9993C
_08043E80: .4byte 0x02000C04
_08043E84:
	movs r0, #0
	str r0, [r5, #0x54]
	str r0, [r5, #0x50]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
_08043E92:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08043EA0
sub_08043EA0: @ 0x08043EA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043EB0 @ =0x08B9998C
	bl SpawnProc
	pop {r1}
	bx r1
	.align 2, 0
_08043EB0: .4byte 0x08B9998C

	thumb_func_start sub_08043EB4
sub_08043EB4: @ 0x08043EB4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ApplySystemGraphics
	adds r0, r4, #0
	bl sub_080ACA90
	ldr r0, _08043EFC @ =0x08B99870
	bl Proc_EndEach
	adds r0, r4, #0
	bl sub_08043EA0
	str r0, [r4, #0x54]
	bl LoadUiFrameGraphics
	ldr r0, _08043F00 @ =0x02023460
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x12
	movs r2, #0x10
	movs r3, #0xb
	bl PutUiWindowFrame
	movs r0, #0xf
	bl EnableBgSync
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043EFC: .4byte 0x08B99870
_08043F00: .4byte 0x02023460

	thumb_func_start sub_08043F04
sub_08043F04: @ 0x08043F04
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x54]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	bne _08043F16
	adds r0, r1, #0
	bl Proc_Break
_08043F16:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08043F1C
sub_08043F1C: @ 0x08043F1C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08043F4C @ =0x02023460
	movs r1, #6
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r1, #2
	movs r2, #9
	movs r3, #0x10
	bl PutUiWindowFrame
	movs r0, #2
	bl EnableBgSync
	adds r5, #0x68
	strh r4, [r5]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043F4C: .4byte 0x02023460

	thumb_func_start sub_08043F50
sub_08043F50: @ 0x08043F50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x54]
	ldr r4, _08043FA8 @ =0x08B999BC
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x50
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x60
	adds r3, r4, #0
	bl PutSprite
	adds r4, r5, #0
	adds r4, #0x68
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, #0x28
	movs r1, #0x60
	bl PutUiHand
	ldr r0, _08043FAC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08043FB0
	movs r0, #1
	bl SioPlaySoundEffect
	str r6, [r7, #0x50]
	b _08044012
	.align 2, 0
_08043FA8: .4byte 0x08B999BC
_08043FAC: .4byte 0x08B857F8
_08043FB0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08043FC8
	ldrh r0, [r4]
	cmp r0, #1
	bne _08043FC8
	subs r0, #1
	strh r0, [r4]
	movs r0, #3
	bl SioPlaySoundEffect
_08043FC8:
	ldr r0, _0804402C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08043FEE
	adds r1, r5, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _08043FEE
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_08043FEE:
	ldr r0, _0804402C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08044072
	adds r0, r5, #0
	adds r0, #0x68
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08044034
	movs r0, #1
	bl SioPlaySoundEffect
	movs r0, #2
	str r0, [r7, #0x50]
_08044012:
	ldr r0, _08044030 @ =0x020236A4
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_t
	movs r0, #2
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _08044072
	.align 2, 0
_0804402C: .4byte 0x08B857F8
_08044030: .4byte 0x020236A4
_08044034:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r0, _0804407C @ =0x02000C00
	ldr r1, [r7, #0x44]
	strb r1, [r0]
	movs r1, #4
	bl SioEmitData
	ldr r0, _08044080 @ =0x020236A4
	movs r1, #0x10
	movs r2, #6
	movs r3, #0
	bl TmFillRect_t
	movs r0, #2
	bl EnableBgSync
	ldr r0, _08044084 @ =0x06016800
	movs r1, #0xd
	bl LoadHelpBoxGfx
	ldr r2, _08044088 @ =0x00001192
	movs r0, #0x40
	movs r1, #0x48
	bl StartHelpBoxExt_Unk
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044072:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804407C: .4byte 0x02000C00
_08044080: .4byte 0x020236A4
_08044084: .4byte 0x06016800
_08044088: .4byte 0x00001192

	thumb_func_start sub_0804408C
sub_0804408C: @ 0x0804408C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080440A8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080440A4
	adds r0, r2, #0
	bl Proc_Break
_080440A4:
	pop {r0}
	bx r0
	.align 2, 0
_080440A8: .4byte 0x08B857F8

	thumb_func_start sub_080440AC
sub_080440AC: @ 0x080440AC
	push {lr}
	bl SoundVSyncOn_rev01
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GC_ConnectToFE6
GC_ConnectToFE6: @ 0x080440B8
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	ldr r0, _080440DC @ =0x0203DA60
	ldr r1, _080440E0 @ =0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	ldr r0, _080440E4 @ =0x08B999D8
	adds r1, r4, #0
	bl SpawnProcLocking
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080440DC: .4byte 0x0203DA60
_080440E0: .4byte 0x06001800
_080440E4: .4byte 0x08B999D8

	thumb_func_start sub_080440E8
sub_080440E8: @ 0x080440E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r1, _08044130 @ =0x0203D90C
	adds r0, r1, #0
	adds r0, #0xa0
	ldrb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08044138
	movs r6, #0
	cmp r6, r3
	bge _08044192
	ldr r4, _08044134 @ =0x0203DCAB
	adds r5, r4, #5
	mov r2, r8
_08044114:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt _08044114
	b _08044192
	.align 2, 0
_08044130: .4byte 0x0203D90C
_08044134: .4byte 0x0203DCAB
_08044138:
	movs r6, #0
	subs r1, r3, #2
	mov ip, r1
	cmp r6, r3
	bge _08044158
	ldr r0, _0804415C @ =0x0203DC9C
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
_0804414A:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt _0804414A
_08044158:
	movs r6, #0
	b _0804418C
	.align 2, 0
_0804415C: .4byte 0x0203DC9C
_08044160:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt _0804418A
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
_0804416E:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bhs _08044182
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
_08044182:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge _0804416E
_0804418A:
	adds r6, r7, #0
_0804418C:
	mov r0, ip
	cmp r6, r0
	ble _08044160
_08044192:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DrawLinkArenaPointsBox
DrawLinkArenaPointsBox: @ 0x0804419C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080441E8 @ =0x02023460
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
_080441B0:
	adds r2, r1, #1
	movs r1, #5
_080441B4:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge _080441B4
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble _080441B0
	adds r0, r6, #0
	bl ClearText
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080441EC @ =0x02022C60
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl PutNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080441E8: .4byte 0x02023460
_080441EC: .4byte 0x02022C60

	thumb_func_start LAPointsBox_LoadBoxes
LAPointsBox_LoadBoxes: @ 0x080441F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080442B0 @ =0x081C79B4
	ldr r1, _080442B4 @ =0x06002800
	bl Decompress
	ldr r0, _080442B8 @ =0x081C7F04
	movs r1, #0x40
	movs r2, #0x80
	bl ApplyPaletteExt
	movs r0, #0
	bl SetTextFont
	bl ResetTextFont
	movs r0, #0
	mov sb, r0
	ldr r0, _080442BC @ =0x081D5470
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, _080442C0 @ =0x081D54E0
_08044228:
	ldr r0, _080442C4 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, sb
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804428C
	ldr r0, _080442C8 @ =0x0203DC9C
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne _08044260
	lsls r1, r4, #5
	ldr r0, _080442CC @ =0x081C8164
	movs r2, #0x20
	bl ApplyPaletteExt
_08044260:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl InitTextDb
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl DrawLinkArenaPointsBox
_0804428C:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add sb, r0
	mov r0, sb
	cmp r0, #3
	ble _08044228
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080442B0: .4byte 0x081C79B4
_080442B4: .4byte 0x06002800
_080442B8: .4byte 0x081C7F04
_080442BC: .4byte 0x081D5470
_080442C0: .4byte 0x081D54E0
_080442C4: .4byte 0x08B98AEC
_080442C8: .4byte 0x0203DC9C
_080442CC: .4byte 0x081C8164

	thumb_func_start sub_080442D0
sub_080442D0: @ 0x080442D0
	bx lr
	.align 2, 0

	thumb_func_start StartLinkArenaPointsBox
StartLinkArenaPointsBox: @ 0x080442D4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _080442F8 @ =0x08B99AD8
	movs r1, #3
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_080442F8: .4byte 0x08B99AD8

	thumb_func_start EndLinkArenaPointsBox
EndLinkArenaPointsBox: @ 0x080442FC
	push {lr}
	ldr r0, _0804430C @ =0x08B99AD8
	bl Proc_EndEach
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_0804430C: .4byte 0x08B99AD8

	thumb_func_start sub_08044310
sub_08044310: @ 0x08044310
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, _08044360 @ =0x081D5480
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, _08044364 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044368
	ldrb r0, [r4, #0x10]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b _08044390
	.align 2, 0
_08044360: .4byte 0x081D5480
_08044364: .4byte 0x08B98AEC
_08044368:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _080443CC @ =0x08B99AF0
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	adds r1, r0, r1
	strh r1, [r5, #0x2c]
_08044390:
	ldr r1, _080443D0 @ =0x081D54E0
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, _080443D4 @ =0x02000C60
	bl SetTextFont
	ldr r0, _080443D8 @ =0x02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl SioDrawNumber
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443CC: .4byte 0x08B99AF0
_080443D0: .4byte 0x081D54E0
_080443D4: .4byte 0x02000C60
_080443D8: .4byte 0x02000C78

	thumb_func_start sub_080443DC
sub_080443DC: @ 0x080443DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi _08044470
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl Interpolate
	mov sl, r0
	ldr r4, _080444A0 @ =0x080C5A48
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_08044470:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080444C2
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls _080444C2
	cmp r1, #0x16
	bhi _080444C2
	subs r1, #4
	ldr r4, [sp, #4]
	ldrb r4, [r4, #0x10]
	cmp r4, #8
	bne _080444A8
	ldr r0, _080444A4 @ =0x08B99B10
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r2, [r7, #0x2a]
	ldrh r0, [r0]
	adds r0, r2, r0
	b _080444B4
	.align 2, 0
_080444A0: .4byte 0x080C5A48
_080444A4: .4byte 0x08B99B10
_080444A8:
	ldr r0, _08044508 @ =0x08B99B10
	lsls r1, r1, #1
	adds r0, r1, r0
	ldrh r4, [r7, #0x2a]
	ldrh r0, [r0]
	subs r0, r4, r0
_080444B4:
	strh r0, [r7, #0x2a]
	ldr r0, _0804450C @ =0x08B99B36
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r0, r1, r0
	strh r0, [r7, #0x2c]
_080444C2:
	movs r2, #0x2a
	ldrsh r0, [r7, r2]
	movs r4, #0x2c
	ldrsh r1, [r7, r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r2, _08044510 @ =0x08B905F8
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, _08044514 @ =0x00009340
	adds r3, r3, r4
	bl PutOamHiRam
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls _080444F6
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
_080444F6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044508: .4byte 0x08B99B10
_0804450C: .4byte 0x08B99B36
_08044510: .4byte 0x08B905F8
_08044514: .4byte 0x00009340

	thumb_func_start sub_08044518
sub_08044518: @ 0x08044518
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	adds r1, r0, #0
	ldr r2, _08044574 @ =0x08B905F8
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r3, r0, #2
	ldr r0, _08044578 @ =0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl PutOamHiRam
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls _0804456C
	adds r0, r6, #0
	bl Proc_Break
_0804456C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044574: .4byte 0x08B905F8
_08044578: .4byte 0x00009340

	thumb_func_start DrawLinkArenaScoreNumber
DrawLinkArenaScoreNumber: @ 0x0804457C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl SioDrawNumber
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _080445C0 @ =0x02022C60
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080445C0: .4byte 0x02022C60

	thumb_func_start sub_080445C4
sub_080445C4: @ 0x080445C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08044624 @ =0x081D5480
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, _08044628 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r2, r0
	adds r0, r0, r1
	ldr r2, _0804462C @ =0x081D54E0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl DrawLinkArenaScoreNumber
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044624: .4byte 0x081D5480
_08044628: .4byte 0x08B98AEC
_0804462C: .4byte 0x081D54E0

	thumb_func_start sub_08044630
sub_08044630: @ 0x08044630
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0
	bl SetTextFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl DrawLinkArenaScoreNumber
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq _0804468A
	adds r1, r4, #0
	adds r1, #0x32
	ldr r0, _080446BC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r1, [r1]
	ldrb r0, [r0, #6]
	cmp r1, r0
	bne _0804468A
	ldr r0, _080446C0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804468A
	movs r0, #0x80
	bl m4aSongNumStart
_0804468A:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls _080446B2
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r0, _080446C4 @ =0x0203DC9C
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r4, #0x38]
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080446B2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080446BC: .4byte 0x08B98AEC
_080446C0: .4byte 0x0202BBF8
_080446C4: .4byte 0x0203DC9C

	thumb_func_start PointsNumberMover_AwaitEnd
PointsNumberMover_AwaitEnd: @ 0x080446C8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls _080446DC
	adds r0, r1, #0
	bl Proc_Break
_080446DC:
	pop {r0}
	bx r0

	thumb_func_start sub_080446E0
sub_080446E0: @ 0x080446E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08044704 @ =0x02000C60
	bl SetTextFont
	ldr r0, _08044708 @ =0x02000C78
	ldr r3, [r4, #0x54]
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044704: .4byte 0x02000C60
_08044708: .4byte 0x02000C78

	thumb_func_start PointsSpriteText_LoopIn
PointsSpriteText_LoopIn: @ 0x0804470C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _0804479E
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, _0804480C @ =0x080C5A48
	ldr r2, _08044810 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _08044810 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_0804479E:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08044814 @ =0x08B905F8
	ldr r3, _08044818 @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _0804481C @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08044820 @ =0x08B905B8
	ldr r3, _08044824 @ =0x00009358
	bl PutOamHiRam
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _080447FA
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_080447FA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804480C: .4byte 0x080C5A48
_08044810: .4byte 0x080C5AC8
_08044814: .4byte 0x08B905F8
_08044818: .4byte 0x00009350
_0804481C: .4byte 0x00009354
_08044820: .4byte 0x08B905B8
_08044824: .4byte 0x00009358

	thumb_func_start PointsSpriteText_LoopOut
PointsSpriteText_LoopOut: @ 0x08044828
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _080448BE
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl Interpolate
	mov sl, r0
	ldr r4, _08044928 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080448BE:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _0804492C @ =0x08B905F8
	ldr r3, _08044930 @ =0x00009350
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08044934 @ =0x00009354
	adds r2, r5, #0
	bl PutOamHiRam
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08044938 @ =0x08B905B8
	ldr r3, _0804493C @ =0x00009358
	bl PutOamHiRam
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08044916
	adds r0, r7, #0
	bl Proc_Break
_08044916:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044928: .4byte 0x080C5A48
_0804492C: .4byte 0x08B905F8
_08044930: .4byte 0x00009350
_08044934: .4byte 0x00009354
_08044938: .4byte 0x08B905B8
_0804493C: .4byte 0x00009358

	thumb_func_start sub_08044940
sub_08044940: @ 0x08044940
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	movs r0, #0
	mov sl, r0
	ldr r0, _08044A18 @ =0x08194674
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08044A1C @ =0x02000C60
	ldr r1, _08044A20 @ =0x06016800
	movs r2, #3
	bl InitSpriteTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	bl ResetTextFont
	ldr r4, _08044A24 @ =0x02000C78
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFont
	movs r1, #0
	mov r8, r1
_08044996:
	ldr r0, _08044A28 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _08044A2C @ =0x081D5480
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044A44
	ldr r6, _08044A30 @ =0x0203DC9C
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _08044A3C
	ldr r0, _08044A34 @ =0x08B99B5C
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, _08044A38 @ =0x0000270F
	cmp r1, r0
	bls _080449F8
	str r0, [r2, #0x38]
_080449F8:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, sb
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl InitTextDb
	movs r0, #1
	add sl, r0
	b _08044A44
	.align 2, 0
_08044A18: .4byte 0x08194674
_08044A1C: .4byte 0x02000C60
_08044A20: .4byte 0x06016800
_08044A24: .4byte 0x02000C78
_08044A28: .4byte 0x08B98AEC
_08044A2C: .4byte 0x081D5480
_08044A30: .4byte 0x0203DC9C
_08044A34: .4byte 0x08B99B5C
_08044A38: .4byte 0x0000270F
_08044A3C:
	mov r0, sp
	movs r1, #4
	bl InitTextDb
_08044A44:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble _08044996
	mov r1, sl
	cmp r1, #0
	beq _08044A78
	mov r0, sb
	cmp r0, #0
	beq _08044A6E
	ldr r0, _08044A74 @ =0x08B99B9C
	ldr r1, [sp, #0x34]
	bl SpawnProcLocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
_08044A6E:
	movs r0, #1
	b _08044A7A
	.align 2, 0
_08044A74: .4byte 0x08B99B9C
_08044A78:
	movs r0, #0
_08044A7A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08044A8C
sub_08044A8C: @ 0x08044A8C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r0, _08044ABC @ =0x000012CB
	bl GetMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl sub_08044940
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044AB4
	bl EndLinkArenaPointsBox
_08044AB4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044ABC: .4byte 0x000012CB

	thumb_func_start sub_08044AC0
sub_08044AC0: @ 0x08044AC0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r0, _08044AE8 @ =0x000012CB
	bl GetMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl sub_08044940
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044AE8: .4byte 0x000012CB

	thumb_func_start sub_08044AEC
sub_08044AEC: @ 0x08044AEC
	adds r1, r0, #0
	adds r1, #0x1e
	ldr r3, _08044B04 @ =0x03001428
	movs r2, #4
_08044AF4:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _08044AF4
	bx lr
	.align 2, 0
_08044B04: .4byte 0x03001428

	thumb_func_start sub_08044B08
sub_08044B08: @ 0x08044B08
	ldr r3, _08044B20 @ =0x03001428
	adds r1, r0, #0
	adds r1, #0x1e
	movs r2, #4
_08044B10:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08044B10
	bx lr
	.align 2, 0
_08044B20: .4byte 0x03001428

	thumb_func_start sub_08044B24
sub_08044B24: @ 0x08044B24
	push {lr}
	bl sub_08044DCC
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08044B34
sub_08044B34: @ 0x08044B34
	movs r1, #0
	ldr r3, _08044B50 @ =0x0203DC9C
	adds r2, r3, #0
	adds r2, #0xa
_08044B3C:
	cmp r0, #2
	beq _08044B66
	cmp r0, #2
	bgt _08044B54
	cmp r0, #0
	beq _08044B5E
	cmp r0, #1
	beq _08044B62
	b _08044B70
	.align 2, 0
_08044B50: .4byte 0x0203DC9C
_08044B54:
	cmp r0, #3
	beq _08044B6A
	cmp r0, #0xff
	beq _08044B6E
	b _08044B70
_08044B5E:
	movs r1, #2
	b _08044B70
_08044B62:
	movs r1, #3
	b _08044B70
_08044B66:
	movs r1, #1
	b _08044B70
_08044B6A:
	movs r1, #0
	b _08044B70
_08044B6E:
	movs r1, #0xff
_08044B70:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044B80
	cmp r1, #0xff
	beq _08044B80
	adds r0, r1, #0
	b _08044B3C
_08044B80:
	strb r1, [r3, #1]
	bx lr

	thumb_func_start sub_08044B84
sub_08044B84: @ 0x08044B84
	ldr r1, _08044B94 @ =0x0300141C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_08044B94: .4byte 0x0300141C

	thumb_func_start sub_08044B98
sub_08044B98: @ 0x08044B98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl sub_08044B84
	ldr r1, _08044BD4 @ =0x0300141C
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, _08044BD8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #2
	beq _08044BDC
	movs r0, #0
	b _08044BE8
	.align 2, 0
_08044BD4: .4byte 0x0300141C
_08044BD8: .4byte 0x0203D90C
_08044BDC:
	adds r0, r1, #0
	movs r1, #4
	bl SioEmitData
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08044BE8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08044BF0
sub_08044BF0: @ 0x08044BF0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08044C04 @ =0x03001400
_08044BF8:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08044C08
	adds r0, r1, #0
	b _08044C0E
	.align 2, 0
_08044C04: .4byte 0x03001400
_08044C08:
	adds r1, #1
	cmp r1, #0x13
	ble _08044BF8
_08044C0E:
	bx lr

	thumb_func_start sub_08044C10
sub_08044C10: @ 0x08044C10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov sb, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08044D04 @ =0x081D54EC
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, _08044D08 @ =0x081D54F4
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl sub_08044BF0
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, _08044D0C @ =0x03001400
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _08044C8C
	adds r0, r5, #0
	bl StartMu
	ldr r1, _08044D10 @ =0x03001420
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl SetMuMoveScript
_08044C8C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshUnitSprites
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, sb
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08044CF4
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, sb
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, sb
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _08044D10 @ =0x03001420
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
_08044CF4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044D04: .4byte 0x081D54EC
_08044D08: .4byte 0x081D54F4
_08044D0C: .4byte 0x03001400
_08044D10: .4byte 0x03001420

	thumb_func_start sub_08044D14
sub_08044D14: @ 0x08044D14
	ldr r1, _08044D28 @ =0x03001400
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
_08044D1C:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08044D1C
	bx lr
	.align 2, 0
_08044D28: .4byte 0x03001400

	thumb_func_start sub_08044D2C
sub_08044D2C: @ 0x08044D2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
_08044D3A:
	ldr r0, _08044DB8 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08044DBC @ =0x081D5470
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08044DA2
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _08044DC0 @ =0x081D5490
	mov sl, r0
_08044D6C:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, _08044DC4 @ =0x081D54FC
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq _08044D9C
	ldr r0, _08044DC8 @ =0x03001400
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
_08044D9C:
	adds r6, #1
	cmp r6, #4
	ble _08044D6C
_08044DA2:
	mov r7, sb
	cmp r7, #3
	ble _08044D3A
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044DB8: .4byte 0x08B98AEC
_08044DBC: .4byte 0x081D5470
_08044DC0: .4byte 0x081D5490
_08044DC4: .4byte 0x081D54FC
_08044DC8: .4byte 0x03001400

	thumb_func_start sub_08044DCC
sub_08044DCC: @ 0x08044DCC
	push {r4, lr}
	ldr r0, _08044E24 @ =0x0202E3DC
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08044E28 @ =0x0202E3EC
	ldr r0, [r0]
	movs r1, #1
	bl BmMapFillg
	movs r4, #1
_08044DE4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08044E18
	ldr r0, [r2]
	cmp r0, #0
	beq _08044E18
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08044E18
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _08044E24 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
_08044E18:
	adds r4, #1
	cmp r4, #0xc5
	ble _08044DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044E24: .4byte 0x0202E3DC
_08044E28: .4byte 0x0202E3EC

	thumb_func_start sub_08044E2C
sub_08044E2C: @ 0x08044E2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08044EA4 @ =0x081D5470
	mov sl, r0
_08044E3E:
	ldr r0, _08044EA8 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov sb, r1
	cmp r0, #0
	beq _08044EC2
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, _08044EAC @ =0x03001400
_08044E70:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, _08044EB0 @ =0x081D54FC
	adds r0, r6, r0
	ldrb r4, [r0]
	add r4, r8
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _08044E9C
	ldr r0, [r1, #0xc]
	ldr r1, _08044EB4 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08044EB8
_08044E9C:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b _08044EBC
	.align 2, 0
_08044EA4: .4byte 0x081D5470
_08044EA8: .4byte 0x08B98AEC
_08044EAC: .4byte 0x03001400
_08044EB0: .4byte 0x081D54FC
_08044EB4: .4byte 0x00010005
_08044EB8:
	adds r0, r5, r7
	strb r4, [r0]
_08044EBC:
	adds r6, #1
	cmp r6, #4
	ble _08044E70
_08044EC2:
	mov r2, sb
	cmp r2, #3
	ble _08044E3E
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08044ED8
sub_08044ED8: @ 0x08044ED8
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08044F30 @ =0x0202BBB8
	ldr r2, _08044F34 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0x40
	movs r5, #0
	ldrb r1, [r4, #4]
	orrs r0, r1
	strb r0, [r4, #4]
	bl InitTraps
	ldr r4, _08044F38 @ =0x0202BBF8
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x41
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x41
	bl InitChapterMap
	bl GetGameTime
	str r0, [r4, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044F30: .4byte 0x0202BBB8
_08044F34: .4byte 0x01000020
_08044F38: .4byte 0x0202BBF8

	thumb_func_start sub_08044F3C
sub_08044F3C: @ 0x08044F3C
	push {lr}
	bl sub_08044ED8
	bl sub_08044D14
	bl sub_08044D2C
	ldr r0, _08044F6C @ =0x0202E3EC
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08044F70 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08044F5A
	movs r1, #1
_08044F5A:
	adds r0, r2, #0
	bl BmMapFillg
	bl sub_08044DCC
	bl RenderMap
	pop {r0}
	bx r0
	.align 2, 0
_08044F6C: .4byte 0x0202E3EC
_08044F70: .4byte 0x0202BBF8

	thumb_func_start sub_08044F74
sub_08044F74: @ 0x08044F74
	push {r4, lr}
	ldr r0, _08044FAC @ =0x0203DC9C
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
_08044F7E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _08044F7E
	movs r2, #0
	ldr r4, _08044FB0 @ =0x03001400
	ldr r3, _08044FB4 @ =0x0203DCA6
_08044F8E:
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044FA0
	lsrs r0, r0, #6
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
_08044FA0:
	adds r2, #1
	cmp r2, #0x13
	ble _08044F8E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044FAC: .4byte 0x0203DC9C
_08044FB0: .4byte 0x03001400
_08044FB4: .4byte 0x0203DCA6

	thumb_func_start LoadLinkArenaFogPlaceholder
LoadLinkArenaFogPlaceholder: @ 0x08044FB8
	push {lr}
	ldr r0, _08044FC8 @ =0x081C7D58
	ldr r1, _08044FCC @ =0x06014800
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08044FC8: .4byte 0x081C7D58
_08044FCC: .4byte 0x06014800

	thumb_func_start sub_08044FD0
sub_08044FD0: @ 0x08044FD0
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl LoadLinkArenaFogPlaceholder
	bl InitSystemTextFont
	ldr r1, _08044FF8 @ =0x0203DC9C
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
_08044FF8: .4byte 0x0203DC9C

	thumb_func_start sub_08044FFC
sub_08044FFC: @ 0x08044FFC
	push {r4, r5, lr}
	ldr r1, _08045054 @ =0x0202BBF8
	movs r0, #0x42
	adds r0, r0, r1
	mov ip, r0
	movs r3, #7
	rsbs r3, r3, #0
	ldrb r2, [r0]
	ands r3, r2
	adds r5, r1, #0
	adds r5, #0x40
	movs r2, #0x10
	ldrb r0, [r5]
	orrs r2, r0
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r1, #0
	adds r4, #0x41
	subs r0, #0x81
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	movs r0, #1
	orrs r2, r0
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045054: .4byte 0x0202BBF8

	thumb_func_start sub_08045058
sub_08045058: @ 0x08045058
	push {r4, r5, lr}
	movs r0, #0
	bl InitBgs
	bl ClearSioBG
	bl sub_08044F3C
	bl sub_08044F74
	ldr r4, _08045104 @ =0x0203DC9C
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, _08045108 @ =0x0203D90C
	strb r5, [r0, #0xb]
	ldr r0, _0804510C @ =0x08B99BC4
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl sub_08044B34
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
_08045090:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge _08045090
	movs r4, #0
	ldr r0, _08045110 @ =0x03001400
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, _08045114 @ =0x03001414
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetMapCursorPosition
	ldr r0, _08045118 @ =0x0202BBB8
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ResetUnitSprites
	bl RefreshUnitSprites
	bl LoadLinkArenaFogPlaceholder
	bl sub_08046B48
	ldr r0, _0804511C @ =0x08B961A8
	movs r1, #4
	bl SpawnProc
	bl StartBmVSync
	bl sub_08044FFC
	ldr r1, _08045120 @ =0x0202BBF8
	movs r0, #0xbf
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045104: .4byte 0x0203DC9C
_08045108: .4byte 0x0203D90C
_0804510C: .4byte 0x08B99BC4
_08045110: .4byte 0x03001400
_08045114: .4byte 0x03001414
_08045118: .4byte 0x0202BBB8
_0804511C: .4byte 0x08B961A8
_08045120: .4byte 0x0202BBF8

	thumb_func_start sub_08045124
sub_08045124: @ 0x08045124
	push {r4, r5, lr}
	ldr r0, _08045164 @ =0x03001400
	ldr r1, _08045168 @ =0x0203DC9C
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl StartMu
	ldr r5, _0804516C @ =0x03001420
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r0, [r5]
	bl DisableMuCamera
	ldr r0, [r5]
	movs r1, #3
	bl SetMuFacing
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045164: .4byte 0x03001400
_08045168: .4byte 0x0203DC9C
_0804516C: .4byte 0x03001420

	thumb_func_start sub_08045170
sub_08045170: @ 0x08045170
	push {lr}
	adds r2, r0, #0
	ldr r0, _08045190 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804518A
	adds r0, r2, #0
	bl Proc_Break
_0804518A:
	pop {r0}
	bx r0
	.align 2, 0
_08045190: .4byte 0x08B857F8

	thumb_func_start sub_08045194
sub_08045194: @ 0x08045194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080451A8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080451AC
	cmp r0, #2
	beq _080451C0
	b _080451EC
	.align 2, 0
_080451A8: .4byte 0x0203D90C
_080451AC:
	ldr r0, _080451B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _080451CE
	ldr r0, _080451BC @ =0x08B99FF8
	b _080451D0
	.align 2, 0
_080451B8: .4byte 0x0202BBF8
_080451BC: .4byte 0x08B99FF8
_080451C0:
	ldr r0, _080451D8 @ =0x0202BBF8
	ldr r1, _080451DC @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r0, [r0, #0xf]
	ldrb r1, [r1, #6]
	cmp r0, r1
	bne _080451E4
_080451CE:
	ldr r0, _080451E0 @ =0x08B99D58
_080451D0:
	adds r1, r4, #0
	bl SpawnProcLocking
	b _080451EC
	.align 2, 0
_080451D8: .4byte 0x0202BBF8
_080451DC: .4byte 0x08B98AEC
_080451E0: .4byte 0x08B99D58
_080451E4:
	ldr r0, _080451F8 @ =0x08B99F08
	adds r1, r4, #0
	bl SpawnProcLocking
_080451EC:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080451F8: .4byte 0x08B99F08

	thumb_func_start sub_080451FC
sub_080451FC: @ 0x080451FC
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r0, _08045214 @ =0x0203D90C
	ldrb r2, [r0]
	cmp r2, #1
	bne _08045218
	ldrb r0, [r0, #0xb]
	cmp r0, #1
	bne _08045228
	b _0804521E
	.align 2, 0
_08045214: .4byte 0x0203D90C
_08045218:
	ldrb r0, [r0, #0xb]
	cmp r0, #2
	bne _08045228
_0804521E:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b _08045282
_08045228:
	ldr r0, _0804523C @ =0x0203DC9C
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08045240
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08045282
	.align 2, 0
_0804523C: .4byte 0x0203DC9C
_08045240:
	ldr r0, _08045248 @ =0x0202BBF8
	strb r2, [r0, #0xf]
	ldr r2, _0804524C @ =0x03001400
	b _08045252
	.align 2, 0
_08045248: .4byte 0x0202BBF8
_0804524C: .4byte 0x03001400
_08045250:
	adds r1, #1
_08045252:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08045250
	ldr r4, _08045288 @ =0x0203DC9C
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl ApplySystemObjectsGraphics
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
_0804526C:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge _0804526C
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl SetupDebugFontForOBJ
_08045282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045288: .4byte 0x0203DC9C

	thumb_func_start sub_0804528C
sub_0804528C: @ 0x0804528C
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, _080452E8 @ =0x0203DC9C
	ldr r0, _080452EC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r1, _080452F0 @ =0x0203D90C
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080452F8
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
_080452BE:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080452DC
	ldr r0, _080452EC @ =0x08B98AEC
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _080452F4
_080452DC:
	adds r4, #1
	cmp r4, #3
	ble _080452BE
	movs r5, #3
	b _08045328
	.align 2, 0
_080452E8: .4byte 0x0203DC9C
_080452EC: .4byte 0x08B98AEC
_080452F0: .4byte 0x0203D90C
_080452F4:
	adds r0, r4, #0
	b _0804532A
_080452F8:
	movs r4, #0
	adds r6, r2, #0
_080452FC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804531E
	ldr r0, _08045330 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _0804531E
	ldr r0, [r6]
	cmp r7, r0
	bls _08045320
_0804531E:
	subs r5, #1
_08045320:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble _080452FC
_08045328:
	adds r0, r5, #0
_0804532A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045330: .4byte 0x08B98AEC

	thumb_func_start sub_08045334
sub_08045334: @ 0x08045334
	push {lr}
	ldr r0, _08045350 @ =0x08B961A8
	bl Proc_EndEach
	bl EndLinkArenaFogPlaceholders
	bl BMapVSync_End
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
_08045350: .4byte 0x08B961A8

	thumb_func_start sub_08045354
sub_08045354: @ 0x08045354
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, _08045384 @ =0x0203DC9C
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq _08045442
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0804538C
	ldr r0, _08045388 @ =0x08B99BC8
	adds r0, r4, r0
	b _080453C2
	.align 2, 0
_08045384: .4byte 0x0203DC9C
_08045388: .4byte 0x08B99BC8
_0804538C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080453A0
	ldr r1, _0804539C @ =0x08B99BC8
	adds r0, r4, #1
	b _080453C0
	.align 2, 0
_0804539C: .4byte 0x08B99BC8
_080453A0:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080453B4
	ldr r1, _080453B0 @ =0x08B99BC8
	adds r0, r4, #2
	b _080453C0
	.align 2, 0
_080453B0: .4byte 0x08B99BC8
_080453B4:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080453C4
	ldr r1, _08045420 @ =0x08B99BC8
	adds r0, r4, #3
_080453C0:
	adds r0, r0, r1
_080453C2:
	ldrb r2, [r0]
_080453C4:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne _080453D8
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080453D8
	movs r5, #1
	rsbs r5, r5, #0
_080453D8:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne _080453E8
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080453E8
	movs r5, #1
_080453E8:
	ldr r6, _08045424 @ =0x03001400
	mov r0, ip
	lsls r4, r0, #0x18
_080453EE:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r1, r0, #0x18
	cmp r1, #0
	beq _0804540C
	cmp r4, #0
	beq _08045440
	lsrs r1, r1, #0x1e
	ldr r0, _08045428 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045440
_0804540C:
	cmp r5, #0
	bge _0804542C
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _080453EE
	movs r2, #0x13
	b _080453EE
	.align 2, 0
_08045420: .4byte 0x08B99BC8
_08045424: .4byte 0x03001400
_08045428: .4byte 0x08B98AEC
_0804542C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _080453EE
_08045440:
	strb r2, [r7, #2]
_08045442:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08045448
sub_08045448: @ 0x08045448
	push {r4, r5, r6, r7, lr}
	ldr r6, _080454B4 @ =0x0203DC9C
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq _080454AE
	ldr r7, _080454B8 @ =0x03001400
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r1, [r6, #2]
	adds r0, r1, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq _0804547A
	bl EndAllMus
	adds r0, r5, #0
	bl ShowUnitSprite
_0804547A:
	cmp r4, #0
	beq _080454AE
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080454AE
	ldrb r6, [r6, #2]
	adds r0, r6, r7
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _080454BC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080454AE
	adds r0, r4, #0
	bl StartMu
	bl DisableMuCamera
	adds r0, r4, #0
	bl HideUnitSprite
_080454AE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080454B4: .4byte 0x0203DC9C
_080454B8: .4byte 0x03001400
_080454BC: .4byte 0x08B98AEC

	thumb_func_start sub_080454C0
sub_080454C0: @ 0x080454C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_080454C6:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080454F2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080454F2
	movs r0, #1
	b _080454FA
_080454F2:
	adds r5, #1
	cmp r5, #4
	ble _080454C6
	movs r0, #0
_080454FA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08045500
sub_08045500: @ 0x08045500
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08045534 @ =0x0203DC9C
	ldr r1, _08045538 @ =0x0203D90C
	adds r1, #0xa0
	ldrb r3, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldrb r2, [r2, #9]
	cmp r2, r0
	blt _08045528
	bl EndLinkArenaPointsBox
	ldr r0, _0804553C @ =0x08B99D3C
	bl sub_0800AF5C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_08045528:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045534: .4byte 0x0203DC9C
_08045538: .4byte 0x0203D90C
_0804553C: .4byte 0x08B99D3C

	thumb_func_start sub_08045540
sub_08045540: @ 0x08045540
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803CDB8
	cmp r0, #7
	bgt _08045552
	adds r0, r4, #0
	bl Proc_Break
_08045552:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08045558
sub_08045558: @ 0x08045558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08045640 @ =0x081D5501
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, _08045644 @ =0x0203DC9C
	mov sb, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl sub_08045448
	ldr r4, _08045648 @ =0x08B857F8
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl sub_08045354
	ldr r2, _0804564C @ =0x0202BD48
	mov r8, r2
	ldr r0, _08045650 @ =0x03001400
	mov r3, sb
	ldrb r3, [r3, #2]
	adds r0, r3, r0
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, _08045654 @ =0x03004690
	str r2, [r7]
	ldr r1, [r4]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804567C
	mov r0, r8
	ldrb r0, [r0]
	lsrs r1, r0, #6
	ldr r0, _08045658 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08045668
	adds r0, r2, #0
	bl sub_080454C0
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _08045668
	ldr r0, _0804565C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080455E4
	ldr r0, _08045660 @ =0x00000389
	bl m4aSongNumStart
_080455E4:
	bl EndAllMus
	ldr r0, [r7]
	bl StartMu
	ldr r4, _08045664 @ =0x03001420
	str r0, [r4]
	bl DisableMuCamera
	ldr r0, [r4]
	mov r1, sp
	bl SetMuMoveScript
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl sub_08044B24
	mov r1, sb
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl sub_08045354
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_08045640: .4byte 0x081D5501
_08045644: .4byte 0x0203DC9C
_08045648: .4byte 0x08B857F8
_0804564C: .4byte 0x0202BD48
_08045650: .4byte 0x03001400
_08045654: .4byte 0x03004690
_08045658: .4byte 0x08B98AEC
_0804565C: .4byte 0x0202BBF8
_08045660: .4byte 0x00000389
_08045664: .4byte 0x03001420
_08045668:
	ldr r0, _080456AC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804567C
	movs r0, #0xe3
	lsls r0, r0, #2
	bl m4aSongNumStart
_0804567C:
	ldr r2, _080456B0 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080456B8
	ldr r0, _080456B4 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080456B8
	bl EndAllMus
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_080456AC: .4byte 0x0202BBF8
_080456B0: .4byte 0x08B857F8
_080456B4: .4byte 0x03004690
_080456B8:
	ldr r1, [r2]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080456F4
	bl EndLinkArenaPointsBox
	ldr r0, _080456EC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080456E2
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _080456F0 @ =0x08B99D20
	bl sub_0800AF5C
_080456E2:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _0804575A
	.align 2, 0
_080456EC: .4byte 0x0202BBF8
_080456F0: .4byte 0x08B99D20
_080456F4:
	ldr r0, _0804576C @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r6, _08045770 @ =0x03001418
	ldr r1, [r6]
	cmp r0, r1
	bne _0804572A
	ldr r0, _08045774 @ =0x03001414
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_0804572A:
	ldr r0, _08045774 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r0, _08045778 @ =0x0203DC9C
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq _0804575A
	ldr r0, _0804577C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804575A
	ldr r0, _08045780 @ =0x00000385
	bl m4aSongNumStart
_0804575A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804576C: .4byte 0x03004690
_08045770: .4byte 0x03001418
_08045774: .4byte 0x03001414
_08045778: .4byte 0x0203DC9C
_0804577C: .4byte 0x0202BBF8
_08045780: .4byte 0x00000385

	thumb_func_start sub_08045784
sub_08045784: @ 0x08045784
	push {lr}
	bl StartLinkArenaPointsBox
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08045790
sub_08045790: @ 0x08045790
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0804586C @ =0x0203DC9C
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, _08045870 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl sub_08045354
	ldr r2, _08045874 @ =0x0202BD48
	mov sl, r2
	ldr r0, _08045878 @ =0x03001400
	mov sb, r0
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, _0804587C @ =0x03004690
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetMapCursorPosition
	bl GetGameTime
	subs r0, #1
	ldr r7, _08045880 @ =0x03001418
	ldr r1, [r7]
	cmp r0, r1
	bne _080457FC
	ldr r0, _08045884 @ =0x03001414
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_080457FC:
	ldr r0, _08045884 @ =0x03001414
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameTime
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl PutMapCursor
	ldr r2, _08045870 @ =0x08B857F8
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045890
	ldr r0, _08045888 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045832
	ldr r0, _0804588C @ =0x00000389
	bl m4aSongNumStart
_08045832:
	ldrb r0, [r6, #2]
	add r0, sb
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_08044C10
	ldrb r0, [r6, #5]
	add r0, sb
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl sub_08044B98
	bl EndLinkArenaPointsBox
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b _08045944
	.align 2, 0
_0804586C: .4byte 0x0203DC9C
_08045870: .4byte 0x08B857F8
_08045874: .4byte 0x0202BD48
_08045878: .4byte 0x03001400
_0804587C: .4byte 0x03004690
_08045880: .4byte 0x03001418
_08045884: .4byte 0x03001414
_08045888: .4byte 0x0202BBF8
_0804588C: .4byte 0x00000389
_08045890:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080458FC
	ldr r0, _080458F0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080458AA
	ldr r0, _080458F4 @ =0x0000038B
	bl m4aSongNumStart
_080458AA:
	ldr r0, _080458F8 @ =0x03001420
	ldr r0, [r0]
	bl EndMu
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	bl sub_08044B24
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, sb
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl sub_08044B98
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _08045944
	.align 2, 0
_080458F0: .4byte 0x0202BBF8
_080458F4: .4byte 0x0000038B
_080458F8: .4byte 0x03001420
_080458FC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045928
	ldr r1, _08045924 @ =0x03004690
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045928
	bl EndAllMus
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b _08045944
	.align 2, 0
_08045924: .4byte 0x03004690
_08045928:
	ldr r0, _08045954 @ =0x0203DC9C
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq _08045944
	ldr r0, _08045958 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045944
	ldr r0, _0804595C @ =0x00000385
	bl m4aSongNumStart
_08045944:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045954: .4byte 0x0203DC9C
_08045958: .4byte 0x0202BBF8
_0804595C: .4byte 0x00000385

	thumb_func_start sub_08045960
sub_08045960: @ 0x08045960
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r1, _080459A0 @ =0x0203DC9C
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, _080459A4 @ =0x03001400
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, _080459A8 @ =0x03004690
	str r0, [r1]
	bl sub_08044AEC
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl ApplyIconPalettes
	ldr r0, _080459AC @ =0x08B9A7B8
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080459A0: .4byte 0x0203DC9C
_080459A4: .4byte 0x03001400
_080459A8: .4byte 0x03004690
_080459AC: .4byte 0x08B9A7B8

	thumb_func_start sub_080459B0
sub_080459B0: @ 0x080459B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080459E2
	ldr r0, _080459E8 @ =0x0203DC9C
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _080459DC
	ldr r0, _080459EC @ =0x03004690
	ldr r0, [r0]
	bl sub_08044B08
	adds r0, r5, #0
	bl Proc_End
_080459DC:
	adds r0, r5, #0
	bl Proc_Break
_080459E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080459E8: .4byte 0x0203DC9C
_080459EC: .4byte 0x03004690

	thumb_func_start sub_080459F0
sub_080459F0: @ 0x080459F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08045A28 @ =0x03004690
	ldr r0, [r0]
	ldr r6, _08045A2C @ =0x0203DC9C
	ldrb r2, [r6, #7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _08045A30
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _08045A30
	strb r0, [r6, #6]
	b _08045AB2
	.align 2, 0
_08045A28: .4byte 0x03004690
_08045A2C: .4byte 0x0203DC9C
_08045A30:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne _08045A50
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne _08045A50
	ldr r0, _08045A4C @ =0x0203DC9C
	strb r1, [r0, #6]
	b _08045AB2
	.align 2, 0
_08045A4C: .4byte 0x0203DC9C
_08045A50:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne _08045A70
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne _08045A70
	ldr r0, _08045A6C @ =0x0203DC9C
	strb r4, [r0, #6]
	b _08045AB2
	.align 2, 0
_08045A6C: .4byte 0x0203DC9C
_08045A70:
	ldr r0, _08045A90 @ =0x03001400
	ldr r4, _08045A94 @ =0x0203DC9C
	ldrb r1, [r4, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08045A98
	movs r0, #1
	strb r0, [r4, #6]
	b _08045AB2
	.align 2, 0
_08045A90: .4byte 0x03001400
_08045A94: .4byte 0x0203DC9C
_08045A98:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _08045AA8
	movs r0, #2
	strb r0, [r4, #6]
	b _08045AB2
_08045AA8:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl ApplyIconPalettes
_08045AB2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08045AB8
sub_08045AB8: @ 0x08045AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, _08045B40 @ =0x03001400
	ldr r2, _08045B44 @ =0x0203DC9C
	mov r8, r2
	ldrb r1, [r2, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov sb, r0
	mov r2, r8
	ldrb r2, [r2, #5]
	adds r4, r2, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08045BB6
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, _08045B48 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08045B24
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [sp, #4]
_08045B24:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08045B50
	ldr r0, _08045B4C @ =0x03004690
	ldr r0, [r0]
	bl sub_08044B08
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b _08045BB6
	.align 2, 0
_08045B40: .4byte 0x03001400
_08045B44: .4byte 0x0203DC9C
_08045B48: .4byte 0x0202E3E0
_08045B4C: .4byte 0x03004690
_08045B50:
	ldr r7, _08045BA4 @ =0x03004690
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl UnitEquipItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne _08045BA8
	adds r0, r6, #0
	bl StartFightPreview
	mov r0, r8
	ldrb r0, [r0, #6]
	cmp r0, #2
	bne _08045B7A
	movs r1, #1
	mov sl, r1
_08045B7A:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, sb
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl UpdateBattleForecastContents
	ldr r0, [r7]
	bl sub_08044B08
	adds r0, r6, #0
	bl Proc_Break
	b _08045BB6
	.align 2, 0
_08045BA4: .4byte 0x03004690
_08045BA8:
	ldr r0, [r7]
	bl sub_08044B08
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_08045BB6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08045BC8
sub_08045BC8: @ 0x08045BC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045BF8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045C04
	ldr r0, _08045BFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045BEC
	ldr r0, _08045C00 @ =0x0000038A
	bl m4aSongNumStart
_08045BEC:
	bl CloseBattleForecast
	adds r0, r4, #0
	bl Proc_Break
	b _08045C2A
	.align 2, 0
_08045BF8: .4byte 0x08B857F8
_08045BFC: .4byte 0x0202BBF8
_08045C00: .4byte 0x0000038A
_08045C04:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08045C2A
	ldr r0, _08045C30 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045C1E
	ldr r0, _08045C34 @ =0x0000038B
	bl m4aSongNumStart
_08045C1E:
	bl CloseBattleForecast
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08045C2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045C30: .4byte 0x0202BBF8
_08045C34: .4byte 0x0000038B

	thumb_func_start sub_08045C38
sub_08045C38: @ 0x08045C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045C50 @ =0x08B99C18
	adds r1, r4, #0
	bl SpawnProcLocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045C50: .4byte 0x08B99C18

	thumb_func_start sub_08045C54
sub_08045C54: @ 0x08045C54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08045C88 @ =0x03001400
	ldr r6, _08045C8C @ =0x0203DC9C
	ldrb r1, [r6, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearUi
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _08045CE0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08045C94
	ldr r0, _08045C90 @ =0x03001420
	ldr r0, [r0, #4]
	bl EndMu
	b _08045C9C
	.align 2, 0
_08045C88: .4byte 0x03001400
_08045C8C: .4byte 0x0203DC9C
_08045C90: .4byte 0x03001420
_08045C94:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
_08045C9C:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	ldr r1, _08045CD8 @ =0x0203DC9C
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _08045CDC @ =0x03001400
	ldrb r1, [r1, #5]
	adds r0, r1, r0
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl sub_08044B98
	adds r0, r5, #0
	bl sub_08045784
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08045D16
	.align 2, 0
_08045CD8: .4byte 0x0203DC9C
_08045CDC: .4byte 0x03001400
_08045CE0:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08045D0A
	adds r0, r4, #0
	bl StartMu
	ldr r1, _08045D1C @ =0x03001420
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, _08045D20 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
_08045D0A:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl sub_08044B98
_08045D16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045D1C: .4byte 0x03001420
_08045D20: .4byte 0xFFFFFDFF

	thumb_func_start sub_08045D24
sub_08045D24: @ 0x08045D24
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _08045D9C @ =0x03001400
	ldr r5, _08045DA0 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0x2c]
	movs r1, #0
	mov sb, r1
	mov r1, r8
	strb r0, [r1, #0x10]
	ldr r0, [r6, #0x30]
	strb r0, [r1, #0x11]
	ldr r0, [r6, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r6, #0x38]
	strb r0, [r4, #0x11]
	ldr r5, _08045DA4 @ =0x03001420
	ldr r1, [r5]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, r8
	movs r2, #6
	movs r3, #5
	bl sub_08047A00
	ldr r1, [r5, #4]
	mov r0, sb
	str r0, [sp]
	str r0, [sp, #4]
	str r6, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl sub_08047A00
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045D9C: .4byte 0x03001400
_08045DA0: .4byte 0x0203DC9C
_08045DA4: .4byte 0x03001420

	thumb_func_start sub_08045DA8
sub_08045DA8: @ 0x08045DA8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r4, _08045E04 @ =0x03001400
	ldr r5, _08045E08 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, _08045E0C @ =0x081D5503
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, _08045E10 @ =0x03001420
	ldr r0, [r6, #4]
	bl EndMu
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, _08045E14 @ =0x0300141C
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08045DF6
	ldr r0, [r6]
	mov r1, sp
	bl SetMuMoveScript
	movs r0, #7
	strb r0, [r7, #0x10]
_08045DF6:
	bl sub_08044B24
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045E04: .4byte 0x03001400
_08045E08: .4byte 0x0203DC9C
_08045E0C: .4byte 0x081D5503
_08045E10: .4byte 0x03001420
_08045E14: .4byte 0x0300141C

	thumb_func_start sub_08045E18
sub_08045E18: @ 0x08045E18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08045E86
	ldr r4, _08045E90 @ =0x03001400
	ldr r5, _08045E94 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r2, [r5, #5]
	adds r0, r2, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSprite
	ldr r1, _08045E98 @ =0x0203A85C
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	strb r0, [r1, #0xd]
	ldr r0, _08045E9C @ =0x0300141C
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl UnitEquipItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r1, _08045EA0 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r2, [r1, #4]
	orrs r0, r2
	strb r0, [r1, #4]
	ldr r0, _08045EA4 @ =0x08B9A188
	adds r1, r7, #0
	bl SpawnProcLocking
	adds r0, r7, #0
	bl Proc_Break
_08045E86:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045E90: .4byte 0x03001400
_08045E94: .4byte 0x0203DC9C
_08045E98: .4byte 0x0203A85C
_08045E9C: .4byte 0x0300141C
_08045EA0: .4byte 0x0202BBB8
_08045EA4: .4byte 0x08B9A188

	thumb_func_start sub_08045EA8
sub_08045EA8: @ 0x08045EA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, _08045F94 @ =0x03001400
	ldr r1, _08045F98 @ =0x0203DC9C
	mov r8, r1
	ldrb r2, [r1, #4]
	adds r1, r2, r0
	ldrb r4, [r1]
	mov r3, r8
	ldrb r3, [r3, #5]
	adds r0, r3, r0
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl LoadLinkArenaFogPlaceholder
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, _08045F9C @ =0x0203A3F0
	mov sb, r1
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, _08045FA0 @ =0x0203A470
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl sub_08048E0C
	adds r0, r7, #0
	bl sub_08048E0C
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl EndAllMus
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	beq _08045F54
	adds r0, r6, #0
	bl ShowUnitSprite
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
_08045F54:
	bl sub_08044B24
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	bl GetUnitCurrentHp
	mov r1, sb
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _08045FA4
	adds r0, r7, #0
	bl GetUnitCurrentHp
	adds r1, r4, #0
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _08045FA4
	mov r2, r8
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
	b _08045FAA
	.align 2, 0
_08045F94: .4byte 0x03001400
_08045F98: .4byte 0x0203DC9C
_08045F9C: .4byte 0x0203A3F0
_08045FA0: .4byte 0x0203A470
_08045FA4:
	ldr r1, _08045FC0 @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #9]
_08045FAA:
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045FC0: .4byte 0x0203DC9C

	thumb_func_start sub_08045FC4
sub_08045FC4: @ 0x08045FC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, _08046030 @ =0x03001400
	ldr r0, _08046034 @ =0x0203DC9C
	mov sl, r0
	ldrb r2, [r0, #4]
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r3, sl
	ldrb r3, [r3, #5]
	adds r1, r3, r1
	ldrb r1, [r1]
	mov sb, r1
	bl GetUnit
	adds r4, r0, #0
	mov r0, sb
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl sub_08044BF0
	str r0, [sp, #0x10]
	mov r0, sb
	bl sub_08044BF0
	str r0, [sp, #0x14]
	ldr r6, _08046038 @ =0x03001420
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, _0804603C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046020
	ldr r0, [r4]
	cmp r0, #0
	bne _08046040
_08046020:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b _08046078
	.align 2, 0
_08046030: .4byte 0x03001400
_08046034: .4byte 0x0203DC9C
_08046038: .4byte 0x03001420
_0804603C: .4byte 0x00010004
_08046040:
	adds r0, r4, #0
	bl StartMu
	str r0, [r6]
	bl DisableMuCamera
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, _080460A0 @ =0x081D5490
	ldr r5, [sp, #0x10]
	lsls r0, r5, #2
	adds r0, r0, r2
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_08047A00
_08046078:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, _080460A4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804608C
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne _080460AC
_0804608C:
	ldr r0, _080460A8 @ =0x0203DC9C
	mov r3, sb
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _080460F0
	.align 2, 0
_080460A0: .4byte 0x081D5490
_080460A4: .4byte 0x00010004
_080460A8: .4byte 0x0203DC9C
_080460AC:
	mov r0, r8
	bl StartMu
	ldr r4, _0804610C @ =0x03001420
	str r0, [r4, #4]
	bl DisableMuCamera
	mov r5, r8
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne _080460CE
	movs r7, #1
_080460CE:
	ldr r1, [r4, #4]
	ldr r2, _08046110 @ =0x081D5490
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl sub_08047A00
_080460F0:
	bl sub_08044B24
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804610C: .4byte 0x03001420
_08046110: .4byte 0x081D5490

	thumb_func_start sub_08046114
sub_08046114: @ 0x08046114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
_0804611E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq _08046184
	movs r6, #0
	movs r7, #0
	ldr r0, _08046198 @ =0x03001400
	adds r4, r3, r0
	movs r5, #4
_0804613E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804616C
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804619C @ =0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne _0804616C
	adds r0, r2, #0
	bl sub_080454C0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne _0804616C
	adds r6, #1
_0804616C:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge _0804613E
	cmp r6, #0
	bne _08046184
	cmp r7, #0
	beq _08046184
	ldr r0, _080461A0 @ =0x0203DC9C
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
_08046184:
	mov r3, r8
	cmp r3, #3
	ble _0804611E
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046198: .4byte 0x03001400
_0804619C: .4byte 0x00010004
_080461A0: .4byte 0x0203DC9C

	thumb_func_start sub_080461A4
sub_080461A4: @ 0x080461A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _08046248 @ =0x03001400
	ldr r5, _0804624C @ =0x0203DC9C
	ldrb r2, [r5, #4]
	adds r1, r2, r0
	ldrb r6, [r1]
	ldrb r1, [r5, #5]
	adds r0, r1, r0
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, _08046250 @ =0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080461E0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r4, #0xc]
_080461E0:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _080461F2
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	str r1, [r2, #0xc]
_080461F2:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _0804620E
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804626A
_0804620E:
	adds r4, r1, #0
	ldr r2, _0804624C @ =0x0203DC9C
	ldr r3, _08046254 @ =0x0203D90C
	adds r3, #0xa0
	ldrb r6, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r6, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804626A
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046258
	adds r4, r1, #0
	b _0804625A
	.align 2, 0
_08046248: .4byte 0x03001400
_0804624C: .4byte 0x0203DC9C
_08046250: .4byte 0x00010004
_08046254: .4byte 0x0203D90C
_08046258:
	lsrs r4, r7, #6
_0804625A:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl sub_08044B34
	mov r0, r8
	bl Proc_Break
	b _08046278
_0804626A:
	ldr r0, _08046284 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	bl sub_08044B34
	mov r0, r8
	bl Proc_Break
_08046278:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046284: .4byte 0x0202BBF8

	thumb_func_start sub_08046288
sub_08046288: @ 0x08046288
	push {lr}
	bl EndAllMus
	bl EndAllMus
	bl sub_08044DCC
	bl sub_08044E2C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080462A4
sub_080462A4: @ 0x080462A4
	push {lr}
	ldr r0, _080462D0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080462CC
	ldr r0, _080462D4 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd4
	strb r1, [r0]
	ldr r1, _080462D8 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
_080462CC:
	pop {r0}
	bx r0
	.align 2, 0
_080462D0: .4byte 0x08B857F8
_080462D4: .4byte 0x0300479C
_080462D8: .4byte 0x08B98AEC

	thumb_func_start sub_080462DC
sub_080462DC: @ 0x080462DC
	ldrb r0, [r0]
	cmp r0, #1
	beq _080462EE
	cmp r0, #1
	blt _080462F2
	cmp r0, #7
	bgt _080462F2
	cmp r0, #6
	blt _080462F2
_080462EE:
	movs r0, #1
	b _080462F4
_080462F2:
	movs r0, #0
_080462F4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080462F8
sub_080462F8: @ 0x080462F8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08046320 @ =0x0300141C
	ldr r2, _08046324 @ =sub_080462DC
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080463A4
	ldrb r0, [r4]
	cmp r0, #6
	beq _08046350
	cmp r0, #6
	bgt _08046328
	cmp r0, #1
	beq _0804632E
	b _080463A4
	.align 2, 0
_08046320: .4byte 0x0300141C
_08046324: .4byte sub_080462DC
_08046328:
	cmp r0, #7
	beq _0804638C
	b _080463A4
_0804632E:
	ldrb r0, [r4, #1]
	ldr r2, _0804634C @ =0x0203DCA0
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl sub_08044C10
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080463A4
	.align 2, 0
_0804634C: .4byte 0x0203DCA0
_08046350:
	bl EndLinkArenaPointsBox
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	subs r0, r0, r1
	ldr r1, _08046380 @ =0x0203D9AD
	adds r0, r0, r1
	ldr r1, _08046384 @ =0x03001438
	bl SioStrCpy
	ldr r0, _08046388 @ =0x08B99C68
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080463A4
	.align 2, 0
_08046380: .4byte 0x0203D9AD
_08046384: .4byte 0x03001438
_08046388: .4byte 0x08B99C68
_0804638C:
	bl EndLinkArenaPointsBox
	ldr r0, _080463B0 @ =0x08B99C88
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopup_Simple
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080463A4:
	bl sub_080462A4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080463B0: .4byte 0x08B99C88

	thumb_func_start sub_080463B4
sub_080463B4: @ 0x080463B4
	ldrb r0, [r0]
	cmp r0, #3
	bgt _080463C2
	cmp r0, #2
	blt _080463C2
	movs r0, #1
	b _080463C4
_080463C2:
	movs r0, #0
_080463C4:
	bx lr
	.align 2, 0

	thumb_func_start sub_080463C8
sub_080463C8: @ 0x080463C8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _080463EC @ =0x0300141C
	ldr r2, _080463F0 @ =sub_080463B4
	adds r0, r4, #0
	add r1, sp, #4
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046454
	ldrb r0, [r4]
	cmp r0, #2
	beq _080463F4
	cmp r0, #3
	beq _08046438
	b _08046454
	.align 2, 0
_080463EC: .4byte 0x0300141C
_080463F0: .4byte sub_080463B4
_080463F4:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08046418
	ldr r0, _08046414 @ =0x03001420
	ldr r0, [r0]
	bl EndMu
	b _08046420
	.align 2, 0
_08046414: .4byte 0x03001420
_08046418:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
_08046420:
	ldr r0, [r4, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshUnitSprites
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08046454
_08046438:
	ldrb r0, [r4, #1]
	ldr r2, _08046460 @ =0x0203DCA1
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_08044C10
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_08046454:
	bl sub_080462A4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08046460: .4byte 0x0203DCA1

	thumb_func_start sub_08046464
sub_08046464: @ 0x08046464
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl StartMu
	ldr r1, _080464A0 @ =0x03001420
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, _080464A4 @ =0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080464A0: .4byte 0x03001420
_080464A4: .4byte 0xFFFFFDFF

	thumb_func_start sub_080464A8
sub_080464A8: @ 0x080464A8
	ldrb r0, [r0]
	cmp r0, #5
	bgt _080464B6
	cmp r0, #4
	blt _080464B6
	movs r0, #1
	b _080464B8
_080464B6:
	movs r0, #0
_080464B8:
	bx lr
	.align 2, 0

	thumb_func_start sub_080464BC
sub_080464BC: @ 0x080464BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _080464E0 @ =0x0300141C
	ldr r2, _080464E4 @ =sub_080464A8
	adds r0, r4, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046582
	ldrb r0, [r4]
	cmp r0, #4
	beq _080464E8
	cmp r0, #5
	beq _0804652C
	b _08046582
	.align 2, 0
_080464E0: .4byte 0x0300141C
_080464E4: .4byte sub_080464A8
_080464E8:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804650C
	ldr r0, _08046508 @ =0x03001420
	ldr r0, [r0, #4]
	bl EndMu
	b _08046514
	.align 2, 0
_08046508: .4byte 0x03001420
_0804650C:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
_08046514:
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
	bl RefreshUnitSprites
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08046582
_0804652C:
	ldr r4, _08046590 @ =0x03001400
	ldr r5, _08046594 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _08046564
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl sub_08046464
_08046564:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804657C
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl sub_08046464
_0804657C:
	adds r0, r7, #0
	bl Proc_Break
_08046582:
	bl sub_080462A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046590: .4byte 0x03001400
_08046594: .4byte 0x0203DC9C

	thumb_func_start sub_08046598
sub_08046598: @ 0x08046598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _080465E4
_080465AE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080465D0
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls _080465D0
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
_080465D0:
	adds r5, #1
	cmp r5, #4
	bgt _080465E4
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080465AE
_080465E4:
	cmp r7, #0
	beq _080465F2
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b _080465F4
_080465F2:
	movs r0, #0
_080465F4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08046600
sub_08046600: @ 0x08046600
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge _0804664A
_08046616:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _0804666C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046642
	ldr r0, [r4]
	cmp r0, #0
	beq _08046642
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl sub_08046598
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
_08046642:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt _08046616
_0804664A:
	ldr r0, _08046670 @ =0x0203DC9C
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804666C: .4byte 0x00010004
_08046670: .4byte 0x0203DC9C

	thumb_func_start sub_08046674
sub_08046674: @ 0x08046674
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080466B4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _080466C0
	bl EndLinkArenaPointsBox
	str r4, [r5, #0x58]
	ldr r0, _080466B8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080466A8
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
	ldr r0, _080466BC @ =0x08B99D20
	bl sub_0800AF5C
_080466A8:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	movs r0, #1
	b _080466C2
	.align 2, 0
_080466B4: .4byte 0x08B857F8
_080466B8: .4byte 0x0202BBF8
_080466BC: .4byte 0x08B99D20
_080466C0:
	movs r0, #0
_080466C2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080466C8
sub_080466C8: @ 0x080466C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	rsbs r6, r6, #0
	movs r1, #0
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046720
	movs r4, #0
_080466E0:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046714
	ldr r5, _08046728 @ =0x0203DC9C
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046714
	ldr r0, _0804672C @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq _08046714
	lsls r0, r4, #6
	adds r0, #1
	bl sub_08046600
	cmp r6, r0
	bls _08046714
	adds r6, r0, #0
	strb r4, [r5, #2]
_08046714:
	adds r4, #1
	cmp r4, #3
	ble _080466E0
	adds r0, r7, #0
	bl Proc_Break
_08046720:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046728: .4byte 0x0203DC9C
_0804672C: .4byte 0x0202BBF8

	thumb_func_start ITEMRANGEDONE_sub_804AF2C
ITEMRANGEDONE_sub_804AF2C: @ 0x08046730
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq _08046754
	bl GetItemMaxRange
	cmp r0, #1
	beq _08046754
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt _08046758
_08046754:
	movs r0, #1
	b _0804675A
_08046758:
	movs r0, #2
_0804675A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08046760
sub_08046760: @ 0x08046760
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804678C
	b _0804697A
_0804678C:
	ldr r0, _080468CC @ =0x0203A8EC
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, _080468D0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt _080467B4
	b _0804695C
_080467B4:
	ldr r0, _080468D4 @ =0x0202BD48
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, _080468D8 @ =0x03004690
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _080468DC @ =0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq _080467DA
	b _08046952
_080467DA:
	ldr r0, [r2]
	cmp r0, #0
	bne _080467E2
	b _08046952
_080467E2:
	movs r5, #0
_080467E4:
	ldr r0, _080468D8 @ =0x03004690
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne _080467FE
	b _0804694A
_080467FE:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804680E
	b _0804694A
_0804680E:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _08046820
	b _0804694A
_08046820:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _08046830
	b _0804694A
_08046830:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804683E
	movs r0, #2
	mov r8, r0
_0804683E:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _08046850
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_08046850:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, _080468E0 @ =0x0203DC9C
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov sb, r0
	mov r5, sb
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge _0804694A
	add r6, sp, #4
	ldr r7, _080468E4 @ =0x0300141C
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
_08046876:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, _080468DC @ =0x00010004
	ands r1, r0
	cmp r1, #0
	bne _08046940
	ldr r0, [r4]
	cmp r0, #0
	beq _08046940
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _080468F0
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi _080468F0
	str r0, [sp, #0x18]
	ldr r0, _080468D4 @ =0x0202BD48
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne _080468E8
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	b _080468EA
	.align 2, 0
_080468CC: .4byte 0x0203A8EC
_080468D0: .4byte 0x0202BBF8
_080468D4: .4byte 0x0202BD48
_080468D8: .4byte 0x03004690
_080468DC: .4byte 0x00010004
_080468E0: .4byte 0x0203DC9C
_080468E4: .4byte 0x0300141C
_080468E8:
	movs r0, #1
_080468EA:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
_080468F0:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08046940
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl AiSimulateBattleAgainstTargetAtPosition
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi _08046940
	str r0, [sp, #0x18]
	ldr r0, _08046934 @ =0x0202BD48
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne _08046938
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	strb r0, [r7, #2]
	b _0804693C
	.align 2, 0
_08046934: .4byte 0x0202BD48
_08046938:
	movs r1, #2
	strb r1, [r7, #2]
_0804693C:
	mov r2, sl
	strb r2, [r7, #3]
_08046940:
	adds r5, #1
	mov r0, sb
	adds r0, #6
	cmp r5, r0
	blt _08046876
_0804694A:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt _08046952
	b _080467E4
_08046952:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge _0804695C
	b _080467B4
_0804695C:
	ldr r2, _0804698C @ =0x0203DCA0
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl sub_08044C10
	ldr r0, _08046990 @ =0x0300141C
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
_0804697A:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804698C: .4byte 0x0203DCA0
_08046990: .4byte 0x0300141C

	thumb_func_start sub_08046994
sub_08046994: @ 0x08046994
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080469C0 @ =0x0300141C
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl StartAiTargetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080469C0: .4byte 0x0300141C

	thumb_func_start sub_080469C4
sub_080469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08046A48 @ =0x0300141C
	ldrb r0, [r0, #1]
	ldr r5, _08046A4C @ =0x0203DCA1
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov sb, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r5, #0
	mov r3, r8
	bl sub_08044C10
	ldr r4, _08046A50 @ =0x03001400
	subs r5, #5
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _08046A26
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl sub_08046464
_08046A26:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _08046A3A
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, sb
	bl sub_08046464
_08046A3A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046A48: .4byte 0x0300141C
_08046A4C: .4byte 0x0203DCA1
_08046A50: .4byte 0x03001400

	thumb_func_start sub_08046A54
sub_08046A54: @ 0x08046A54
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046A76
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08046A76
	adds r0, r4, #0
	bl Proc_Break
_08046A76:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08046A7C
sub_08046A7C: @ 0x08046A7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl GetGameTime
	ldr r2, _08046B34 @ =0x08B99C98
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	mov sl, r0
	movs r7, #0
_08046A9C:
	ldr r0, _08046B38 @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08046B3C @ =0x081D5470
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov sb, r1
	cmp r0, #0
	beq _08046B1E
	movs r6, #0
	lsls r0, r7, #2
	mov r8, r0
_08046AC4:
	mov r1, r8
	adds r0, r1, r7
	adds r0, r0, r6
	ldr r1, _08046B40 @ =0x03001400
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08046B18
	ldr r0, [r2]
	cmp r0, #0
	beq _08046B18
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08046B18
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r2, r4]
	lsls r4, r4, #4
	mov r0, sl
	subs r4, r4, r0
	adds r0, r2, #0
	bl GetUnitDisplayedSpritePalette
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0xa4
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, _08046B44 @ =0x08B905B8
	bl PutOamHiRam
_08046B18:
	adds r6, #1
	cmp r6, #4
	ble _08046AC4
_08046B1E:
	mov r7, sb
	cmp r7, #3
	ble _08046A9C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046B34: .4byte 0x08B99C98
_08046B38: .4byte 0x08B98AEC
_08046B3C: .4byte 0x081D5470
_08046B40: .4byte 0x03001400
_08046B44: .4byte 0x08B905B8

	thumb_func_start sub_08046B48
sub_08046B48: @ 0x08046B48
	push {lr}
	ldr r0, _08046B58 @ =0x08B99CB8
	movs r1, #4
	bl SpawnProc
	pop {r0}
	bx r0
	.align 2, 0
_08046B58: .4byte 0x08B99CB8

	thumb_func_start EndLinkArenaFogPlaceholders
EndLinkArenaFogPlaceholders: @ 0x08046B5C
	push {lr}
	ldr r0, _08046B68 @ =0x08B99CB8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08046B68: .4byte 0x08B99CB8

	thumb_func_start sub_08046B6C
sub_08046B6C: @ 0x08046B6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl SetStatScreenExcludedUnitFlags
	ldr r0, _08046B88 @ =0x03004690
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046B88: .4byte 0x03004690

	thumb_func_start sub_08046B8C
sub_08046B8C: @ 0x08046B8C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046BA4 @ =0x0203DC9C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08046BA8
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _08046BBA
	.align 2, 0
_08046BA4: .4byte 0x0203DC9C
_08046BA8:
	bl EndAllMus
	ldr r0, _08046BC0 @ =0x0202BBF8
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
_08046BBA:
	pop {r0}
	bx r0
	.align 2, 0
_08046BC0: .4byte 0x0202BBF8

	thumb_func_start sub_08046BC4
sub_08046BC4: @ 0x08046BC4
	push {lr}
	ldr r2, _08046BD8 @ =0x0203DC9C
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne _08046BDC
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b _08046BEE
	.align 2, 0
_08046BD8: .4byte 0x0203DC9C
_08046BDC:
	bl EndAllMus
	ldr r0, _08046BF4 @ =0x0202BBF8
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
_08046BEE:
	pop {r0}
	bx r0
	.align 2, 0
_08046BF4: .4byte 0x0202BBF8

	thumb_func_start sub_08046BF8
sub_08046BF8: @ 0x08046BF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046C10 @ =0x0203DC9C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08046C14
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b _08046C30
	.align 2, 0
_08046C10: .4byte 0x0203DC9C
_08046C14:
	bl EndAllMus
	bl EndAllMus
	ldr r1, _08046C38 @ =0x0203D90C
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08046C30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046C38: .4byte 0x0203D90C

	thumb_func_start sub_08046C3C
sub_08046C3C: @ 0x08046C3C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _08046C50 @ =0x0203D90C
	ldrb r0, [r1]
	cmp r0, #1
	bne _08046C54
	strb r0, [r1, #0xb]
	b _08046CA6
	.align 2, 0
_08046C50: .4byte 0x0203D90C
_08046C54:
	ldr r2, _08046CB8 @ =0x0203DC9C
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _08046CBC @ =0x0202BBF8
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _08046CC0
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge _08046CA4
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_08046C94:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046C9E
	adds r6, r1, #0
_08046C9E:
	adds r1, #1
	cmp r1, r3
	blt _08046C94
_08046CA4:
	strb r6, [r2, #0xf]
_08046CA6:
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _08046CCE
	.align 2, 0
_08046CB8: .4byte 0x0203DC9C
_08046CBC: .4byte 0x0202BBF8
_08046CC0:
	ldrb r0, [r3, #0xf]
	bl sub_08044B34
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_08046CCE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08046CD4
sub_08046CD4: @ 0x08046CD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08046CF4 @ =0x0203D90C
	ldrb r0, [r1]
	cmp r0, #1
	bne _08046CF8
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _08046D0A
	.align 2, 0
_08046CF4: .4byte 0x0203D90C
_08046CF8:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
_08046D0A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_08046D10
sub_08046D10: @ 0x08046D10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _08046D7C @ =0x0203DC9C
	ldr r0, _08046D80 @ =0x0203D90C
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r0, [r4]
	ldrb r3, [r2, #0xe]
	subs r1, r0, r3
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _08046D84 @ =0x0202BBF8
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r1, [r3, #0xf]
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _08046D88
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge _08046D68
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_08046D58:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046D62
	adds r5, r1, #0
_08046D62:
	adds r1, #1
	cmp r1, r3
	blt _08046D58
_08046D68:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08046D96
	.align 2, 0
_08046D7C: .4byte 0x0203DC9C
_08046D80: .4byte 0x0203D90C
_08046D84: .4byte 0x0202BBF8
_08046D88:
	ldrb r0, [r3, #0xf]
	bl sub_08044B34
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
_08046D96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_08046D9C
sub_08046D9C: @ 0x08046D9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08046DBC @ =0x0203D90C
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DBC: .4byte 0x0203D90C

	thumb_func_start sub_08046DC0
sub_08046DC0: @ 0x08046DC0
	push {r4, lr}
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, _08046DE0 @ =0x0202BBF8
	ldrb r4, [r2, #0xf]
	lsls r1, r4, #6
	str r1, [r0, #0x5c]
	ldr r0, _08046DE4 @ =0x0203DC9C
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r2, r0
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DE0: .4byte 0x0202BBF8
_08046DE4: .4byte 0x0203DC9C

	thumb_func_start LAUnitDeaths_FindNextAndStart
LAUnitDeaths_FindNextAndStart: @ 0x08046DE8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
_08046DEC:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne _08046DFC
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08046E60
_08046DFC:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, _08046E20 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046E18
	ldr r0, [r6]
	cmp r0, #0
	bne _08046E24
_08046E18:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b _08046DEC
	.align 2, 0
_08046E20: .4byte 0x00010004
_08046E24:
	bl RefreshUnitSprites
	adds r0, r6, #0
	bl HideUnitSprite
	adds r0, r6, #0
	bl StartMu
	adds r4, r0, #0
	ldr r1, _08046E68 @ =0x02033E00
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, _08046E6C @ =0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_08046E60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046E68: .4byte 0x02033E00
_08046E6C: .4byte 0xFFFFFDFF

	thumb_func_start sub_08046E70
sub_08046E70: @ 0x08046E70
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndMu
	pop {r0}
	bx r0

	thumb_func_start sub_08046E7C
sub_08046E7C: @ 0x08046E7C
	push {lr}
	bl sub_08044DCC
	bl sub_08044E2C
	bl RefreshUnitSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LinkArena_StoreTalkChoice
LinkArena_StoreTalkChoice: @ 0x08046E90
	push {lr}
	bl GetTalkResult
	adds r1, r0, #0
	cmp r1, #1
	bne _08046EA8
	ldr r0, _08046EA4 @ =0x0203DC9C
	strb r1, [r0, #8]
	b _08046EAE
	.align 2, 0
_08046EA4: .4byte 0x0203DC9C
_08046EA8:
	ldr r1, _08046EB4 @ =0x0203DC9C
	movs r0, #0
	strb r0, [r1, #8]
_08046EAE:
	pop {r0}
	bx r0
	.align 2, 0
_08046EB4: .4byte 0x0203DC9C

	thumb_func_start sub_08046EB8
sub_08046EB8: @ 0x08046EB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08046EFC @ =0x06015000
	movs r1, #6
	bl LoadHelpBoxGfx
	movs r2, #0xf5
	lsls r2, r2, #2
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	movs r4, #0
	ldr r6, _08046F00 @ =0x0203DCA6
_08046ED4:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_0803CD1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046EEC
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08046EEC
	str r4, [r5, #0x58]
_08046EEC:
	adds r4, #1
	cmp r4, #3
	ble _08046ED4
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046EFC: .4byte 0x06015000
_08046F00: .4byte 0x0203DCA6

	thumb_func_start sub_08046F04
sub_08046F04: @ 0x08046F04
	push {r4, lr}
	adds r4, r0, #0
_08046F08:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble _08046F1A
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _08046F72
_08046F1A:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _08046F40 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046F38
	ldr r0, [r2]
	cmp r0, #0
	bne _08046F44
_08046F38:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b _08046F08
	.align 2, 0
_08046F40: .4byte 0x00010004
_08046F44:
	ldr r3, _08046F78 @ =0x0203DC9C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_08044AC0
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
_08046F72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046F78: .4byte 0x0203DC9C

	thumb_func_start sub_08046F7C
sub_08046F7C: @ 0x08046F7C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046F94 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08046F90
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08046F90:
	pop {r0}
	bx r0
	.align 2, 0
_08046F94: .4byte 0x0203D90C

	thumb_func_start sub_08046F98
sub_08046F98: @ 0x08046F98
	push {lr}
	ldr r0, _08046FC4 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl RenderMap
	bl SetupBanim
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046FC8
	movs r0, #1
	bl SetBanimLinkArenaFlag
	bl BeginAnimsOnBattleAnimations
	b _08046FDE
	.align 2, 0
_08046FC4: .4byte 0x02023C60
_08046FC8:
	bl EndAllMus
	bl RenderMap
	bl StartBattleManim
	ldr r0, _08046FE4 @ =0x0203A3D8
	movs r1, #0x80
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08046FDE:
	pop {r0}
	bx r0
	.align 2, 0
_08046FE4: .4byte 0x0203A3D8

	thumb_func_start sub_08046FE8
sub_08046FE8: @ 0x08046FE8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _08047058 @ =0x0203A3F0
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08047004
	ldr r0, _0804705C @ =0x08C9D00C
	bl Proc_Find
	adds r4, r0, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_08047004:
	ldr r5, _08047060 @ =0x0203A470
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047050
	bl RefreshUnitSprites
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSprite
	adds r0, r5, #0
	bl StartMu
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingFromTo
	ldr r1, _08047064 @ =0x02033E00
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_08047050:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047058: .4byte 0x0203A3F0
_0804705C: .4byte 0x08C9D00C
_08047060: .4byte 0x0203A470
_08047064: .4byte 0x02033E00

	thumb_func_start sub_08047068
sub_08047068: @ 0x08047068
	push {r4, r5, lr}
	ldr r0, _080470B0 @ =0x0203A3F0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _080470B4 @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08047098
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08047098:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080470AA
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_080470AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080470B0: .4byte 0x0203A3F0
_080470B4: .4byte 0x0203A470

	thumb_func_start sub_080470B8
sub_080470B8: @ 0x080470B8
	ldr r1, _080470C0 @ =0x0203DCE8
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080470C0: .4byte 0x0203DCE8

	thumb_func_start FE6Link_Init
FE6Link_Init: @ 0x080470C4
	ldr r1, _080470CC @ =0x0203DCE8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080470CC: .4byte 0x0203DCE8

	thumb_func_start sub_080470D0
sub_080470D0: @ 0x080470D0
	ldr r2, _08047104 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08047104: .4byte 0x03002870

	thumb_func_start sub_08047108
sub_08047108: @ 0x08047108
	ldr r0, _08047134 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _08047138 @ =0x02001188
	cmp r1, #0xa0
	bls _08047120
	ldr r0, _0804713C @ =0x02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_08047120:
	ldr r2, _08047140 @ =0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_08047134: .4byte 0x04000006
_08047138: .4byte 0x02001188
_0804713C: .4byte 0x02001180
_08047140: .4byte 0x04000042

	thumb_func_start sub_08047144
sub_08047144: @ 0x08047144
	ldr r2, _08047154 @ =0x02001180
	ldr r3, [r2]
	ldr r1, _08047158 @ =0x02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_08047154: .4byte 0x02001180
_08047158: .4byte 0x02001184

	thumb_func_start sub_0804715C
sub_0804715C: @ 0x0804715C
	push {lr}
	ldr r2, _08047180 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0
_08047180: .4byte 0x03002870

	thumb_func_start sub_08047184
sub_08047184: @ 0x08047184
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, _080472F0 @ =0x080C5A48
	mov sb, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, sb
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, sb
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sb, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, sb
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sb, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, sb
	bl sub_080133C8
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, sb
	adds r2, r7, #0
	mov r3, sl
	bl sub_080133C8
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl sub_080133C8
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl sub_080133C8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080472F0: .4byte 0x080C5A48

	thumb_func_start sub_080472F4
sub_080472F4: @ 0x080472F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08047328 @ =0x02001180
	ldr r0, _0804732C @ =0x02000F00
	str r0, [r1]
	ldr r5, _08047330 @ =0x02001184
	ldr r2, _08047334 @ =0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _08047338 @ =0x02001188
	str r0, [r1]
	bl sub_080133A8
	ldr r0, [r5]
	bl sub_080133A8
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0804733C @ =sub_08047108
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08047328: .4byte 0x02001180
_0804732C: .4byte 0x02000F00
_08047330: .4byte 0x02001184
_08047334: .4byte 0xFFFFFD80
_08047338: .4byte 0x02001188
_0804733C: .4byte sub_08047108

	thumb_func_start sub_08047340
sub_08047340: @ 0x08047340
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne _08047364
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b _080473CA
_08047364:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _080473D4 @ =0x02001184
	ldr r0, [r4]
	bl sub_080133A8
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_08047184
	bl sub_08047144
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_080473CA:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080473D4: .4byte 0x02001184

	thumb_func_start sub_080473D8
sub_080473D8: @ 0x080473D8
	ldr r2, _0804741C @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804741C: .4byte 0x03002870

	thumb_func_start sub_08047420
sub_08047420: @ 0x08047420
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080474C0 @ =0x08B9A1E0
	bl SpawnProcLocking
	adds r0, #0x64
	movs r3, #0
	strh r4, [r0]
	ldr r0, _080474C4 @ =0x03002870
	mov ip, r0
	movs r2, #1
	ldrb r0, [r0, #1]
	orrs r0, r2
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	orrs r2, r0
	mov r1, r8
	orrs r2, r1
	orrs r2, r6
	orrs r2, r5
	orrs r2, r4
	mov r3, ip
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080474C0: .4byte 0x08B9A1E0
_080474C4: .4byte 0x03002870

	thumb_func_start sub_080474C8
sub_080474C8: @ 0x080474C8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_08047420
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080474D8
sub_080474D8: @ 0x080474D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	ldrh r0, [r7]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080474FC
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
	b _08047562
_080474FC:
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _0804756C @ =0x02001184
	ldr r0, [r4]
	bl sub_080133A8
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_08047184
	bl sub_08047144
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_08047562:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804756C: .4byte 0x02001184

	thumb_func_start sub_08047570
sub_08047570: @ 0x08047570
	ldr r2, _08047590 @ =0x03002870
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08047590: .4byte 0x03002870

	thumb_func_start sub_08047594
sub_08047594: @ 0x08047594
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08047618 @ =0x08B9A218
	bl SpawnProcLocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, _0804761C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	movs r2, #1
	ldrb r0, [r4]
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047618: .4byte 0x08B9A218
_0804761C: .4byte 0x03002870

	thumb_func_start sub_08047620
sub_08047620: @ 0x08047620
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_08047594
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08047630
sub_08047630: @ 0x08047630
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804764C @ =0x08B9A1E0
	bl Proc_Find
	cmp r0, #0
	bne _08047644
	adds r0, r4, #0
	bl Proc_Break
_08047644:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804764C: .4byte 0x08B9A1E0

	thumb_func_start sub_08047650
sub_08047650: @ 0x08047650
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804766C @ =0x08B9A218
	bl Proc_Find
	cmp r0, #0
	bne _08047664
	adds r0, r4, #0
	bl Proc_Break
_08047664:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804766C: .4byte 0x08B9A218

	thumb_func_start sub_08047670
sub_08047670: @ 0x08047670
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080476BC @ =0x08B9A250
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080476C0 @ =0x02022860
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _080476C4 @ =0x08B9A268
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080476BC: .4byte 0x08B9A250
_080476C0: .4byte 0x02022860
_080476C4: .4byte 0x08B9A268

	thumb_func_start sub_080476C8
sub_080476C8: @ 0x080476C8
	ldr r0, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r1, [r0, #0x34]
	movs r0, #0xf
	ldrb r3, [r1, #1]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	bx lr

	thumb_func_start StartLinkArenaMUDeathFade
StartLinkArenaMUDeathFade: @ 0x080476E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0804775C @ =0x08C9D044
	adds r1, r4, #0
	bl SpawnProc
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r3, #0
	movs r1, #0x20
	strh r1, [r0]
	ldr r1, _08047760 @ =0x03002870
	mov ip, r1
	mov r2, ip
	adds r2, #0x3c
	movs r1, #0x3f
	ldrb r6, [r2]
	ands r1, r6
	strb r1, [r2]
	ldrh r0, [r0]
	lsrs r1, r0, #1
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl sub_08047670
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _08047764 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08047754
	movs r0, #0xd6
	bl m4aSongNumStart
_08047754:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804775C: .4byte 0x08C9D044
_08047760: .4byte 0x03002870
_08047764: .4byte 0x0202BBF8

	thumb_func_start sub_08047768
sub_08047768: @ 0x08047768
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x30]
	ldr r0, [r5, #0x34]
	ldrh r0, [r0, #2]
	movs r2, #0xd0
	lsls r2, r2, #7
	adds r0, r0, r2
	strh r0, [r1, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080477AC @ =0x02022860
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080477B0 @ =0x08B9A250
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080477AC: .4byte 0x02022860
_080477B0: .4byte 0x08B9A250

	thumb_func_start sub_080477B4
sub_080477B4: @ 0x080477B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _080477E0 @ =0x02022860
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _080477E4 @ =0x08C9D0BC
	movs r1, #3
	bl SpawnProc
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080477E0: .4byte 0x02022860
_080477E4: .4byte 0x08C9D0BC

	thumb_func_start SioWarp_Init
SioWarp_Init: @ 0x080477E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047828 @ =0x083F4C08
	ldr r1, _0804782C @ =0x06004400
	bl Decompress
	ldr r0, _08047830 @ =0x083F4E68
	movs r1, #0x60
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08047820
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl StartPlayMuStepSe
_08047820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047828: .4byte 0x083F4C08
_0804782C: .4byte 0x06004400
_08047830: .4byte 0x083F4E68

	thumb_func_start sub_08047834
sub_08047834: @ 0x08047834
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _080478E8 @ =0x02023C60
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, _080478EC @ =0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _080478F0 @ =0x083F4E88
	str r4, [sp, #8]
	ldr r6, _080478F4 @ =0x08B9A280
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_080148FC
	movs r0, #4
	bl EnableBgSync
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r6, r0, r6
	ldrb r0, [r6]
	cmp r0, #0xff
	bne _0804787E
	adds r0, r7, #0
	bl Proc_Break
_0804787E:
	ldr r3, _080478F8 @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r4, [r3, #0x10]
	ands r0, r4
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	ldr r0, _080478FC @ =0x0000FFE0
	ldrh r4, [r3, #0x3c]
	ands r0, r4
	movs r1, #4
	orrs r0, r1
	ldr r1, _08047900 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0xd8
	lsls r4, r4, #5
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0
	strb r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080478E8: .4byte 0x02023C60
_080478EC: .4byte 0x00003220
_080478F0: .4byte 0x083F4E88
_080478F4: .4byte 0x08B9A280
_080478F8: .4byte 0x03002870
_080478FC: .4byte 0x0000FFE0
_08047900: .4byte 0x0000E0FF

	thumb_func_start sub_08047904
sub_08047904: @ 0x08047904
	push {lr}
	ldr r0, _08047938 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _0804793C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08047938: .4byte 0x02023C60
_0804793C: .4byte 0x03002870

	thumb_func_start SioWarpFx_StartSioWarp
SioWarpFx_StartSioWarp: @ 0x08047940
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804796C @ =0x08B9A298
	movs r1, #2
	bl SpawnProc
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804796C: .4byte 0x08B9A298

	thumb_func_start SioWarpFx_804C178
SioWarpFx_804C178: @ 0x08047970
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl sub_08047768
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08047980
sub_08047980: @ 0x08047980
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_0806DAB4
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_SetMUPosition
SioWarpFx_SetMUPosition: @ 0x0804798C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_ShowMoveUnit
SioWarpFx_ShowMoveUnit: @ 0x080479B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080479C4
	ldr r0, [r4, #0x30]
	bl SetMuFacing
_080479C4:
	ldr r0, [r4, #0x30]
	bl ShowMu
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_080479D0
sub_080479D0: @ 0x080479D0
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_080477B4
	pop {r0}
	bx r0

	thumb_func_start SioWarpFx_AwaitSioWarp
SioWarpFx_AwaitSioWarp: @ 0x080479DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080479FC @ =0x08B9A298
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080479F4
	adds r0, r4, #0
	bl Proc_Break
_080479F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080479FC: .4byte 0x08B9A298

	thumb_func_start sub_08047A00
sub_08047A00: @ 0x08047A00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _08047A28
	ldr r0, _08047A24 @ =0x08B9A2C8
	bl SpawnProcLocking
	b _08047A30
	.align 2, 0
_08047A24: .4byte 0x08B9A2C8
_08047A28:
	ldr r0, _08047A54 @ =0x08B9A2C8
	movs r1, #2
	bl SpawnProc
_08047A30:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047A54: .4byte 0x08B9A2C8

	thumb_func_start sub_08047A58
sub_08047A58: @ 0x08047A58
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _08047A80
	ldr r0, _08047A7C @ =0x08B9A340
	bl SpawnProcLocking
	b _08047A88
	.align 2, 0
_08047A7C: .4byte 0x08B9A340
_08047A80:
	ldr r0, _08047AAC @ =0x08B9A340
	movs r1, #2
	bl SpawnProc
_08047A88:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08047AAC: .4byte 0x08B9A340

	thumb_func_start PutLinkArenaButtonSpriteAt
PutLinkArenaButtonSpriteAt: @ 0x08047AB0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _08047AD0 @ =0x081D5508
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047AD0: .4byte 0x081D5508

	thumb_func_start LAButtonSprites_Loop
LAButtonSprites_Loop: @ 0x08047AD4
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl PutLinkArenaButtonSpriteAt
	pop {r0}
	bx r0

	thumb_func_start StartLinkArenaButtonSpriteDraw
StartLinkArenaButtonSpriteDraw: @ 0x08047AE4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _08047B10 @ =0x08B9A380
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047B10: .4byte 0x08B9A380

	thumb_func_start EndLinkArenaButtonSpriteDraw
EndLinkArenaButtonSpriteDraw: @ 0x08047B14
	push {r4, lr}
	ldr r4, _08047B30 @ =0x08B9A380
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08047B28
	adds r0, r4, #0
	bl Proc_EndEach
_08047B28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047B30: .4byte 0x08B9A380

	thumb_func_start sub_08047B34
sub_08047B34: @ 0x08047B34
	push {r4, lr}
	sub sp, #0x18
	ldr r1, _08047BB8 @ =0x081D5516
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	ldr r3, _08047BBC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl ApplySystemGraphics
	ldr r0, _08047BC0 @ =0x081C7F84
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl ApplyPaletteExt
	ldr r4, _08047BC4 @ =0x081CBD4C
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08047BC8 @ =0x081CDEFC
	ldr r1, _08047BCC @ =0x02024460
	bl Decompress
	ldr r0, _08047BD0 @ =0x081CE21C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl ApplyPaletteExt
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047BB8: .4byte 0x081D5516
_08047BBC: .4byte 0x03002870
_08047BC0: .4byte 0x081C7F84
_08047BC4: .4byte 0x081CBD4C
_08047BC8: .4byte 0x081CDEFC
_08047BCC: .4byte 0x02024460
_08047BD0: .4byte 0x081CE21C

	thumb_func_start sub_08047BD4
sub_08047BD4: @ 0x08047BD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _08047C30 @ =0x02024460
	ldr r0, _08047C34 @ =0x08CC1C5C
	bl Proc_EndEach
	movs r0, #0x14
	subs r0, r0, r5
	lsls r0, r0, #5
	cmp r0, #0
	ble _08047C02
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r2, r1, #0
	adds r1, r0, #0
_08047BF4:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08047BF4
_08047C02:
	lsls r0, r5, #5
	ldr r3, _08047C34 @ =0x08CC1C5C
	cmp r0, #0
	ble _08047C20
	movs r5, #0xf0
	lsls r5, r5, #8
	adds r2, r5, #0
	adds r1, r0, #0
_08047C12:
	ldrh r5, [r4]
	adds r0, r2, r5
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08047C12
_08047C20:
	adds r0, r3, #0
	adds r1, r6, #0
	bl SpawnProc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047C30: .4byte 0x02024460
_08047C34: .4byte 0x08CC1C5C

	thumb_func_start sub_08047C38
sub_08047C38: @ 0x08047C38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	mov r8, r0
	ldr r1, _08047C98 @ =0x081D552E
	mov r0, sp
	movs r2, #0x28
	bl memcpy
	ldr r4, _08047C9C @ =0x02024460
	ldr r0, _08047CA0 @ =0x08CC1C5C
	bl Proc_EndEach
	movs r3, #0
	movs r6, #0xf
	ldr r5, _08047CA4 @ =0x0000027F
_08047C5A:
	adds r2, r4, #0
	adds r0, r3, #0
	adds r4, r2, #2
	cmp r3, #0
	bge _08047C66
	adds r0, #0x1f
_08047C66:
	asrs r0, r0, #5
	lsls r0, r0, #1
	mov r7, sp
	adds r1, r7, r0
	adds r0, r6, #0
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r1, [r2]
	adds r0, r1, r0
	strh r0, [r2]
	adds r3, #1
	cmp r3, r5
	ble _08047C5A
	ldr r0, _08047CA0 @ =0x08CC1C5C
	mov r1, r8
	bl SpawnProc
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C98: .4byte 0x081D552E
_08047C9C: .4byte 0x02024460
_08047CA0: .4byte 0x08CC1C5C
_08047CA4: .4byte 0x0000027F

	thumb_func_start sub_08047CA8
sub_08047CA8: @ 0x08047CA8
	push {lr}
	ldr r0, _08047CB4 @ =0x08CC1C5C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047CB4: .4byte 0x08CC1C5C

	thumb_func_start sub_08047CB8
sub_08047CB8: @ 0x08047CB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _08047CEE
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_08047CD0:
	mov r2, r8
	cmp r2, #0
	bge _08047CD8
	adds r2, #3
_08047CD8:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _08047CD0
_08047CEE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08047CF8
sub_08047CF8: @ 0x08047CF8
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x58]
	movs r6, #3
	ands r6, r0
	cmp r0, #0
	bge _08047D06
	adds r0, #3
_08047D06:
	asrs r4, r0, #2
	ldr r0, _08047D44 @ =0x081CBAF0
	ldr r1, _08047D48 @ =0x06000800
	bl Decompress
	ldr r0, _08047D4C @ =0x081C4A68
	ldr r5, _08047D50 @ =0x02020140
	adds r1, r5, #0
	bl Decompress
	lsls r0, r6, #8
	lsls r4, r4, #0xb
	adds r0, r0, r4
	adds r0, r0, r5
	ldr r1, _08047D54 @ =0x06014000
	movs r2, #8
	movs r3, #2
	bl sub_08047CB8
	ldr r0, _08047D58 @ =0x02023C60
	ldr r1, _08047D5C @ =0x081CBCD0
	movs r2, #0x82
	lsls r2, r2, #5
	bl TmApplyTsa_t
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047D44: .4byte 0x081CBAF0
_08047D48: .4byte 0x06000800
_08047D4C: .4byte 0x081C4A68
_08047D50: .4byte 0x02020140
_08047D54: .4byte 0x06014000
_08047D58: .4byte 0x02023C60
_08047D5C: .4byte 0x081CBCD0

	thumb_func_start sub_08047D60
sub_08047D60: @ 0x08047D60
	push {lr}
	sub sp, #4
	ldr r3, _08047D7C @ =0x08B9A398
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08047D7C: .4byte 0x08B9A398

	thumb_func_start sub_08047D80
sub_08047D80: @ 0x08047D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08047DA0 @ =0x08B9A3A8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl SpawnProc
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047DA0: .4byte 0x08B9A3A8

