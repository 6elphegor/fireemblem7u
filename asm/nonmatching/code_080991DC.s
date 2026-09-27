	.include "macro.inc"

	.syntax unified

	thumb_func_start StartFortuneSubMenu
StartFortuneSubMenu: @ 0x080991DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080991F4 @ =0x08CC4FE0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080991F4: .4byte 0x08CC4FE0
