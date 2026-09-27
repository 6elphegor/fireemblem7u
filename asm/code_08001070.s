	.include "macro.inc"

	.syntax unified

	thumb_func_start DisablePalSync
DisablePalSync: @ 0x08001070
	push {r7, lr}
	mov r7, sp
	ldr r0, _08001080 @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001080: .4byte 0x0300000D
