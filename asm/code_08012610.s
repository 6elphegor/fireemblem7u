	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_InitSramResetScreen
GC_InitSramResetScreen: @ 0x08012610
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r2, _08012640 @ =0x0202BBF8
	adds r2, #0x40
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #3
	movs r1, #0
	bl StartMuralBackgroundAlt
	pop {r0}
	bx r0
	.align 2, 0
_08012640: .4byte 0x0202BBF8
