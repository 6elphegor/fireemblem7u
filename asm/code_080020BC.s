	.include "macro.inc"

	.syntax unified

	thumb_func_start ColorFadeInit
ColorFadeInit: @ 0x080020BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0x1f
	str r0, [r7]
_080020C6:
	ldr r0, [r7]
	cmp r0, #0
	bge _080020CE
	b _080020EC
_080020CE:
	ldr r0, _080020E8 @ =0x02022240
	ldr r1, [r7]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	subs r1, r0, #1
	str r1, [r7]
	b _080020C6
	.align 2, 0
_080020E8: .4byte 0x02022240
_080020EC:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
