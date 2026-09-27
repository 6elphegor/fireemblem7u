	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088938
sub_08088938: @ 0x08088938
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge _08088994
_0808894E:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov sb, r0
	cmp r2, r8
	bge _08088988
	mov r7, ip
	subs r7, #1
	mov sl, r2
_08088960:
	adds r5, r2, #1
	movs r3, #6
_08088964:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08088964
	cmp r6, r7
	bne _08088976
	mov r0, sl
	b _08088980
_08088976:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
_08088980:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt _08088960
_08088988:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, sb
	cmp r6, ip
	blt _0808894E
_08088994:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
