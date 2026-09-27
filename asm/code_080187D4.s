	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitMovementCost
GetUnitMovementCost: @ 0x080187D4
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080187EC
	ldr r0, _080187E8 @ =0x08BE3C98
	b _08018812
	.align 2, 0
_080187E8: .4byte 0x08BE3C98
_080187EC:
	ldr r0, _08018804 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blt _0801880E
	cmp r0, #2
	ble _08018808
	cmp r0, #4
	bne _0801880E
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x3c]
	b _08018812
	.align 2, 0
_08018804: .4byte 0x0202BBF8
_08018808:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x40]
	b _08018812
_0801880E:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x38]
_08018812:
	bx lr
