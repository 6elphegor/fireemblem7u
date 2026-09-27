	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012AA8
sub_08012AA8: @ 0x08012AA8
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08012AC0 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08012AC4
	cmp r0, #3
	beq _08012AD0
	b _08012AD6
	.align 2, 0
_08012AC0: .4byte 0x0202BBF8
_08012AC4:
	ldr r0, _08012ACC @ =0x08CC1B84
	bl sub_0800AF5C
	b _08012AD6
	.align 2, 0
_08012ACC: .4byte 0x08CC1B84
_08012AD0:
	ldr r0, _08012ADC @ =0x08CC1BF0
	bl sub_0800AF5C
_08012AD6:
	pop {r0}
	bx r0
	.align 2, 0
_08012ADC: .4byte 0x08CC1BF0
