	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_SetEnterMap
Event_SetEnterMap: @ 0x0800F2FC
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0800F316
	adds r0, r2, #0
	adds r0, #0x4d
	strb r1, [r0]
_0800F316:
	bx lr
