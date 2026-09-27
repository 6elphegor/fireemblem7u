	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2A88
sub_080B2A88: @ 0x080B2A88
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B2AAC @ =0x0203A7F4
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	lsrs r0, r2, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080B2AB0
	movs r0, #0x3f
	ldr r1, [r7]
	bl sub_080B2DAC
	b _080B2AB8
	.align 2, 0
_080B2AAC: .4byte 0x0203A7F4
_080B2AB0:
	movs r0, #0x40
	ldr r1, [r7]
	bl sub_080B2DAC
_080B2AB8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
