	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxExcaliburSCR
StartSubSpell_efxExcaliburSCR: @ 0x08060160
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08060180 @ =0x08BA3A1C
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl StartSubSpell_efxExcaliburSCR2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060180: .4byte 0x08BA3A1C
