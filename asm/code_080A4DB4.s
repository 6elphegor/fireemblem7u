	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMainMenu
StartMainMenu: @ 0x080A4DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4DE4 @ =0x08CE3C54
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080A4DE8 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080A4DE4: .4byte 0x08CE3C54
_080A4DE8: .4byte 0x0202BBF8
