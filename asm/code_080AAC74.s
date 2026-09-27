	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAC74
sub_080AAC74: @ 0x080AAC74
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AACA8 @ =0x08B857F8
	ldr r1, [r0]
	ldr r0, _080AACAC @ =0x0000030B
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AACA2
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, _080AACB0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AAC9E
	ldr r0, _080AACB4 @ =0x00000391
	bl m4aSongNumStart
_080AAC9E:
	bl CloseHelpBox
_080AACA2:
	pop {r0}
	bx r0
	.align 2, 0
_080AACA8: .4byte 0x08B857F8
_080AACAC: .4byte 0x0000030B
_080AACB0: .4byte 0x0202BBF8
_080AACB4: .4byte 0x00000391
