	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEkrTogiColor
EndEkrTogiColor: @ 0x0805583C
	push {lr}
	ldr r0, _0805584C @ =0x0201FB18
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805584C: .4byte 0x0201FB18
