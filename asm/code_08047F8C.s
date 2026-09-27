	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047F8C
sub_08047F8C: @ 0x08047F8C
	push {lr}
	lsls r0, r0, #5
	ldr r1, _08047FA4 @ =0x081C8004
	adds r0, r0, r1
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_08047FA4: .4byte 0x081C8004
