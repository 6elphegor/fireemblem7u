	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckBmBgfxDone
CheckBmBgfxDone: @ 0x080AA718
	push {lr}
	ldr r0, _080AA728 @ =0x08CE4CB0
	bl Proc_Find
	cmp r0, #0
	bne _080AA72C
	movs r0, #0
	b _080AA72E
	.align 2, 0
_080AA728: .4byte 0x08CE4CB0
_080AA72C:
	movs r0, #1
_080AA72E:
	pop {r1}
	bx r1
	.align 2, 0
