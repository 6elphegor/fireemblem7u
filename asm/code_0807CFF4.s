	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CFF4
sub_0807CFF4: @ 0x0807CFF4
	push {lr}
	movs r0, #8
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D006
	movs r0, #0
	b _0807D018
_0807D006:
	ldr r0, _0807D01C @ =0x0202E3E0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	movs r1, #0x25
	ldrb r0, [r0, #6]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
_0807D018:
	pop {r1}
	bx r1
	.align 2, 0
_0807D01C: .4byte 0x0202E3E0
