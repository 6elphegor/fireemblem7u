	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntroDeamon_Loop
ChapterIntroDeamon_Loop: @ 0x0801F2F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F344 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0801F316
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801F312
	adds r1, r4, #0
	adds r1, #0x50
_0801F312:
	movs r0, #1
	strh r0, [r1]
_0801F316:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0801F33E
	ldr r2, [r4, #0x14]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0801F33E
	adds r1, r0, #0
	adds r0, r2, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_End
_0801F33E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F344: .4byte 0x08B857F8
