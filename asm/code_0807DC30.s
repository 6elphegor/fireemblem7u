	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DC30
sub_0807DC30: @ 0x0807DC30
	adds r3, r0, #0
	ldr r1, _0807DC48 @ =0x08CBF3AC
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DC56
	adds r2, r1, #0
_0807DC3C:
	ldr r0, [r2]
	cmp r3, r0
	bne _0807DC4C
	ldr r0, [r1, #4]
	b _0807DC58
	.align 2, 0
_0807DC48: .4byte 0x08CBF3AC
_0807DC4C:
	adds r1, #8
	adds r2, #8
	ldr r0, [r1]
	cmp r0, #0
	bne _0807DC3C
_0807DC56:
	movs r0, #0
_0807DC58:
	bx lr
	.align 2, 0
