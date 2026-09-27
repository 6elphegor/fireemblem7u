	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010DF8
sub_08010DF8: @ 0x08010DF8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r6, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08010E14
	movs r0, #0
	b _08010E42
_08010E14:
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #1
	rsbs r1, r1, #0
	adds r5, r0, #0
	cmp r2, r1
	bne _08010E32
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08010D98
	b _08010E3C
_08010E32:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08010AF8
_08010E3C:
	movs r0, #0x61
	strb r0, [r5]
	movs r0, #2
_08010E42:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
