	.include "macro.inc"

	.syntax unified

	thumb_func_start FinishDamageDisplay
FinishDamageDisplay: @ 0x08032F38
	push {lr}
	bl EndAllMus
	ldr r0, _08032F5C @ =0x0203A3F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08032F56
	ldr r0, _08032F60 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSprite
_08032F56:
	pop {r0}
	bx r0
	.align 2, 0
_08032F5C: .4byte 0x0203A3F0
_08032F60: .4byte 0x0203A85C
