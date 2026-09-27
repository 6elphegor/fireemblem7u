	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemList_StartTradeScreen
PrepItemList_StartTradeScreen: @ 0x08098550
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r4, r0, #2
	ldr r0, _08098584 @ =0x020117E4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_0809496C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098584: .4byte 0x020117E4
