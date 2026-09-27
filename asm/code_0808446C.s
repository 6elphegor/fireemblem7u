	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808446C
sub_0808446C: @ 0x0808446C
	push {lr}
	ldr r0, _08084484 @ =0x08CC2A4C
	bl Proc_Find
	cmp r0, #0
	beq _08084488
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084488
	movs r0, #0
	b _0808448A
	.align 2, 0
_08084484: .4byte 0x08CC2A4C
_08084488:
	movs r0, #1
_0808448A:
	pop {r1}
	bx r1
	.align 2, 0
