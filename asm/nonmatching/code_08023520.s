	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08023520
sub_08023520: @ 0x08023520
	ldr r0, _08023544 @ =0x03004690
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802354C
	ldr r1, _08023548 @ =0x0202BBB8
	adds r1, #0x3d
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0802354C
	movs r0, #1
	b _0802354E
	.align 2, 0
_08023544: .4byte 0x03004690
_08023548: .4byte 0x0202BBB8
_0802354C:
	movs r0, #3
_0802354E:
	bx lr
