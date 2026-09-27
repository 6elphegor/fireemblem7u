	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxMistyRainOBJ
StartSubSpell_efxMistyRainOBJ: @ 0x080596FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08059734 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059738 @ =0x08BA1FAC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _0805973C @ =0x08BA14DC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059734: .4byte 0x0201774C
_08059738: .4byte 0x08BA1FAC
_0805973C: .4byte 0x08BA14DC
