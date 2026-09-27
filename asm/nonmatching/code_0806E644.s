	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E644
sub_0806E644: @ 0x0806E644
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E66C @ =0x0203E0FC
	ldr r2, [r0]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, _0806E66C @ =0x0203E0FC
	ldr r3, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldr r0, [r7]
	bl EnsureCameraOntoPosition
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E66C: .4byte 0x0203E0FC
