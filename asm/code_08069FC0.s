	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxLvupOBJ2CallBack
EfxLvupOBJ2CallBack: @ 0x08069FC0
	push {lr}
	ldr r0, [r0, #0x64]
	bl AnimDelete
	pop {r0}
	bx r0
