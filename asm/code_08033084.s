	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033084
sub_08033084: @ 0x08033084
	push {r4, lr}
	adds r4, r0, #0
	bl CountTargets
	cmp r0, #0
	bne _08033098
	adds r0, r4, #0
	bl Proc_End
	b _080330A0
_08033098:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080330A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
