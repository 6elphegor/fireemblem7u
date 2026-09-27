	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4F78
sub_080B4F78: @ 0x080B4F78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080B4F98 @ =0x08CE76E8
	bl Proc_Find
	adds r3, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_080B37A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F98: .4byte 0x08CE76E8
