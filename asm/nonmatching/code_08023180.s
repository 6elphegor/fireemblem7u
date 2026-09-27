	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023180
sub_08023180: @ 0x08023180
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _080231A4
	ldr r1, _080231A0 @ =0x0203A85C
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080231AE
	.align 2, 0
_080231A0: .4byte 0x0203A85C
_080231A4:
	ldr r1, _080231B4 @ =0x0000073F
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080231AE:
	pop {r1}
	bx r1
	.align 2, 0
_080231B4: .4byte 0x0000073F
