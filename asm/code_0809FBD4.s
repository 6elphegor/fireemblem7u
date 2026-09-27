	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterChapterStats
RegisterChapterStats: @ 0x0809FBD4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetNextChapterStatsSlot
	bl GetChapterStats
	adds r5, r0, #0
	bl GetGameTime
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r3, r0, #0
	ldr r0, _0809FC2C @ =0x0000EA60
	cmp r3, r0
	ble _0809FBFA
	adds r3, r0, #0
_0809FBFA:
	ldrh r2, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r2, r0
	ble _0809FC06
	adds r2, r0, #0
_0809FC06:
	movs r1, #0x7f
	ldrb r4, [r4, #0xe]
	ands r1, r4
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r4, [r5]
	ands r0, r4
	orrs r0, r1
	strb r0, [r5]
	lsls r1, r2, #7
	movs r0, #0x7f
	ldrh r2, [r5]
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	strh r3, [r5, #2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC2C: .4byte 0x0000EA60
