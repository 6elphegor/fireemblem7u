	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawUnitHpText
DrawUnitHpText: @ 0x08031858
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ClearText
	ldr r0, _080318B0 @ =0x000010F4
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertDrawString
	ldr r0, _080318B4 @ =0x000012B0
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080318B0: .4byte 0x000010F4
_080318B4: .4byte 0x000012B0
