	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08077910
sub_08077910: @ 0x08077910
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0807791E:
	ldr r0, [r7, #8]
	cmp r0, #0x9f
	ble _08077926
	b _08077954
_08077926:
	ldr r0, [r7, #8]
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _08077950 @ =0x0203E668
	ldr r1, [r2]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	ldr r3, [r7, #8]
	asrs r2, r3, #1
	adds r1, r1, r2
	adds r2, r1, #0
	rsbs r1, r2, #0
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0807791E
	.align 2, 0
_08077950: .4byte 0x0203E668
_08077954:
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
