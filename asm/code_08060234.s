	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxExcaliburSCR2
StartSubSpell_efxExcaliburSCR2: @ 0x08060234
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08060250 @ =0x08BA3A34
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060250: .4byte 0x08BA3A34
