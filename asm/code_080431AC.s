	.include "macro.inc"

	.syntax unified

	thumb_func_start CallEraseSaveEvent
CallEraseSaveEvent: @ 0x080431AC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080431BC @ =0x08B9981C
	bl StartEventLocking
	pop {r0}
	bx r0
	.align 2, 0
_080431BC: .4byte 0x08B9981C
