	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B9F4C
sub_080B9F4C: @ 0x080B9F4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9F74 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B9F6C
	movs r0, #1
	rsbs r0, r0, #0
	bl FadeBgmOut
	adds r0, r4, #0
	bl Proc_Break
_080B9F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F74: .4byte 0x08B857F8
