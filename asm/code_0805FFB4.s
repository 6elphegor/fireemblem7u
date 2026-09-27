	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805FFB4
sub_0805FFB4: @ 0x0805FFB4
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _0805FFCC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0805FFCC: .4byte 0x0201774C
