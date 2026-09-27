	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DEE4
sub_0803DEE4: @ 0x0803DEE4
	push {r4, lr}
	ldr r0, _0803DEF0 @ =0x0203D90C
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _0803DEF8
	b _0803DF10
	.align 2, 0
_0803DEF0: .4byte 0x0203D90C
_0803DEF4:
	movs r0, #1
	b _0803DF12
_0803DEF8:
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803DF18 @ =0x0203DA78
_0803DEFE:
	adds r0, r3, #0
	ldrb r4, [r1, #0x13]
	ands r0, r4
	cmp r0, #0
	bne _0803DEF4
	adds r1, #0x18
	adds r2, #1
	cmp r2, #9
	ble _0803DEFE
_0803DF10:
	movs r0, #0
_0803DF12:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DF18: .4byte 0x0203DA78
