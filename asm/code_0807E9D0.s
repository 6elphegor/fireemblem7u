	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E9D0
sub_0807E9D0: @ 0x0807E9D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E9FC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807E9E8
	movs r0, #0xbf
	lsls r0, r0, #2
	bl m4aSongNumStart
_0807E9E8:
	movs r0, #1
	movs r1, #2
	movs r2, #8
	adds r3, r4, #0
	bl StartFlameBreathfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9FC: .4byte 0x0202BBF8
