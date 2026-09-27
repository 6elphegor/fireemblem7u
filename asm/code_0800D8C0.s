	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfyTurnCountReached
EvtCmd_GotoIfyTurnCountReached: @ 0x0800D8C0
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D8D4 @ =0x0202BBF8
	ldr r1, [r2, #0x30]
	ldrh r0, [r0, #0x10]
	ldrh r3, [r1, #2]
	cmp r0, r3
	bhs _0800D8D8
	movs r0, #0
	b _0800D8E0
	.align 2, 0
_0800D8D4: .4byte 0x0202BBF8
_0800D8D8:
	ldr r1, [r1, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D8E0:
	pop {r1}
	bx r1
