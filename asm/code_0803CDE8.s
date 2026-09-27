	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803CDE8
sub_0803CDE8: @ 0x0803CDE8
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _0803CE28 @ =0x08B98AEC
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
_0803CDF6:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0803CE00
	adds r2, #1
_0803CE00:
	adds r1, #1
	cmp r1, #3
	ble _0803CDF6
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _0803CE12
	cmp r2, #2
	beq _0803CE22
_0803CE12:
	cmp r0, #7
	bne _0803CE1A
	cmp r2, #3
	beq _0803CE22
_0803CE1A:
	cmp r0, #0xf
	bne _0803CE2C
	cmp r2, #4
	bne _0803CE2C
_0803CE22:
	movs r0, #1
	b _0803CE2E
	.align 2, 0
_0803CE28: .4byte 0x08B98AEC
_0803CE2C:
	movs r0, #0
_0803CE2E:
	pop {r4}
	pop {r1}
	bx r1
