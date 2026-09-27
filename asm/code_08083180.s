	.include "macro.inc"

	.syntax unified

	thumb_func_start BoxTalkActive
BoxTalkActive: @ 0x08083180
	push {lr}
	ldr r0, _08083190 @ =0x08CC2A4C
	bl Proc_Find
	cmp r0, #0
	bne _08083194
	movs r0, #0
	b _08083196
	.align 2, 0
_08083190: .4byte 0x08CC2A4C
_08083194:
	movs r0, #1
_08083196:
	pop {r1}
	bx r1
	.align 2, 0
