	.include "macro.inc"

	.syntax unified

	thumb_func_start PopupProc_PlaySound
PopupProc_PlaySound: @ 0x0800AAD8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0800AAF6
	ldr r0, _0800AAFC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800AAF6
	ldrh r0, [r1]
	bl m4aSongNumStart
_0800AAF6:
	pop {r0}
	bx r0
	.align 2, 0
_0800AAFC: .4byte 0x0202BBF8
