	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080730C8
sub_080730C8: @ 0x080730C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl PlaySeSpacial
	ldr r1, _080730F0 @ =0x08270258
	adds r0, r1, #0
	movs r1, #0x80
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730F0: .4byte 0x08270258
