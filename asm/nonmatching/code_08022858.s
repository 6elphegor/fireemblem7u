	.include "macro.inc"

	.syntax unified

	thumb_func_start BallistaRangeMenu_Select
BallistaRangeMenu_Select: @ 0x08022858
	push {lr}
	bl ClearUi
	ldr r1, _08022878 @ =0x0203A85C
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _0802287C @ =0x03004690
	ldr r0, [r0]
	bl FillBallistaRangeMaybe
	ldr r0, _08022880 @ =0x08B95C98
	bl StartMapSelect
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_08022878: .4byte 0x0203A85C
_0802287C: .4byte 0x03004690
_08022880: .4byte 0x08B95C98
