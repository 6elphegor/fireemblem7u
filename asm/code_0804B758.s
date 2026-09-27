	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattleTriggerNewRoundStart
ekrBattleTriggerNewRoundStart: @ 0x0804B758
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0804B7C4
	ldr r6, _0804B7CC @ =0x0203E010
	ldrh r0, [r6]
	cmp r0, #1
	bne _0804B794
	ldr r3, _0804B7D0 @ =0x02000000
	ldr r4, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #4]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804B794:
	ldrh r6, [r6, #2]
	cmp r6, #1
	bne _0804B7BA
	ldr r3, _0804B7D0 @ =0x02000000
	ldr r4, [r3, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	strh r2, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r0, #0
	ldrh r0, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	ldr r4, [r3, #0xc]
	strh r2, [r4, #0x10]
	ldrh r0, [r4, #0xc]
	orrs r1, r0
	strh r1, [r4, #0xc]
_0804B7BA:
	ldr r0, _0804B7D4 @ =0x0201FAF8
	str r7, [r0]
	str r7, [r0, #4]
	ldr r0, _0804B7D8 @ =ekrBattle_80503EC
	str r0, [r5, #0xc]
_0804B7C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B7CC: .4byte 0x0203E010
_0804B7D0: .4byte 0x02000000
_0804B7D4: .4byte 0x0201FAF8
_0804B7D8: .4byte ekrBattle_80503EC
