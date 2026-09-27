	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitStatusText
DrawUnitStatusText: @ 0x0803196C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _080319A0 @ =0x0000110A
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080319A0: .4byte 0x0000110A
