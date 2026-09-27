	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCAFC
sub_080BCAFC: @ 0x080BCAFC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080BCB14 @ =0x06014000
	ldr r2, _080BCB18 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BCB14: .4byte 0x06014000
_080BCB18: .4byte 0x01000200
