	.include "macro.inc"

	.syntax unified

	thumb_func_start PutMapUiHpBarRight
PutMapUiHpBarRight: @ 0x080847C8
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080847D8
	movs r3, #5
_080847D8:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _080847E0
	movs r3, #0
_080847E0:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
