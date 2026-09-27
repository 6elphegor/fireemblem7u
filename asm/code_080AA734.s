	.include "macro.inc"

	.syntax unified

	thumb_func_start BmBgfxAdvance
BmBgfxAdvance: @ 0x080AA734
	push {lr}
	ldr r0, _080AA754 @ =0x08CE4CB0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AA74E
	ldr r0, [r1, #0x2c]
	ldrb r2, [r0]
	cmp r2, #6
	bne _080AA74E
	adds r0, #0xc
	str r0, [r1, #0x2c]
_080AA74E:
	pop {r0}
	bx r0
	.align 2, 0
_080AA754: .4byte 0x08CE4CB0
