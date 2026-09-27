	.include "macro.inc"

	.syntax unified

	thumb_func_start InitTextDb
InitTextDb: @ 0x0800549C
	push {r4, lr}
	ldr r2, _080054C0 @ =0x02028D70
	ldr r3, [r2]
	ldrh r2, [r3, #0x12]
	movs r4, #0
	strh r2, [r0]
	strb r1, [r0, #4]
	strb r4, [r0, #6]
	movs r2, #1
	strb r2, [r0, #5]
	strb r4, [r0, #7]
	lsls r1, r1, #1
	ldrh r0, [r3, #0x12]
	adds r1, r0, r1
	strh r1, [r3, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080054C0: .4byte 0x02028D70
