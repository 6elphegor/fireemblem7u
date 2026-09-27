	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxMistyrainOBJ2
StartSubSpell_efxMistyrainOBJ2: @ 0x08059740
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059780 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059784 @ =0x08BA1FF4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _08059788 @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059780: .4byte 0x0201774C
_08059784: .4byte 0x08BA1FF4
_08059788: .4byte 0x08BA14DC
