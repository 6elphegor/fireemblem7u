	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcEventWrapAnim_End
ProcEventWrapAnim_End: @ 0x080209C4
	push {lr}
	ldr r0, _080209EC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080209D8
	movs r0, #0xb5
	bl m4aSongNumStart
_080209D8:
	ldr r0, _080209F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080209EC: .4byte 0x0202BBF8
_080209F0: .4byte 0x02022C60
