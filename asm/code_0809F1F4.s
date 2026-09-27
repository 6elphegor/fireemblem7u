	.include "macro.inc"

	.syntax unified

	thumb_func_start EraseSaveRankData
EraseSaveRankData: @ 0x0809F1F4
	push {lr}
	sub sp, #0x98
	add r0, sp, #0x94
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F214 @ =0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl SaveRankings
	add sp, #0x98
	pop {r0}
	bx r0
	.align 2, 0
_0809F214: .4byte 0x0100004A
