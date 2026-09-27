	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B338
sub_0801B338: @ 0x0801B338
	push {r4, r5, lr}
	adds r2, r1, #0
	ldr r3, _0801B3B8 @ =0x08B857F8
	ldr r1, [r3]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B354
	adds r1, r2, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801B354:
	ldr r1, [r3]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	adds r5, r2, #0
	adds r5, #0x3c
	cmp r0, #0
	beq _0801B36A
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_0801B36A:
	adds r1, r5, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0x42
	ble _0801B378
	movs r0, #0x42
	strb r0, [r1]
_0801B378:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801B384
	movs r0, #0
	strb r0, [r1]
_0801B384:
	ldr r1, [r3]
	movs r0, #0x30
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0801B3B0
	ldr r4, _0801B3BC @ =0x02022D2E
	ldr r1, _0801B3C0 @ =0x081C3B74
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldr r1, [r0]
	adds r0, r4, #0
	bl DebugPutStr
	movs r0, #1
	bl EnableBgSync
_0801B3B0:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3B8: .4byte 0x08B857F8
_0801B3BC: .4byte 0x02022D2E
_0801B3C0: .4byte 0x081C3B74
