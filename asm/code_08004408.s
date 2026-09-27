	.include "macro.inc"

	.syntax unified

	thumb_func_start MapFloodCoreRam
MapFloodCoreRam: @ 0x08004408
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _0800441C @ =0x03002918
	ldr r4, [r0]
	bl _call_via_r4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800441C: .4byte 0x03002918
