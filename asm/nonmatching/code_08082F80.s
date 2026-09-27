	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082F80
sub_08082F80: @ 0x08082F80
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08082F98
	adds r0, r4, #0
	bl _call_via_r1
_08082F98:
	ldr r0, [r4, #0x2c]
	bl sub_08082E80
	pop {r4}
	pop {r0}
	bx r0
