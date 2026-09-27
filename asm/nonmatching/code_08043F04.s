	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043F04
sub_08043F04: @ 0x08043F04
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x54]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	bne _08043F16
	adds r0, r1, #0
	bl Proc_Break
_08043F16:
	pop {r0}
	bx r0
	.align 2, 0
