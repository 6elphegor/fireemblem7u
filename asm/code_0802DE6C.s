	.include "macro.inc"

	.syntax unified

	thumb_func_start EnableTilesetPalAnim
EnableTilesetPalAnim: @ 0x0802DE6C
	push {r4, lr}
	ldr r0, _0802DE9C @ =0x08B96158
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0802DE94
	ldr r0, _0802DEA0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldr r1, _0802DEA4 @ =0x08C9C9C8
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_0802DE94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE9C: .4byte 0x08B96158
_0802DEA0: .4byte 0x0202BBF8
_0802DEA4: .4byte 0x08C9C9C8
