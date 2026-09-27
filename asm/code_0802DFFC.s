	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetBmSt
ResetBmSt: @ 0x0802DFFC
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _0802E020 @ =0x0202BBB8
	movs r5, #1
	ldrsb r5, [r4, r5]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0802E024 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E020: .4byte 0x0202BBB8
_0802E024: .4byte 0x01000020
