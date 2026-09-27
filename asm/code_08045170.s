	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045170
sub_08045170: @ 0x08045170
	push {lr}
	adds r2, r0, #0
	ldr r0, _08045190 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804518A
	adds r0, r2, #0
	bl Proc_Break
_0804518A:
	pop {r0}
	bx r0
	.align 2, 0
_08045190: .4byte 0x08B857F8
