	.include "macro.inc"

	.syntax unified

	thumb_func_start EventGiveItem
EventGiveItem: @ 0x0800D9D0
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _0800D9E2
	adds r0, r2, #0
	adds r0, #0x5c
	ldrh r1, [r0]
_0800D9E2:
	adds r0, r3, #0
	bl StartGiveItem
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
