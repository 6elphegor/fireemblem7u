	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_RefreshSelectableCells
TradeMenu_RefreshSelectableCells: @ 0x0802AE84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	adds r7, r0, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r6, #0x34
	movs r1, #0x39
	adds r1, r1, r0
	mov r8, r1
	adds r0, #0x3f
	mov ip, r0
_0802AE9E:
	movs r3, #0
	lsls r1, r2, #2
	lsls r0, r2, #1
	adds r5, r2, #1
	adds r4, r7, r1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r2, r0, r6
_0802AEAE:
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	cmp r3, #4
	ble _0802AEAE
	adds r2, r5, #0
	cmp r2, #1
	ble _0802AE9E
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
