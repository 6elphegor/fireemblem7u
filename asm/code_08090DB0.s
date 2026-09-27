	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090DB0
sub_08090DB0: @ 0x08090DB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08090DE2
	adds r0, r4, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090DE2
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #0
	beq _08090DE2
	movs r0, #1
	b _08090DE4
_08090DE2:
	movs r0, #0
_08090DE4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
