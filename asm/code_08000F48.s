	.include "macro.inc"

	.syntax unified

	thumb_func_start IncGameTime
IncGameTime: @ 0x08000F48
	push {r7, lr}
	mov r7, sp
	ldr r1, _08000F6C @ =0x03000010
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, _08000F6C @ =0x03000010
	ldr r2, [r1]
	adds r1, r2, #1
	str r1, [r0]
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, [r0]
	ldr r0, _08000F70 @ =0x0CDFE5FF
	cmp r1, r0
	bls _08000F78
	ldr r0, _08000F6C @ =0x03000010
	ldr r1, _08000F74 @ =0x0CBEF080
	str r1, [r0]
	b _08000F78
	.align 2, 0
_08000F6C: .4byte 0x03000010
_08000F70: .4byte 0x0CDFE5FF
_08000F74: .4byte 0x0CBEF080
_08000F78:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
