	.include "macro.inc"

	.syntax unified

	thumb_func_start AiTalkAction
AiTalkAction: @ 0x08035490
	push {r4, r5, lr}
	ldr r2, _080354CC @ =0x03004690
	ldr r1, [r2]
	ldr r5, _080354D0 @ =0x0203A97C
	ldrb r0, [r5, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _080354C2
	ldrb r0, [r5, #7]
	bl GetUnit
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	ldrb r0, [r5, #8]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl StartCharacterEvent
_080354C2:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080354CC: .4byte 0x03004690
_080354D0: .4byte 0x0203A97C
