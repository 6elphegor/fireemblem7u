	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021D28
sub_08021D28: @ 0x08021D28
	push {lr}
	ldr r0, _08021D40 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_08021D40: .4byte 0x03004690
