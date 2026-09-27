	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08041F94
sub_08041F94: @ 0x08041F94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041FB8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08041FB2
	movs r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_08041FB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041FB8: .4byte 0x08B857F8
