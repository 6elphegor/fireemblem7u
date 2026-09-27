	.include "macro.inc"

	.syntax unified

	thumb_func_start WmMergeMonsters
WmMergeMonsters: @ 0x080B3BE8
	push {lr}
	ldr r0, _080B3C00 @ =0x08CE7630
	bl Proc_Find
	cmp r0, #0
	beq _080B3BFC
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080B3BFC:
	pop {r0}
	bx r0
	.align 2, 0
_080B3C00: .4byte 0x08CE7630
