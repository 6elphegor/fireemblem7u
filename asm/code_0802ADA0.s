	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_RefreshItemText
TradeMenu_RefreshItemText: @ 0x0802ADA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0802AE6C @ =0x081C3CEC
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _0802AE70 @ =0x081C3CEE
	adds r0, r4, #0
	movs r2, #2
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0802AE74 @ =0x02022EA0
	ldr r2, _0802AE78 @ =0x010000B0
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	adds r5, #0x2c
	str r5, [sp, #0xc]
_0802ADDA:
	movs r7, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	mov sb, r1
	add r0, r8
	lsls r0, r0, #3
	mov sl, r0
_0802ADF0:
	mov r1, sb
	ldr r0, [r1]
	lsls r4, r7, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r0, r7, #3
	ldr r1, _0802AE7C @ =0x0200278C
	adds r0, r0, r1
	mov r1, sl
	adds r6, r1, r0
	adds r0, r6, #0
	bl ClearText
	cmp r5, #0
	beq _0802AE46
	mov r1, sb
	ldr r0, [r1]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	add r0, r8
	adds r0, #4
	ldrb r0, [r0]
	adds r3, r0, r4
	adds r3, #1
	lsls r3, r3, #5
	adds r3, #1
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	adds r3, r0, r3
	lsls r3, r3, #1
	ldr r0, _0802AE80 @ =0x02022C60
	adds r3, r3, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawItemMenuLine
_0802AE46:
	adds r7, #1
	cmp r7, #4
	ble _0802ADF0
	ldr r0, [sp, #0x10]
	mov r8, r0
	cmp r0, #1
	ble _0802ADDA
	movs r0, #1
	bl EnableBgSync
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AE6C: .4byte 0x081C3CEC
_0802AE70: .4byte 0x081C3CEE
_0802AE74: .4byte 0x02022EA0
_0802AE78: .4byte 0x010000B0
_0802AE7C: .4byte 0x0200278C
_0802AE80: .4byte 0x02022C60
