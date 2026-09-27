	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801BC1C
sub_0801BC1C: @ 0x0801BC1C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #1
	bne _0801BC30
	movs r0, #4
	bl WriteSuspendSave
	movs r0, #0x17
	b _0801BC32
_0801BC30:
	movs r0, #8
_0801BC32:
	pop {r1}
	bx r1
	.align 2, 0
