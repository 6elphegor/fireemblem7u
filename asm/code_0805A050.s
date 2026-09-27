	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpellAnimPurge
StartSpellAnimPurge: @ 0x0805A050
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SetBG1Position
	ldr r0, _0805A08C @ =0x08BA23F0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, _0805A090 @ =0x02020038
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A08C: .4byte 0x08BA23F0
_0805A090: .4byte 0x02020038
