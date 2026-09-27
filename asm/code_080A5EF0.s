	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5EF0
sub_080A5EF0: @ 0x080A5EF0
	push {lr}
	ldr r0, _080A5F0C @ =0x02000044
	ldr r1, _080A5F10 @ =0x0600C020
	movs r2, #1
	movs r3, #4
	bl InitTextFont
	ldr r0, _080A5F14 @ =0x0200005C
	movs r1, #0xa
	bl InitText
	pop {r0}
	bx r0
	.align 2, 0
_080A5F0C: .4byte 0x02000044
_080A5F10: .4byte 0x0600C020
_080A5F14: .4byte 0x0200005C
