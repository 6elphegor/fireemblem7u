	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021898
sub_08021898: @ 0x08021898
	push {lr}
	ldr r0, _080218D0 @ =0x03004690
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080218D8
	ldr r1, _080218D4 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080218D8
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _080218D8
	adds r0, r3, #0
	bl sub_08023F64
	bl CountTargets
	cmp r0, #0
	beq _080218D8
	movs r0, #1
	b _080218DA
	.align 2, 0
_080218D0: .4byte 0x03004690
_080218D4: .4byte 0x0202BBB8
_080218D8:
	movs r0, #3
_080218DA:
	pop {r1}
	bx r1
	.align 2, 0
