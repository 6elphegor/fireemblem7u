	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_CallPostChapterSaveMenu
GC_CallPostChapterSaveMenu: @ 0x08012A08
	push {lr}
	adds r1, r0, #0
	ldr r0, _08012A20 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _08012A1A
	adds r0, r1, #0
	bl sub_080A4E0C
_08012A1A:
	pop {r0}
	bx r0
	.align 2, 0
_08012A20: .4byte 0x0202BBF8
