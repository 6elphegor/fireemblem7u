	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuPostExtraMiscScreen
SaveMenuPostExtraMiscScreen: @ 0x080A4B4C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #4
	beq _080A4B72
	cmp r1, #4
	bgt _080A4B62
	cmp r1, #2
	beq _080A4B72
	b _080A4B78
_080A4B62:
	cmp r1, #8
	beq _080A4B72
	cmp r1, #0x20
	bne _080A4B78
	movs r1, #0xb
	bl Proc_Goto
	b _080A4B78
_080A4B72:
	movs r1, #0xa
	bl Proc_Goto
_080A4B78:
	pop {r0}
	bx r0
