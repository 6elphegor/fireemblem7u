	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitResChangeText
DrawUnitResChangeText: @ 0x080319A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl ClearText
	ldr r0, _08031A00 @ =0x000010FF
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _08031A04 @ =0x000012B1
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r3, r3, r6
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031A00: .4byte 0x000010FF
_08031A04: .4byte 0x000012B1
