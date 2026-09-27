	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807682C
sub_0807682C: @ 0x0807682C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	bl StartManimSpellAssocFadeExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
