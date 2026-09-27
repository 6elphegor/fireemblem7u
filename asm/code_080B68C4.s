	.include "macro.inc"

	.syntax unified

	thumb_func_start GetChapterWinPerc
GetChapterWinPerc: @ 0x080B68C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl PidStatsGetTotalBattleAmt
	adds r4, r0, #0
	bl PidStatsGetTotalWinAmt
	adds r5, r0, #0
	ldr r7, _080B68F8 @ =0x000FFFFF
	cmp r4, r7
	ble _080B68E0
	adds r4, r7, #0
_080B68E0:
	cmp r5, r7
	ble _080B68E6
	adds r5, r7, #0
_080B68E6:
	ldr r6, _080B68FC @ =0x0202BBF8
	ldr r0, [r6, #0x34]
	mov r8, r0
	lsls r0, r0, #0xc
	lsrs r2, r0, #0xc
	cmp r4, r2
	bne _080B6900
	movs r0, #0x28
	b _080B694C
	.align 2, 0
_080B68F8: .4byte 0x000FFFFF
_080B68FC: .4byte 0x0202BBF8
_080B6900:
	ldrh r1, [r6, #0x36]
	lsrs r1, r1, #4
	mov ip, r1
	movs r3, #0x38
	adds r3, r3, r6
	mov sb, r3
	ldrb r1, [r3]
	lsls r0, r1, #0xc
	mov r3, ip
	orrs r0, r3
	subs r0, r5, r0
	movs r1, #0x64
	muls r0, r1, r0
	subs r1, r4, r2
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0x64
	ble _080B6928
	movs r2, #0x64
_080B6928:
	ands r4, r7
	ldr r0, _080B6958 @ =0xFFF00000
	mov r1, r8
	ands r0, r1
	orrs r0, r4
	str r0, [r6, #0x34]
	ldr r1, _080B695C @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #4
	movs r0, #0xf
	ldrh r3, [r6, #0x36]
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #0x36]
	lsrs r0, r5, #0xc
	mov r1, sb
	strb r0, [r1]
	adds r0, r2, #0
_080B694C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B6958: .4byte 0xFFF00000
_080B695C: .4byte 0x00000FFF
