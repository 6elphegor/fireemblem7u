	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitConText
DrawUnitConText: @ 0x080318B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ClearText
	ldr r0, _080318FC @ =0x00001107
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, [r4, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r3, r0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080318FC: .4byte 0x00001107
