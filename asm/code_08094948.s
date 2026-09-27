	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepItemTradeScreenProc
StartPrepItemTradeScreenProc: @ 0x08094948
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _08094968 @ =0x08CC49E4
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094968: .4byte 0x08CC49E4
