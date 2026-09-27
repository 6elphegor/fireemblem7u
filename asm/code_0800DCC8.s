	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FlashCursorPosition
EvtCmd_FlashCursorPosition: @ 0x0800DCC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800DCDE
	movs r0, #0
	b _0800DD26
_0800DCDE:
	ldr r1, [r5, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800DCF2
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0800DCF4
_0800DCF2:
	ldr r0, _0800DD08 @ =0x0000FFFF
_0800DCF4:
	adds r6, r0, #0
	ldrh r1, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800DD0C
	adds r4, r1, #0
	b _0800DD0E
	.align 2, 0
_0800DD08: .4byte 0x0000FFFF
_0800DD0C:
	ldr r4, _0800DD2C @ =0x0000FFFF
_0800DD0E:
	ldr r0, _0800DD30 @ =0x08B91A38
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x64
	strh r6, [r1]
	adds r0, #0x66
	strh r4, [r0]
	ldr r0, _0800DD34 @ =EventFlashCursorWait
	str r0, [r5, #0x40]
	movs r0, #2
_0800DD26:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD2C: .4byte 0x0000FFFF
_0800DD30: .4byte 0x08B91A38
_0800DD34: .4byte EventFlashCursorWait
