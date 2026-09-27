	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804307C
sub_0804307C: @ 0x0804307C
	push {r4, lr}
	ldr r0, _080430A8 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _080430AC @ =0x08B98AEC
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_0803CE34
	ldr r4, [r4]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	ands r0, r1
	ldrb r1, [r4, #9]
	cmp r0, r1
	beq _080430B0
	movs r0, #1
	b _080430BC
	.align 2, 0
_080430A8: .4byte 0x0300479C
_080430AC: .4byte 0x08B98AEC
_080430B0:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
_080430BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
