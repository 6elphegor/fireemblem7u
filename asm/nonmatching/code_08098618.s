	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098618
sub_08098618: @ 0x08098618
	ldr r0, _08098644 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _08098628
	movs r2, #0
_08098628:
	cmp r2, #0xc
	bne _08098632
	ldr r1, _08098648 @ =0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_08098632:
	cmp r2, #0x34
	beq _0809863A
	cmp r2, #0
	bne _08098642
_0809863A:
	ldr r1, _08098648 @ =0x04000050
	ldr r2, _0809864C @ =0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_08098642:
	bx lr
	.align 2, 0
_08098644: .4byte 0x04000006
_08098648: .4byte 0x04000050
_0809864C: .4byte 0x00000242
