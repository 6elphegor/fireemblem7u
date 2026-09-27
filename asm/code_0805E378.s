	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxSleepOBJ2
StartSubSpell_efxSleepOBJ2: @ 0x0805E378
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E3B0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E3B4 @ =0x08BA33FC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E3B8 @ =0x08BCC060
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3B0: .4byte 0x0201774C
_0805E3B4: .4byte 0x08BA33FC
_0805E3B8: .4byte 0x08BCC060
