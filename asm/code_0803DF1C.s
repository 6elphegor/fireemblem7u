	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DF1C
sub_0803DF1C: @ 0x0803DF1C
	push {r4, lr}
	movs r2, #0
	movs r3, #0x80
	ldr r1, _0803DF34 @ =0x0203DA78
_0803DF24:
	adds r0, r3, #0
	ldrb r4, [r1, #0x13]
	ands r0, r4
	cmp r0, #0
	bne _0803DF38
	movs r0, #1
	b _0803DF42
	.align 2, 0
_0803DF34: .4byte 0x0203DA78
_0803DF38:
	adds r1, #0x18
	adds r2, #1
	cmp r2, #9
	ble _0803DF24
	movs r0, #0
_0803DF42:
	pop {r4}
	pop {r1}
	bx r1
