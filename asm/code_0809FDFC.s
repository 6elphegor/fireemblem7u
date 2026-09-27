	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsRecordLoseData
PidStatsRecordLoseData: @ 0x0809FDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FECC
	cmp r4, #0x45
	bhi _0809FECC
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FECC
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _0809FED8 @ =0x0203E790
	adds r5, r6, r0
	cmp r5, #0
	beq _0809FECC
	ldr r1, _0809FEDC @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _0809FECC
	ldr r7, _0809FEE0 @ =0x0202BBF8
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0809FECC
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0809FECC
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _0809FECC
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	rsbs r1, r1, #0
	mov r0, r8
	bl PidStatsAddFavval
	bl GetLastSuspendSaveId
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveWriteAddr
	adds r1, r0, #0
	ldr r2, _0809FEE4 @ =0x000019DC
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl ReadSaveBlockInfo
	mov r0, sp
	adds r1, r4, #0
	bl WriteSaveBlockInfo
	ldrb r0, [r7, #0xc]
	bl GetSaveWriteAddr
	adds r1, r0, #0
	movs r2, #0x85
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl ReadSaveBlockInfo
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl WriteSaveBlockInfo
_0809FECC:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FED8: .4byte 0x0203E790
_0809FEDC: .4byte 0x0202BBB8
_0809FEE0: .4byte 0x0202BBF8
_0809FEE4: .4byte 0x000019DC
