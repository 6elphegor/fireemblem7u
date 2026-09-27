	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037C44
sub_08037C44: @ 0x08037C44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037C5C @ =AiIsUnitEnemy
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037C5C: .4byte AiIsUnitEnemy
