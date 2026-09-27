	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F08C
sub_0800F08C: @ 0x0800F08C
	push {lr}
	ldr r0, _0800F0A8 @ =0x08B90D88
	bl Proc_Find
	cmp r0, #0
	beq _0800F0A2
	adds r0, #0x5e
	movs r1, #2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_0800F0A2:
	pop {r0}
	bx r0
	.align 2, 0
_0800F0A8: .4byte 0x08B90D88
