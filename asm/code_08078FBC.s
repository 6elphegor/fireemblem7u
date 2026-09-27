	.include "macro.inc"

	.syntax unified

	thumb_func_start MaybeCallEndEvent_
MaybeCallEndEvent_: @ 0x08078FBC
	push {lr}
	bl MaybeCallEndEvent
	pop {r0}
	bx r0
	.align 2, 0
