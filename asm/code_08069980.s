	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069980
sub_08069980: @ 0x08069980
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, _08069A94 @ =0x020200D8
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08069996
	adds r0, r4, #0
	bl sub_080552DC
_08069996:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBgTilemapOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBgTilemapOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBgTilemapOffset
	movs r0, #1
	movs r1, #0
	bl SetBgScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBgScreenSize
	mov r4, sp
	ldr r2, _08069A98 @ =0x0203E028
	ldrh r0, [r2]
	movs r6, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, _08069A9C @ =0x0203E02C
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r6, [sp, #0x1c]
	ldr r0, _08069AA0 @ =0x020145C8
	str r0, [sp, #0x20]
	ldr r0, _08069AA4 @ =0x0203E00E
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08069A10
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	mov r0, sp
	bl sub_08054F30
_08069A10:
	ldr r2, [r5, #0x5c]
	ldr r1, _08069AA8 @ =0x0000F3FF
	adds r0, r1, #0
	ldrh r3, [r2, #8]
	ands r0, r3
	strh r0, [r2, #8]
	ldr r3, [r5, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	orrs r0, r2
	strh r0, [r3, #8]
	ldr r0, [r5, #0x60]
	ldrh r3, [r0, #8]
	ands r1, r3
	strh r1, [r0, #8]
	ldr r0, [r5, #0x60]
	ldrh r1, [r0, #8]
	orrs r2, r1
	strh r2, [r0, #8]
	str r6, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, _08069AAC @ =0x02023460
	ldr r2, _08069AB0 @ =0x01000200
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	movs r0, #0
	bl EkrGauge_0804CC68
	ldr r3, _08069AB4 @ =0x03002870
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
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069A94: .4byte 0x020200D8
_08069A98: .4byte 0x0203E028
_08069A9C: .4byte 0x0203E02C
_08069AA0: .4byte 0x020145C8
_08069AA4: .4byte 0x0203E00E
_08069AA8: .4byte 0x0000F3FF
_08069AAC: .4byte 0x02023460
_08069AB0: .4byte 0x01000200
_08069AB4: .4byte 0x03002870
