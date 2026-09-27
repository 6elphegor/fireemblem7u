	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08085CFC
sub_08085CFC: @ 0x08085CFC
	push {lr}
	bl sub_08085CDC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085D24
	bl sub_08084E70
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08085D18
	movs r0, #2
	b _08085D42
_08085D18:
	bl sub_08084E70
	cmp r0, #1
	bne _08085D40
	movs r0, #1
	b _08085D42
_08085D24:
	bl sub_08084E90
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08085D34
	movs r0, #4
	b _08085D42
_08085D34:
	bl sub_08084E90
	cmp r0, #1
	bne _08085D40
	movs r0, #3
	b _08085D42
_08085D40:
	movs r0, #0
_08085D42:
	pop {r1}
	bx r1
	.align 2, 0
