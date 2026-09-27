	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013604
sub_08013604: @ 0x08013604
	push {lr}
	sub sp, #0x10
	ldr r1, _08013620 @ =0x08193E20
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	mov r0, sp
	bl sub_08013604
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_08013620: .4byte 0x08193E20
