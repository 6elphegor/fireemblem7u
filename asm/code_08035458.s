	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08035458
sub_08035458: @ 0x08035458
	push {r4, lr}
	ldr r4, _08035480 @ =0x03004690
	ldr r2, [r4]
	ldr r3, _08035484 @ =0x0203A97C
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _08035488 @ =0x0203A85C
	movs r1, #0x17
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl DoItemAction
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08035480: .4byte 0x03004690
_08035484: .4byte 0x0203A97C
_08035488: .4byte 0x0203A85C
