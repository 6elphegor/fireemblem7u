	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxBerserkCLONE
StartSubSpell_efxBerserkCLONE: @ 0x0805E93C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805E960 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E964 @ =0x08BA354C
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E960: .4byte 0x0201774C
_0805E964: .4byte 0x08BA354C
