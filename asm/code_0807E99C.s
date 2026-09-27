	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E99C
sub_0807E99C: @ 0x0807E99C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9C8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9B2
	ldr r0, _0807E9CC @ =0x000002FB
	bl m4aSongNumStart
_0807E9B2:
	movs r1, #6
	rsbs r1, r1, #0
	movs r0, #0
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9C8: .4byte 0x0202BBF8
_0807E9CC: .4byte 0x000002FB
