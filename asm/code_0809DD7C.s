	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809DD7C
sub_0809DD7C: @ 0x0809DD7C
	adds r3, r0, #0
	movs r2, #0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0809DDA2
	ldrh r3, [r3]
_0809DD8A:
	ldrh r0, [r1]
	cmp r0, r3
	bne _0809DD96
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _0809DDA4
_0809DD96:
	adds r1, #2
	adds r2, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0809DD8A
_0809DDA2:
	ldr r0, _0809DDA8 @ =0x0000FFFF
_0809DDA4:
	bx lr
	.align 2, 0
_0809DDA8: .4byte 0x0000FFFF
