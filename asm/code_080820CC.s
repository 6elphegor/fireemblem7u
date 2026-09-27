	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080820CC
sub_080820CC: @ 0x080820CC
	movs r2, #0
	ldr r1, _080820E4 @ =0x08CC2784
	cmp r0, #0
	beq _080820E0
_080820D4:
	ldrb r3, [r1, #4]
	adds r2, r3, r2
	adds r1, #8
	subs r0, #1
	cmp r0, #0
	bne _080820D4
_080820E0:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_080820E4: .4byte 0x08CC2784
