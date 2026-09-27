	.include "macro.inc"

	.syntax unified

	thumb_func_start SendToConvoyMenu_Idle
SendToConvoyMenu_Idle: @ 0x0801DB0C
	push {r4, lr}
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _0801DB1A
	movs r0, #0
	b _0801DB40
_0801DB1A:
	ldr r0, _0801DB48 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #8]
	ldr r1, _0801DB4C @ =0x0203A85C
	ldrh r0, [r1, #8]
	cmp r0, #4
	bhi _0801DB3E
	ldr r4, _0801DB50 @ =0x03004690
	ldr r0, [r4]
	ldrh r1, [r1, #8]
	bl UnitRemoveItem
	ldr r0, [r4]
	ldr r1, _0801DB54 @ =0x0202BBB8
	ldrh r1, [r1, #0x2c]
	bl UnitAddItem
_0801DB3E:
	movs r0, #0x37
_0801DB40:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DB48: .4byte 0x08B857F8
_0801DB4C: .4byte 0x0203A85C
_0801DB50: .4byte 0x03004690
_0801DB54: .4byte 0x0202BBB8
