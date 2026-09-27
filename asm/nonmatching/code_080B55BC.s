	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B55BC
sub_080B55BC: @ 0x080B55BC
	push {lr}
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080B55DA
	ldr r0, _080B55E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrh r0, [r0, #0x26]
	movs r1, #0
	bl StartBgm
_080B55DA:
	pop {r0}
	bx r0
	.align 2, 0
_080B55E0: .4byte 0x0202BBF8
