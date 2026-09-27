	.include "macro.inc"

	.syntax unified

	thumb_func_start TrySwitchViewedUnit
TrySwitchViewedUnit: @ 0x0801D354
	push {r4, r5, lr}
	ldr r2, _0801D3A8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	movs r0, #0xc0
	ands r0, r5
	cmp r0, #0
	beq _0801D36E
	movs r5, #0
_0801D36E:
	adds r5, #1
	adds r4, r5, #0
	cmp r5, #0x3e
	bgt _0801D388
_0801D376:
	adds r0, r4, #0
	bl TrySetCursorOn
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3A0
	adds r4, #1
	cmp r4, #0x3e
	ble _0801D376
_0801D388:
	movs r4, #1
	cmp r4, r5
	bgt _0801D3A0
_0801D38E:
	adds r0, r4, #0
	bl TrySetCursorOn
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D3A0
	adds r4, #1
	cmp r4, r5
	ble _0801D38E
_0801D3A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D3A8: .4byte 0x0202E3DC
