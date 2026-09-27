	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086368
sub_08086368: @ 0x08086368
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08086390 @ =0x08405170
	ldr r1, _08086394 @ =0x06015000
	bl Decompress
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086390: .4byte 0x08405170
_08086394: .4byte 0x06015000
