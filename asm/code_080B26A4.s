	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B26A4
sub_080B26A4: @ 0x080B26A4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B26C0 @ =0x08CE73FC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B26C0: .4byte 0x08CE73FC
