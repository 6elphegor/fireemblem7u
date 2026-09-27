	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B224C
sub_080B224C: @ 0x080B224C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	cmp r0, #0
	blt _080B2270
	ldr r0, [r7]
	ldr r1, [r7, #4]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B227E
	b _080B2284
_080B2270:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	ldr r1, [r7, #8]
	cmp r0, r1
	blt _080B227E
	b _080B2284
_080B227E:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _080B22B2
_080B2284:
	ldr r0, [r7, #4]
	ldr r1, [r7]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B22A4
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	subs r1, r1, r2
	cmp r1, #0
	bge _080B22A2
	ldr r1, [r7, #8]
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r0, r0, r1
_080B22A2:
	b _080B22AA
_080B22A4:
	ldr r1, [r7]
	ldr r2, [r7, #8]
	adds r0, r1, r2
_080B22AA:
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	b _080B22B2
_080B22B2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
