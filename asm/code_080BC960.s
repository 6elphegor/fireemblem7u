	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC960
sub_080BC960: @ 0x080BC960
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Sound_SetMaxNumChannels
	ldr r0, _080BC98C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BC97C
	movs r0, #0x62
	bl m4aSongNumStart
_080BC97C:
	ldr r0, _080BC990 @ =0x08CEF284
	adds r1, r4, #0
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC98C: .4byte 0x0202BBF8
_080BC990: .4byte 0x08CEF284
