	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5FD0
sub_080A5FD0: @ 0x080A5FD0
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080A5FF8 @ =0x06008000
	ldr r5, _080A5FFC @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080A6000 @ =0x0600C000
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A5FF8: .4byte 0x06008000
_080A5FFC: .4byte 0x01000200
_080A6000: .4byte 0x0600C000
