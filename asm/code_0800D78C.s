	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfyHectorMode
EvtCmd_GotoIfyHectorMode: @ 0x0800D78C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800D79C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	beq _0800D7A0
	movs r0, #0
	b _0800D7AA
	.align 2, 0
_0800D79C: .4byte 0x0202BBF8
_0800D7A0:
	ldr r0, [r2, #0x30]
	ldr r1, [r0, #4]
	adds r0, r2, #0
	bl EventGotoLabel
_0800D7AA:
	pop {r1}
	bx r1
	.align 2, 0
