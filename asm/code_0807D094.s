	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D094
sub_0807D094: @ 0x0807D094
	ldr r0, _0807D0B0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, #0x2f
	beq _0807D0B4
	cmp r0, #0x30
	beq _0807D0B4
	cmp r0, #0x31
	beq _0807D0B4
	cmp r0, #0x2e
	beq _0807D0B4
	movs r0, #0
	b _0807D0B6
	.align 2, 0
_0807D0B0: .4byte 0x03004690
_0807D0B4:
	movs r0, #1
_0807D0B6:
	bx lr
