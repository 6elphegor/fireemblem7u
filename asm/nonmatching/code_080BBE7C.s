	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBE7C
sub_080BBE7C: @ 0x080BBE7C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_080BBC5C
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BBEA8 @ =0x08600604
	ldr r2, _080BBEAC @ =0x0000FFFF
	str r2, [sp]
	movs r2, #8
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0
	movs r3, #0x10
	bl sub_080BD1DC
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBEA8: .4byte 0x08600604
_080BBEAC: .4byte 0x0000FFFF
