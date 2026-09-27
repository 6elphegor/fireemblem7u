	.include "macro.inc"

	.syntax unified

	thumb_func_start SetSysHandCursorXPos
SetSysHandCursorXPos: @ 0x080A94E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A94FC @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A94F4
	str r4, [r0, #0x2c]
_080A94F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A94FC: .4byte 0x08CE4AC8
