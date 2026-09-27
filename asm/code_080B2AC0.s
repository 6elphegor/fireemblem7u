	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2AC0
sub_080B2AC0: @ 0x080B2AC0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetMatchupGoldValue
	adds r1, r0, #0
	adds r0, r1, #0
	bl SetTalkNumber
	movs r0, #0x41
	ldr r1, [r7]
	bl sub_080B2DAC
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
