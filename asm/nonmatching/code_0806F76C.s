	.include "macro.inc"

	.syntax unified

	thumb_func_start EndManimInfoWindow
EndManimInfoWindow: @ 0x0806F76C
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806F780 @ =0x08C9D7B0
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F780: .4byte 0x08C9D7B0
