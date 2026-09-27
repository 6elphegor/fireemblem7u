	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079C08
sub_08079C08: @ 0x08079C08
	ldr r0, _08079C1C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	bne _08079C20
	movs r0, #0
	b _08079C22
	.align 2, 0
_08079C1C: .4byte 0x08B857F8
_08079C20:
	movs r0, #1
_08079C22:
	bx lr
