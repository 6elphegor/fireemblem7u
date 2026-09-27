	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_GotoIfyDifficulty
EvtCmd_GotoIfyDifficulty: @ 0x0800D7B0
	push {lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x30]
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _0800D7D0
	ldr r1, _0800D7CC @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0800D7EC
	b _0800D7DC
	.align 2, 0
_0800D7CC: .4byte 0x0202BBF8
_0800D7D0:
	ldr r1, _0800D7E8 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _0800D7EC
_0800D7DC:
	ldr r1, [r2, #4]
	adds r0, r3, #0
	bl EventGotoLabel
	b _0800D7EE
	.align 2, 0
_0800D7E8: .4byte 0x0202BBF8
_0800D7EC:
	movs r0, #0
_0800D7EE:
	pop {r1}
	bx r1
	.align 2, 0
