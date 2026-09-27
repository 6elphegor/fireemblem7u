	.include "macro.inc"

	.syntax unified

	thumb_func_start CgTextInterpreter_808FF9C
CgTextInterpreter_808FF9C: @ 0x08088A30
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl CgText_ClearSpriteText
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetCgTextDimensions
	pop {r4}
	pop {r0}
	bx r0
