	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseTorchItem
CanUnitUseTorchItem: @ 0x0802731C
	adds r1, r0, #0
	ldr r0, _08027338 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0802733C
	adds r1, #0x31
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _0802733C
	movs r0, #1
	b _0802733E
	.align 2, 0
_08027338: .4byte 0x0202BBF8
_0802733C:
	movs r0, #0
_0802733E:
	bx lr
