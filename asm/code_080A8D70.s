	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUiSpinningArrowPositions
SetUiSpinningArrowPositions: @ 0x080A8D70
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080A8D94 @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D8C
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080A8D8C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D94: .4byte 0x08CE4A40
