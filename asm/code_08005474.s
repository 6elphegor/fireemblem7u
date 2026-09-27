	.include "macro.inc"

	.syntax unified

	thumb_func_start InitText
InitText: @ 0x08005474
	push {r4, lr}
	ldr r2, _08005498 @ =0x02028D70
	ldr r4, [r2]
	ldrh r3, [r4, #0x12]
	movs r2, #0
	strh r3, [r0]
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r2, [r4, #0x12]
	adds r1, r2, r1
	strh r1, [r4, #0x12]
	bl ClearText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005498: .4byte 0x02028D70
