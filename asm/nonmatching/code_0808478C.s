	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMapUiHpBarMid
PutMapUiHpBarMid: @ 0x0808478C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_080847A6:
	cmp r1, r4
	bge _080847AE
	strh r5, [r3]
	b _080847B8
_080847AE:
	cmp r1, r4
	bne _080847B6
	strh r0, [r3]
	b _080847B8
_080847B6:
	strh r2, [r3]
_080847B8:
	adds r3, #2
	adds r1, #1
	cmp r1, #3
	ble _080847A6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
