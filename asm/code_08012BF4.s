	.include "macro.inc"

	.syntax unified

	thumb_func_start ForceEnableSounds
ForceEnableSounds: @ 0x08012BF4
	ldr r0, _08012C0C @ =0x0202BBF8
	adds r0, #0x41
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08012C0C: .4byte 0x0202BBF8
