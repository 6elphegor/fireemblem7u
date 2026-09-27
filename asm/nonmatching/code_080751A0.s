	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080751A0
sub_080751A0: @ 0x080751A0
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_080751AC:
	ldr r0, [r7, #4]
	cmp r0, #9
	ble _080751B4
	b _080751D8
_080751B4:
	ldr r0, [r7, #4]
	adds r1, r0, #0
	lsls r0, r1, #5
	ldr r1, _080751D4 @ =0x03004990
	adds r0, r0, r1
	ldr r2, [r7, #4]
	adds r1, r2, #6
	movs r2, #0xf
	ldr r3, [r7]
	bl StartPalFade
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _080751AC
	.align 2, 0
_080751D4: .4byte 0x03004990
_080751D8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
