	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPopup2_Loop
ProcPopup2_Loop: @ 0x0801F0D0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0801F0F2
	ldr r0, _0801F0FC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F0F8
_0801F0F2:
	adds r0, r2, #0
	bl Proc_Break
_0801F0F8:
	pop {r0}
	bx r0
	.align 2, 0
_0801F0FC: .4byte 0x08B857F8
