	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803077C
sub_0803077C: @ 0x0803077C
	push {r4, lr}
	adds r4, r0, #0
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030792
	cmp r4, #0x28
	beq _08030792
	movs r0, #1
	b _08030794
_08030792:
	movs r0, #0
_08030794:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
