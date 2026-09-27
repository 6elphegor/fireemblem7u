	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfnTutorial
EvtCmd_GotoIfnTutorial: @ 0x0800D834
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0800D85C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D84E
	bl IsTutorialDisabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D860
_0800D84E:
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl EventGotoLabel
	b _0800D862
	.align 2, 0
_0800D85C: .4byte 0x0202BBF8
_0800D860:
	movs r0, #0
_0800D862:
	pop {r4}
	pop {r1}
	bx r1
