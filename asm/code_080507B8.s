	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxTmFill
EfxTmFill: @ 0x080507B8
	push {lr}
	sub sp, #4
	ldr r1, _080507D0 @ =0x0201D41C
	str r0, [sp]
	ldr r2, _080507D4 @ =0x05000948
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080507D0: .4byte 0x0201D41C
_080507D4: .4byte 0x05000948
