	.include "macro.inc"

	.syntax unified

	thumb_func_start ShopSt_SetHeadLocBak
ShopSt_SetHeadLocBak: @ 0x080B21A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B21BC @ =0x0203EEA4
	ldr r1, [r7]
	str r1, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B21BC: .4byte 0x0203EEA4
