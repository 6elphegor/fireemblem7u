	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800FD34
sub_0800FD34: @ 0x0800FD34
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FD48
	movs r0, #0
	bl StartNoBoxTalk
_0800FD48:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
