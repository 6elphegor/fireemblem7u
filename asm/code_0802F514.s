	.include "macro.inc"

	.syntax unified

	thumb_func_start ActionTalk
ActionTalk: @ 0x0802F514
	push {r4, r5, lr}
	ldr r4, _0802F53C @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl StartCharacterEvent
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F53C: .4byte 0x0203A85C
