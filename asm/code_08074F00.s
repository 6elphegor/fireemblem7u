	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08074F00
sub_08074F00: @ 0x08074F00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x10
	ldr r3, [r7]
	bl StartBgmVolumeChange
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
