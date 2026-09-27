	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F668
sub_0809F668: @ 0x0809F668
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _0809F688 @ =0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl WriteSoundRoomSaveData
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_0809F688: .4byte 0x01000012
