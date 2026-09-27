	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080462A4
sub_080462A4: @ 0x080462A4
	push {lr}
	ldr r0, _080462D0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080462CC
	ldr r0, _080462D4 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd4
	strb r1, [r0]
	ldr r1, _080462D8 @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
_080462CC:
	pop {r0}
	bx r0
	.align 2, 0
_080462D0: .4byte 0x08B857F8
_080462D4: .4byte 0x0300479C
_080462D8: .4byte 0x08B98AEC
