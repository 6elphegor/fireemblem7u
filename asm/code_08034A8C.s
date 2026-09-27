	.include "macro.inc"

	.syntax unified

	thumb_func_start CpOrderFunc_BeginDecide
CpOrderFunc_BeginDecide: @ 0x08034A8C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl BuildAiUnitList
	adds r4, r0, #0
	cmp r4, #0
	beq _08034AB6
	bl SortAiUnitList
	ldr r0, _08034ABC @ =0x0203A8EC
	adds r2, r4, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _08034AC0 @ =0x030047A0
	ldr r0, _08034AC4 @ =AiDecideMain
	str r0, [r1]
	ldr r0, _08034AC8 @ =0x08B96F44
	adds r1, r5, #0
	bl Proc_StartBlocking
_08034AB6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034ABC: .4byte 0x0203A8EC
_08034AC0: .4byte 0x030047A0
_08034AC4: .4byte AiDecideMain
_08034AC8: .4byte 0x08B96F44
