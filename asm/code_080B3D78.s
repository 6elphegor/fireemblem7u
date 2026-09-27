	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3D78
sub_080B3D78: @ 0x080B3D78
	push {lr}
	ldr r0, _080B3D9C @ =0x08CE7650
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080B3D98
	ldr r1, _080B3DA0 @ =0x02000814
	movs r0, #1
	ldrb r3, [r1]
	eors r0, r3
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080B3D98:
	pop {r0}
	bx r0
	.align 2, 0
_080B3D9C: .4byte 0x08CE7650
_080B3DA0: .4byte 0x02000814
