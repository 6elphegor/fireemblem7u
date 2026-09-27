	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801CF98
sub_0801CF98: @ 0x0801CF98
	push {r4, lr}
	adds r4, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CFAC
	adds r0, r4, #0
	bl Proc_Break
_0801CFAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
