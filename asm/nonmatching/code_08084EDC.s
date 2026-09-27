	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitMapUiStatus
PutUnitMapUiStatus: @ 0x08084EDC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r1, #0
	beq _08084FA4
	adds r1, #0x30
	ldrb r2, [r1]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #8
	bhi _08084F3A
	lsls r0, r0, #2
	ldr r1, _08084F00 @ =_08084F04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084F00: .4byte _08084F04
_08084F04: @ jump table
	.4byte _08084FA4 @ case 0
	.4byte _08084F2C @ case 1
	.4byte _08084F28 @ case 2
	.4byte _08084F34 @ case 3
	.4byte _08084F30 @ case 4
	.4byte _08084F38 @ case 5
	.4byte _08084F38 @ case 6
	.4byte _08084F38 @ case 7
	.4byte _08084F38 @ case 8
_08084F28:
	adds r4, #0x60
	b _08084F3A
_08084F2C:
	adds r4, #0x64
	b _08084F3A
_08084F30:
	adds r4, #0x68
	b _08084F3A
_08084F34:
	adds r4, #0x6c
	b _08084F3A
_08084F38:
	adds r4, #0x70
_08084F3A:
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _08084F60
	cmp r0, #6
	bgt _08084F4E
	cmp r0, #5
	beq _08084F58
	b _08084F86
_08084F4E:
	cmp r0, #7
	beq _08084F68
	cmp r0, #8
	beq _08084F7C
	b _08084F86
_08084F58:
	ldr r0, _08084F5C @ =0x0840433C
	b _08084F6A
	.align 2, 0
_08084F5C: .4byte 0x0840433C
_08084F60:
	ldr r0, _08084F64 @ =0x084043BC
	b _08084F6A
	.align 2, 0
_08084F64: .4byte 0x084043BC
_08084F68:
	ldr r0, _08084F74 @ =0x0840443C
_08084F6A:
	ldr r1, _08084F78 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
	b _08084F86
	.align 2, 0
_08084F74: .4byte 0x0840443C
_08084F78: .4byte 0x06002E00
_08084F7C:
	ldr r0, _08084FAC @ =0x084044BC
	ldr r1, _08084FB0 @ =0x06002E00
	movs r2, #0x20
	bl CpuFastSet
_08084F86:
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	movs r0, #0
	strh r0, [r5, #8]
	ldrb r6, [r6]
	lsrs r0, r6, #4
	movs r2, #0x94
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r5, #0xa]
_08084FA4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084FAC: .4byte 0x084044BC
_08084FB0: .4byte 0x06002E00
