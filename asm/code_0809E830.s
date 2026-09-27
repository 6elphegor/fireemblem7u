	.include "macro.inc"

	.syntax unified

	thumb_func_start EraseSaveBlockInfo
EraseSaveBlockInfo: @ 0x0809E830
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r4, #6
	bgt _0809E85C
	add r0, sp, #0x10
	ldr r2, _0809E864 @ =0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _0809E868 @ =0x01000008
	mov r1, sp
	bl CpuSet
	ldr r1, _0809E86C @ =0x08CE3B58
	lsls r0, r4, #4
	adds r0, #0x64
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x10
	bl WriteAndVerifySramFast
_0809E85C:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E864: .4byte 0x0000FFFF
_0809E868: .4byte 0x01000008
_0809E86C: .4byte 0x08CE3B58
