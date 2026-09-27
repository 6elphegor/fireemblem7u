	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080552DC
sub_080552DC: @ 0x080552DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08055300
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080552F6
	bl Proc_End
_080552F6:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _08055300
	bl Proc_End
_08055300:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
