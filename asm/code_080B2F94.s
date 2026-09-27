	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2F94
sub_080B2F94: @ 0x080B2F94
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	bl SetNextGameAction
	ldr r0, [r7]
	bl EventEndBattleMap
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
