	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023498
sub_08023498: @ 0x08023498
	push {lr}
	ldr r0, _080234E4 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080234EC
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	ldr r1, _080234E8 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080234EC
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _080234EC
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _080234EC
	movs r0, #1
	b _080234EE
	.align 2, 0
_080234E4: .4byte 0x03004690
_080234E8: .4byte 0x0202BBB8
_080234EC:
	movs r0, #3
_080234EE:
	pop {r1}
	bx r1
	.align 2, 0
