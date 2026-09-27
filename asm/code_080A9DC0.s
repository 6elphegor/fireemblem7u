	.include "macro.inc"

	.syntax unified

	thumb_func_start EndAllProcChildren
EndAllProcChildren: @ 0x080A9DC0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080A9DCE
_080A9DC8:
	adds r0, r4, #0
	bl Proc_End
_080A9DCE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_FindAfterWithParent
	adds r4, r0, #0
	cmp r4, #0
	bne _080A9DC8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
