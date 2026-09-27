	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DB24
sub_0803DB24: @ 0x0803DB24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0803DB64 @ =0x0300479C
	movs r2, #0
	movs r1, #0xd9
	strb r1, [r0]
	ldr r4, _0803DB68 @ =0x08B98AEC
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
	bne _0803DB5E
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
_0803DB5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DB64: .4byte 0x0300479C
_0803DB68: .4byte 0x08B98AEC
