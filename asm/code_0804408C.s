	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804408C
sub_0804408C: @ 0x0804408C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080440A8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080440A4
	adds r0, r2, #0
	bl Proc_Break
_080440A4:
	pop {r0}
	bx r0
	.align 2, 0
_080440A8: .4byte 0x08B857F8
