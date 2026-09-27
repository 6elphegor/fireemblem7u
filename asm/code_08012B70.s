	.include "macro.inc"

	.syntax unified

	thumb_func_start HasNextChapter
HasNextChapter: @ 0x08012B70
	push {lr}
	bl GetGameControl
	adds r1, r0, #0
	adds r1, #0x2a
	ldrb r2, [r1]
	rsbs r0, r2, #0
	orrs r0, r2
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
