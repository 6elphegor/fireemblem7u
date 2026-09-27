	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037C28
sub_08037C28: @ 0x08037C28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08037C40 @ =AiIsUnitEnemy
	bl AiTryDoStaff
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037C40: .4byte AiIsUnitEnemy
