	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D7E0
sub_0807D7E0: @ 0x0807D7E0
	push {lr}
	movs r0, #0x70
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D7FC
	ldr r0, _0807D7F8 @ =0x08CDB3C8
	bl LoadUnit
	b _0807D802
	.align 2, 0
_0807D7F8: .4byte 0x08CDB3C8
_0807D7FC:
	ldr r0, _0807D808 @ =0x08CDB3E8
	bl LoadUnit
_0807D802:
	pop {r0}
	bx r0
	.align 2, 0
_0807D808: .4byte 0x08CDB3E8
