	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitGainSupportLevel
UnitGainSupportLevel: @ 0x08026744
	push {r4, lr}
	adds r2, r0, #0
	adds r2, #0x32
	adds r2, r2, r1
	ldrb r3, [r2]
	adds r3, #1
	strb r3, [r2]
	ldr r3, _08026774 @ =0x0202BBF8
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl GetUnitSupportPid
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetSupportLevelGained
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026774: .4byte 0x0202BBF8
