	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnTalkYes
EvtCmd_GotoIfnTalkYes: @ 0x0800D7F4
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0800D804
	movs r0, #0
	b _0800D80E
_0800D804:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
_0800D80E:
	pop {r4}
	pop {r1}
	bx r1
