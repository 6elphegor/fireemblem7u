	.include "macro.inc"

	.syntax unified

	thumb_func_start BmBgfxSetLoopEN
BmBgfxSetLoopEN: @ 0x080AA76C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AA788 @ =0x08CE4CB0
	bl Proc_Find
	cmp r0, #0
	beq _080AA780
	adds r0, #0x3a
	strb r4, [r0]
_080AA780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA788: .4byte 0x08CE4CB0
