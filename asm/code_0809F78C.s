	.include "macro.inc"

	.syntax unified

	thumb_func_start EraseLinkArenaStruct2
EraseLinkArenaStruct2: @ 0x0809F78C
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F7AC @ =0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteLinkArenaStruct2
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0809F7AC: .4byte 0x0100000A
