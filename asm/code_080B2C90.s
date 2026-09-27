	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2C90
sub_080B2C90: @ 0x080B2C90
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	bl GetGold
	str r0, [r7, #4]
	bl ArenaGetResult
	cmp r0, #2
	beq _080B2CE8
	cmp r0, #2
	bgt _080B2CB0
	cmp r0, #1
	beq _080B2CBA
	b _080B2D18
_080B2CB0:
	cmp r0, #3
	beq _080B2CF2
	cmp r0, #4
	beq _080B2D0E
	b _080B2D18
_080B2CBA:
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r2, r1, #1
	adds r0, r2, #0
	bl SetTalkNumber
	movs r0, #0x45
	ldr r1, [r7]
	bl sub_080B2DAC
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B2D18
_080B2CE8:
	movs r0, #0x46
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2D18
_080B2CF2:
	movs r0, #0x48
	ldr r1, [r7]
	bl sub_080B2DAC
	bl ArenaGetMatchupGoldValue
	ldr r1, [r7, #4]
	adds r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl SetGold
	b _080B2D18
_080B2D0E:
	movs r0, #0x47
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2D18
_080B2D18:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
