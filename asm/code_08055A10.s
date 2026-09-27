	.include "macro.inc"

	.syntax unified

	thumb_func_start NewDummvRST
NewDummvRST: @ 0x08055A10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08055A38 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08055A3C @ =0x08BA151C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055A38: .4byte 0x0201774C
_08055A3C: .4byte 0x08BA151C
