	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2F0C
sub_080B2F0C: @ 0x080B2F0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x47
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
