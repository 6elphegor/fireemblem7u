	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080750DC
sub_080750DC: @ 0x080750DC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _080750FC
	ldr r1, _080750F8 @ =0x08C9DF14
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _08075106
	.align 2, 0
_080750F8: .4byte 0x08C9DF14
_080750FC:
	ldr r1, _08075110 @ =0x08C9DF14
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_08075106:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075110: .4byte 0x08C9DF14
