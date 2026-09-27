	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BC80
sub_0801BC80: @ 0x0801BC80
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	beq _0801BC8E
	movs r0, #8
	b _0801BCA2
_0801BC8E:
	ldr r0, _0801BCA8 @ =0x08B92AF8
	bl Proc_Find
	cmp r0, #0
	beq _0801BC9C
	bl EndMapMain
_0801BC9C:
	bl sub_08012BD0
	movs r0, #0x17
_0801BCA2:
	pop {r1}
	bx r1
	.align 2, 0
_0801BCA8: .4byte 0x08B92AF8
