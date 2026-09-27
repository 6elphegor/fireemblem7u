	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMapMenu_DisplayInfoIdle
DebugMapMenu_DisplayInfoIdle: @ 0x0801B61C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801B660 @ =0x08B9333C
	bl Proc_Find
	adds r2, r0, #0
	ldr r0, _0801B664 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x31
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801B656
	adds r0, r2, #0
	adds r0, #0x66
	movs r1, #1
	ldrh r2, [r0]
	eors r1, r2
	strh r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl DebugMapMenu_DisplayInfoDraw
	movs r0, #1
	rsbs r0, r0, #0
	movs r1, #9
	bl SetupDebugFontForOBJ
_0801B656:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801B660: .4byte 0x08B9333C
_0801B664: .4byte 0x08B857F8
