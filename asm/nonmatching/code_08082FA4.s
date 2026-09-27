	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082FA4
sub_08082FA4: @ 0x08082FA4
	push {lr}
	adds r2, r0, #0
	ldr r0, _08082FC0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08082FBC
	adds r0, r2, #0
	bl Proc_Break
_08082FBC:
	pop {r0}
	bx r0
	.align 2, 0
_08082FC0: .4byte 0x08B857F8
