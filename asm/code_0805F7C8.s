	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxLunaSCR2
StartSubSpell_efxLunaSCR2: @ 0x0805F7C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805F7E4 @ =0x08BA37CC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7E4: .4byte 0x08BA37CC
