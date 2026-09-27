	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayMoveRangeGraphics
DisplayMoveRangeGraphics: @ 0x0801D2A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801D2BC @ =0x08B935B4
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0801D2C0
	bl MoveLimitView_OnInit
	movs r0, #0
	bl MoveLimitViewChange_OnInit
	b _0801D2CC
	.align 2, 0
_0801D2BC: .4byte 0x08B935B4
_0801D2C0:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Start
	adds r0, #0x4a
	strh r5, [r0]
_0801D2CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
