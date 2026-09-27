	.include "macro.inc"

	.syntax unified

	thumb_func_start SetSupportLevelGained
SetSupportLevelGained: @ 0x08026BA0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromCharId
	adds r7, r0, #0
	adds r1, r5, #0
	bl GetUnitSupportNumByPid
	adds r2, r0, #0
	adds r1, r7, #0
	adds r1, #0x39
	movs r4, #1
	adds r0, r4, #0
	lsls r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitFromCharId
	adds r7, r0, #0
	adds r1, r6, #0
	bl GetUnitSupportNumByPid
	adds r2, r0, #0
	adds r0, r7, #0
	adds r0, #0x39
	lsls r4, r2
	ldrb r1, [r0]
	orrs r4, r1
	strb r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
