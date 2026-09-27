	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxClasschgOBJMain
EfxClasschgOBJMain: @ 0x08068788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
