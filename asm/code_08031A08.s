	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitResUnkText
DrawUnitResUnkText: @ 0x08031A08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _08031A3C @ =0x000010FF
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031A3C: .4byte 0x000010FF
