	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809A650
sub_0809A650: @ 0x0809A650
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	str r5, [r4, #0x2c]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809A688
	movs r0, #1
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #2
	bne _0809A684
	adds r1, r4, #0
	adds r1, #0x3d
	movs r0, #1
	ldrb r3, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	strb r5, [r2]
	b _0809A688
_0809A684:
	adds r0, #1
	strb r0, [r2]
_0809A688:
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0809A6BA
	movs r0, #0
	bl SetUiSpinningArrowFastMaybe
	adds r2, r4, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	cmp r0, #0
	bne _0809A6B6
	adds r0, r4, #0
	adds r0, #0x3d
	movs r1, #1
	ldrb r3, [r0]
	subs r1, r1, r3
	strb r1, [r0]
	movs r0, #2
	b _0809A6B8
_0809A6B6:
	subs r0, #1
_0809A6B8:
	strb r0, [r2]
_0809A6BA:
	pop {r4, r5}
	pop {r0}
	bx r0
