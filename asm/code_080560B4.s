	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080560B4
sub_080560B4: @ 0x080560B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _08056134 @ =0x0201FB20
	ldr r0, [r0]
	ldr r1, _08056138 @ =0x0201FB2C
	mov r8, r1
	cmp r0, #0
	bne _080560CE
	ldr r2, _0805613C @ =0x0201FC6C
	mov r8, r2
_080560CE:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl sub_08013450
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _08056140 @ =0x0000FFFF
	ldrh r0, [r0, #2]
	cmp r0, r1
	beq _080560F8
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_080560F8:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08056106
	movs r2, #0
_08056106:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _08056114
	movs r1, #0xa0
_08056114:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
_08056124:
	cmp sb, r3
	bhi _0805612C
	cmp r4, r3
	bhs _08056144
_0805612C:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b _08056174
	.align 2, 0
_08056134: .4byte 0x0201FB20
_08056138: .4byte 0x0201FB2C
_0805613C: .4byte 0x0201FC6C
_08056140: .4byte 0x0000FFFF
_08056144:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _08056154
	movs r1, #0
_08056154:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08056164
	movs r2, #0xf0
_08056164:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
_08056174:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls _08056124
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r5, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r5, r4]
	cmp r0, ip
	bne _080561BA
	ldr r1, _080561C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r2, _080561CC @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r7, [r1]
	ands r0, r7
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, r5, #0
	bl Proc_Break
_080561BA:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080561C8: .4byte 0x0201774C
_080561CC: .4byte 0x03002870
