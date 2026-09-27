	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DC14
sub_0807DC14: @ 0x0807DC14
	push {lr}
	adds r0, #0x60
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strh r1, [r0, #4]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl InitTalk
	pop {r0}
	bx r0
