	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B42D4
sub_080B42D4: @ 0x080B42D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _080B42E2
	bl EndMu
_080B42E2:
	ldr r0, [r4, #0x54]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080B42F4
	movs r0, #0
	bl sub_080B2FC0
_080B42F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
