	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046A54
sub_08046A54: @ 0x08046A54
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl sub_08046674
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08046A76
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08046A76
	adds r0, r4, #0
	bl Proc_Break
_08046A76:
	pop {r4}
	pop {r0}
	bx r0
