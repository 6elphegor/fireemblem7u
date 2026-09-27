	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A454
sub_0807A454: @ 0x0807A454
	push {lr}
	ldr r1, _0807A478 @ =0x0202BBF8
	movs r0, #8
	ldrb r2, [r1, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _0807A46E
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0807A474
_0807A46E:
	movs r0, #4
	bl FadeBgmOut
_0807A474:
	pop {r0}
	bx r0
	.align 2, 0
_0807A478: .4byte 0x0202BBF8
