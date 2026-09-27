	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBmSupply
StartBmSupply: @ 0x080974CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080974E8 @ =0x08CC4C74
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080974E8: .4byte 0x08CC4C74
