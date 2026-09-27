	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013A1C
sub_08013A1C: @ 0x08013A1C
	push {lr}
	ldr r0, _08013A2C @ =0x08B928DC
	bl Proc_Find
	cmp r0, #0
	bne _08013A30
	movs r0, #0
	b _08013A32
	.align 2, 0
_08013A2C: .4byte 0x08B928DC
_08013A30:
	movs r0, #1
_08013A32:
	pop {r1}
	bx r1
	.align 2, 0
