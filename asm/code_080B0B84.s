	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0B84
sub_080B0B84: @ 0x080B0B84
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl HasConvoyAccess
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080B0BA2
	movs r0, #0x36
	ldr r1, [r7]
	bl sub_080B034C
	b _080B0BAA
_080B0BA2:
	movs r0, #0x39
	ldr r1, [r7]
	bl sub_080B034C
_080B0BAA:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
