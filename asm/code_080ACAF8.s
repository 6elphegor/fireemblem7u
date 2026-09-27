	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACAF8
sub_080ACAF8: @ 0x080ACAF8
	push {r4, r5, lr}
	ldr r5, _080ACB60 @ =0x0202BBF8
	movs r2, #0x40
	adds r0, r2, #0
	ldrb r1, [r5, #0x14]
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	ldrb r1, [r5, #0x1b]
	cmp r1, #1
	bne _080ACB1A
	movs r0, #0x10
	orrs r4, r0
_080ACB1A:
	cmp r1, #2
	bne _080ACB22
	movs r0, #0x20
	orrs r4, r0
_080ACB22:
	cmp r1, #3
	bne _080ACB28
	orrs r4, r2
_080ACB28:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl PutChapterTitlePalette
	adds r0, r4, #0
	movs r1, #0x19
	bl PutChapterTitlePalette
	bl EnablePalSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl PutChapterTitleBG
	movs r4, #0xb4
	lsls r4, r4, #4
	adds r0, r5, #0
	bl GetChapterTitle
	adds r1, r0, #0
	adds r0, r4, #0
	bl PutChapterTitleGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACB60: .4byte 0x0202BBF8
