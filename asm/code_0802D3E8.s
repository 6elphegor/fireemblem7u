	.include "macro.inc"

	.syntax unified

	thumb_func_start UnlockBmDisplay
UnlockBmDisplay: @ 0x0802D3E8
	push {lr}
	ldr r1, _0802D41C @ =0x0202BBB8
	ldrb r2, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802D418
	subs r0, r2, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D418
	movs r0, #1
	bl Proc_UnblockEachMarked
	ldr r0, _0802D420 @ =0x08B96158
	bl Proc_Find
	cmp r0, #0
	beq _0802D418
	bl Proc_End
	bl StartBmVSync
_0802D418:
	pop {r0}
	bx r0
	.align 2, 0
_0802D41C: .4byte 0x0202BBB8
_0802D420: .4byte 0x08B96158
