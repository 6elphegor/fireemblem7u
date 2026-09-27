	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802B02C
sub_0802B02C: @ 0x0802B02C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r3, r4, #0
	adds r3, #0x2c
	adds r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r2, [r1]
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r1, [r3]
	adds r1, r1, r0
	ldrh r3, [r2]
	ldrh r0, [r1]
	strh r0, [r2]
	strh r3, [r1]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802B090 @ =0x0203A85C
	movs r0, #0x18
	strb r0, [r1, #0x11]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, [r4, #0x30]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl TradeMenu_RefreshItemText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B090: .4byte 0x0203A85C
