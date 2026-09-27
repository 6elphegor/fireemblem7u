	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AD64
sub_0809AD64: @ 0x0809AD64
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _0809ADB2
	bl sub_080992A0
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _0809ADA8
	cmp r4, #0
	ble _0809AD9A
	rsbs r0, r4, #0
	bl AddGold
	ldr r0, _0809ADA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AD9A
	movs r0, #0xb9
	bl m4aSongNumStart
_0809AD9A:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809ADBA
	.align 2, 0
_0809ADA4: .4byte 0x0202BBF8
_0809ADA8:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0809ADBA
_0809ADB2:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0809ADBA:
	pop {r4, r5}
	pop {r0}
	bx r0
