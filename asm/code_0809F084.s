	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F084
sub_0809F084: @ 0x0809F084
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0809F09C @ =0x01000009
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809F09C: .4byte 0x01000009
