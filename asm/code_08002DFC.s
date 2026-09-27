	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshOnHBlank
RefreshOnHBlank: @ 0x08002DFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
	ldr r0, _08002E34 @ =0x03002924
	ldr r1, [r0]
	cmp r1, #0
	beq _08002E14
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
_08002E14:
	ldr r0, _08002E38 @ =0x03002F38
	ldr r1, [r0]
	cmp r1, #0
	beq _08002E22
	ldr r0, [r7]
	adds r1, r0, #2
	str r1, [r7]
_08002E22:
	ldr r0, [r7]
	cmp r0, #1
	beq _08002E70
	cmp r0, #1
	bgt _08002E3C
	cmp r0, #0
	beq _08002E46
	b _08002F0C
	.align 2, 0
_08002E34: .4byte 0x03002924
_08002E38: .4byte 0x03002F38
_08002E3C:
	cmp r0, #2
	beq _08002EA4
	cmp r0, #3
	beq _08002ED8
	b _08002F0C
_08002E46:
	ldr r0, _08002E64 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0xef
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002E68 @ =0x04000200
	ldr r1, _08002E68 @ =0x04000200
	ldrh r2, [r1]
	ldr r3, _08002E6C @ =0x0000FFFD
	adds r1, r2, #0
	ands r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002E64: .4byte 0x03002870
_08002E68: .4byte 0x04000200
_08002E6C: .4byte 0x0000FFFD
_08002E70:
	ldr r0, _08002E98 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002E9C @ =0x03002924
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002EA0 @ =0x04000200
	ldr r1, _08002EA0 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002E98: .4byte 0x03002870
_08002E9C: .4byte 0x03002924
_08002EA0: .4byte 0x04000200
_08002EA4:
	ldr r0, _08002ECC @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, _08002ED0 @ =0x03002F38
	ldr r1, [r0]
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002ED4 @ =0x04000200
	ldr r1, _08002ED4 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002ECC: .4byte 0x03002870
_08002ED0: .4byte 0x03002F38
_08002ED4: .4byte 0x04000200
_08002ED8:
	ldr r0, _08002F00 @ =0x03002870
	ldrb r1, [r0, #4]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r1, _08002F04 @ =OnHBlankBoth
	movs r0, #1
	bl SetIrqFunc
	ldr r0, _08002F08 @ =0x04000200
	ldr r1, _08002F08 @ =0x04000200
	ldrh r2, [r1]
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _08002F0C
	.align 2, 0
_08002F00: .4byte 0x03002870
_08002F04: .4byte OnHBlankBoth
_08002F08: .4byte 0x04000200
_08002F0C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
