	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuInitUnused
SaveMenuInitUnused: @ 0x080A39A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl ReadLastGameSaveId
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
