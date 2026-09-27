	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803117C
sub_0803117C: @ 0x0803117C
	push {r4, lr}
	ldr r1, _080311D0 @ =0x0202BBF8
	movs r0, #0x80
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080311CA
	ldr r1, _080311D4 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080311CA
	ldr r0, _080311D8 @ =0x02020140
	bl InitUnitStack
	movs r4, #1
_0803119E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080311C0
	ldr r0, [r2]
	cmp r0, #0
	beq _080311C0
	ldr r0, [r2, #0xc]
	ldr r1, _080311DC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080311C0
	adds r0, r2, #0
	bl PushUnit
_080311C0:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803119E
	bl LoadPlayerUnitsFromUnitStack2
_080311CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080311D0: .4byte 0x0202BBF8
_080311D4: .4byte 0x0202BBB8
_080311D8: .4byte 0x02020140
_080311DC: .4byte 0x0001000C
