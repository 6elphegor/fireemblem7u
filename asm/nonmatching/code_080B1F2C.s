	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1F2C
sub_080B1F2C: @ 0x080B1F2C
	push {r7, lr}
	mov r7, sp
	bl sub_080B25D0
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1F4A
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x40
	movs r3, #1
	bl sub_080B1FB0
_080B1F4A:
	bl sub_080B25F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B1F64
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x98
	movs r3, #0
	bl sub_080B1FB0
_080B1F64:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
