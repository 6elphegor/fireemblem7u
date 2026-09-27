	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080799C8
sub_080799C8: @ 0x080799C8
	push {r4, r5, lr}
	ldr r1, _08079A10 @ =0x0202BBF8
	movs r0, #0x40
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	beq _08079A08
	ldrb r1, [r1, #0x1b]
	cmp r1, #3
	bne _08079A08
	movs r5, #0x81
_080799DE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08079A02
	ldr r0, [r4]
	cmp r0, #0
	beq _08079A02
	ldrb r0, [r0, #4]
	bl sub_08079990
	adds r1, r0, #0
	cmp r1, #0
	beq _08079A02
	adds r0, r4, #0
	bl UnitApplyBonusLevels
_08079A02:
	adds r5, #1
	cmp r5, #0xbf
	ble _080799DE
_08079A08:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079A10: .4byte 0x0202BBF8
