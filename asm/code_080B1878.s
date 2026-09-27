	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1878
sub_080B1878: @ 0x080B1878
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
_080B1882:
	ldr r0, [r7, #4]
	cmp r0, #0
	bgt _080B188A
	b _080B18A8
_080B188A:
	ldr r0, [r7]
	movs r1, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r7]
	subs r1, r0, #2
	str r1, [r7]
	ldr r0, [r7, #4]
	subs r1, r0, #1
	str r1, [r7, #4]
	b _080B1882
_080B18A8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
