	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemNameWithArticle
GetItemNameWithArticle: @ 0x080171E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r5, #0xff
	ands r5, r4
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08017228 @ =0x08BE222C
	adds r0, r0, r1
	ldrh r0, [r0]
	bl DecodeMsg
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	cmp r5, #0x36
	bgt _08017218
	cmp r5, #0x34
	blt _08017218
	movs r1, #1
_08017218:
	lsls r2, r6, #0x18
	asrs r2, r2, #0x18
	movs r0, #1
	bl sub_08012F14
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017228: .4byte 0x08BE222C
