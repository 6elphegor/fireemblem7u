	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_808F3D8
sub_808F3D8: @ 0x08087EAC
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08087EF4
	bl GetCgTextFlags
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08087EDA
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r2, [r1]
	ldrb r0, [r0]
	subs r0, r2, r0
	subs r0, #1
	b _08087EE2
_08087EDA:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
_08087EE2:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r0]
	ldrb r1, [r1]
	subs r1, r2, r1
	strb r1, [r0]
_08087EF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
