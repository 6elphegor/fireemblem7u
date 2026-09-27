	.include "macro.inc"

	.syntax unified

	thumb_func_start SpellFx_ClearBG1
SpellFx_ClearBG1: @ 0x08050018
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08050038 @ =0x02023460
	ldr r2, _0805003C @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08050038: .4byte 0x02023460
_0805003C: .4byte 0x01000200
