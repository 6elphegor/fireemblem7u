	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BAA68
sub_080BAA68: @ 0x080BAA68
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002CCC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAA80
	adds r0, r4, #0
	movs r1, #0x14
	bl StartTemporaryLock
	b _080BAA88
_080BAA80:
	adds r0, r4, #0
	movs r1, #0x3c
	bl StartTemporaryLock
_080BAA88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
