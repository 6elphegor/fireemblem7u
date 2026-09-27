	.include "macro.inc"

	.syntax unified

	thumb_func_start PutNumberOrBlank
PutNumberOrBlank: @ 0x080061E4
	push {lr}
	cmp r2, #0
	blt _080061EE
	cmp r2, #0xff
	bne _080061FA
_080061EE:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080061FE
_080061FA:
	bl PutNumber
_080061FE:
	pop {r0}
	bx r0
	.align 2, 0
