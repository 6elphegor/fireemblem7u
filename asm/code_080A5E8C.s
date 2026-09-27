	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5E8C
sub_080A5E8C: @ 0x080A5E8C
	push {r4, lr}
	ldr r3, [r3, #0x34]
	movs r4, #0x2f
	strb r2, [r4, r3]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	adds r2, #4
	movs r1, #1
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
