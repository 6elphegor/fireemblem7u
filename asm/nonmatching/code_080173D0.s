	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemEffectiveness
GetItemEffectiveness: @ 0x080173D0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173E4 @ =0x08BE222C
	adds r1, r1, r0
	ldr r0, [r1, #0x10]
	bx lr
	.align 2, 0
_080173E4: .4byte 0x08BE222C
