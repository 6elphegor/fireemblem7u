	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearSupplyItems
ClearSupplyItems: @ 0x0802E708
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0802E724 @ =0x0203A720
	ldr r2, _0802E728 @ =0x01000064
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0802E724: .4byte 0x0203A720
_0802E728: .4byte 0x01000064
