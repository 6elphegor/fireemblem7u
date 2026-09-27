	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB75C
sub_080AB75C: @ 0x080AB75C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #6
	adds r1, #0x34
	movs r3, #2
	ldrb r2, [r1]
	cmp r2, #0x64
	bne _080AB76E
	movs r3, #4
_080AB76E:
	ldrb r2, [r1]
	adds r1, r3, #0
	bl PutNumber
	ldr r0, _080AB788 @ =0x0201EA90
	adds r1, r4, #0
	adds r1, #8
	bl PutText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB788: .4byte 0x0201EA90
