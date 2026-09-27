	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUiSpinningArrowConfig
SetUiSpinningArrowConfig: @ 0x080A8D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A8D6C @ =0x08CE4A40
	bl Proc_Find
	cmp r0, #0
	beq _080A8D64
	str r4, [r0, #0x30]
_080A8D64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8D6C: .4byte 0x08CE4A40
