	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806037C
sub_0806037C: @ 0x0806037C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060394 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_08060394: .4byte 0x0201774C
