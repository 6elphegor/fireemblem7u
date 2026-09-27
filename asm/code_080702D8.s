	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080702D8
sub_080702D8: @ 0x080702D8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x63
	bgt _080702F0
	b _08070302
_080702F0:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0807489C
_08070302:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
