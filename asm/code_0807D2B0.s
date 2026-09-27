	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D2B0
sub_0807D2B0: @ 0x0807D2B0
	push {lr}
	ldr r0, _0807D2DC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807D2D8
	ldr r0, _0807D2E0 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	beq _0807D2E4
	cmp r0, #0x3d
	beq _0807D2E4
	bl RandNextB
	movs r1, #0xb
	bl DivRem
	cmp r0, #0
	beq _0807D2E4
_0807D2D8:
	movs r0, #0
	b _0807D2E6
	.align 2, 0
_0807D2DC: .4byte 0x0202BBF8
_0807D2E0: .4byte 0x03004690
_0807D2E4:
	movs r0, #1
_0807D2E6:
	pop {r1}
	bx r1
	.align 2, 0
