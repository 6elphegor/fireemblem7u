	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045BC8
sub_08045BC8: @ 0x08045BC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045BF8 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08045C04
	ldr r0, _08045BFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045BEC
	ldr r0, _08045C00 @ =0x0000038A
	bl m4aSongNumStart
_08045BEC:
	bl CloseBattleForecast
	adds r0, r4, #0
	bl Proc_Break
	b _08045C2A
	.align 2, 0
_08045BF8: .4byte 0x08B857F8
_08045BFC: .4byte 0x0202BBF8
_08045C00: .4byte 0x0000038A
_08045C04:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08045C2A
	ldr r0, _08045C30 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045C1E
	ldr r0, _08045C34 @ =0x0000038B
	bl m4aSongNumStart
_08045C1E:
	bl CloseBattleForecast
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08045C2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045C30: .4byte 0x0202BBF8
_08045C34: .4byte 0x0000038B
