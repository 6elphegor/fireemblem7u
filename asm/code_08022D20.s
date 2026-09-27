	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022D20
sub_08022D20: @ 0x08022D20
	push {r4, lr}
	ldr r0, _08022D98 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r1, _08022D9C @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _08022D50
	bl GetConvoyItemCount
	cmp r0, #0
	beq _08022DAC
_08022D50:
	bl sub_08079D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022DAC
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08022DAC
	ldr r0, _08022D98 @ =0x03004690
	ldr r4, [r0]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	subs r1, r0, r2
	cmp r1, #0
	bge _08022D80
	subs r1, r2, r0
_08022D80:
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	subs r0, r4, r2
	cmp r0, #0
	blt _08022DA0
	adds r0, r1, r0
	cmp r0, #1
	beq _08022DA8
	b _08022DAC
	.align 2, 0
_08022D98: .4byte 0x03004690
_08022D9C: .4byte 0x0202BBB8
_08022DA0:
	subs r0, r2, r4
	adds r0, r1, r0
	cmp r0, #1
	bne _08022DAC
_08022DA8:
	movs r0, #1
	b _08022DAE
_08022DAC:
	movs r0, #3
_08022DAE:
	pop {r4}
	pop {r1}
	bx r1
