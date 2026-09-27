	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEfxHPBarColorChange
EndEfxHPBarColorChange: @ 0x0804F46C
	push {lr}
	ldr r0, _0804F47C @ =0x0201777C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0804F47C: .4byte 0x0201777C
