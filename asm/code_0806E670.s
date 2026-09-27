	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E670
sub_0806E670: @ 0x0806E670
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E688 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E68C
	b _0806E6A2
	.align 2, 0
_0806E688: .4byte 0x0203E0FC
_0806E68C:
	ldr r0, _0806E6AC @ =0x0203E0FC
	ldr r2, [r0, #0x14]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806E6AC @ =0x0203E0FC
	ldr r3, [r0, #0x14]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl EnsureCameraOntoPosition
_0806E6A2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E6AC: .4byte 0x0203E0FC
