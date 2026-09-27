	.include "macro.inc"

	.syntax unified

	thumb_func_start IsSubtitleHelpActive
IsSubtitleHelpActive: @ 0x080327AC
	push {lr}
	ldr r0, _080327C0 @ =0x08B96A14
	bl Proc_Find
	cmp r0, #0
	beq _080327BA
	movs r0, #1
_080327BA:
	pop {r1}
	bx r1
	.align 2, 0
_080327C0: .4byte 0x08B96A14
