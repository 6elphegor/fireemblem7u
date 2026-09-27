	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08028010
sub_08028010: @ 0x08028010
	push {lr}
	ldr r0, _08028030 @ =0x08B94214
	movs r1, #3
	bl Proc_Start
	ldr r0, _08028034 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802802C
	ldr r0, _08028038 @ =0x0000038A
	bl m4aSongNumStart
_0802802C:
	pop {r0}
	bx r0
	.align 2, 0
_08028030: .4byte 0x08B94214
_08028034: .4byte 0x0202BBF8
_08028038: .4byte 0x0000038A
