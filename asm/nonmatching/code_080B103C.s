	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B103C
sub_080B103C: @ 0x080B103C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B1056
	movs r0, #7
	ldr r1, [r7]
	bl sub_080B034C
	b _080B105E
_080B1056:
	movs r0, #0x27
	ldr r1, [r7]
	bl sub_080B034C
_080B105E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
