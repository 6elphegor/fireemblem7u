	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FlashCursorPid
EvtCmd_FlashCursorPid: @ 0x0800DD38
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800DD80
	ldr r0, _0800DD78 @ =0x08B91A38
	adds r1, r4, #0
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	adds r1, r0, #0
	adds r1, #0x64
	strh r2, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, #0x66
	strh r1, [r0]
	ldr r0, _0800DD7C @ =EventFlashCursorWait
	str r0, [r4, #0x40]
	movs r0, #2
	b _0800DD82
	.align 2, 0
_0800DD78: .4byte 0x08B91A38
_0800DD7C: .4byte EventFlashCursorWait
_0800DD80:
	movs r0, #0
_0800DD82:
	pop {r4, r5}
	pop {r1}
	bx r1
