	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B77DC
sub_080B77DC: @ 0x080B77DC
	push {lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080B7806
	ldr r0, _080B780C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B7806
	movs r0, #0
	strb r0, [r2]
	adds r0, r3, #0
	movs r1, #0x32
	bl Proc_Goto
_080B7806:
	pop {r0}
	bx r0
	.align 2, 0
_080B780C: .4byte 0x08B857F8
