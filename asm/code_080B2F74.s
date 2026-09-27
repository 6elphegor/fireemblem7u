	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2F74
sub_080B2F74: @ 0x080B2F74
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B2F90 @ =0x0203A85C
	ldrb r1, [r0, #0x16]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2F90: .4byte 0x0203A85C
