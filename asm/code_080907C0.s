	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepMuralBackground
EndPrepMuralBackground: @ 0x080907C0
	push {lr}
	ldr r0, _080907D0 @ =0x08CC436C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080907D0: .4byte 0x08CC436C
