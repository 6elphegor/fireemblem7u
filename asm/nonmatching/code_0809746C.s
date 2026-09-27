	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepItemSupplyProc
StartPrepItemSupplyProc: @ 0x0809746C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097484 @ =0x08CC4B94
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097484: .4byte 0x08CC4B94
