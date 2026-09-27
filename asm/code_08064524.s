	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCRSubSpell_efxopThunderBGCOL
StartCRSubSpell_efxopThunderBGCOL: @ 0x08064524
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806454C @ =0x08BA48C8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl SetActiveCRSpellBgColorProc
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08064550 @ =0x081E9874
	str r0, [r4, #0x48]
	ldr r0, _08064554 @ =0x081FBD70
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806454C: .4byte 0x08BA48C8
_08064550: .4byte 0x081E9874
_08064554: .4byte 0x081FBD70
