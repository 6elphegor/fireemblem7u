	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047630
sub_08047630: @ 0x08047630
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804764C @ =0x08B9A1E0
	bl Proc_Find
	cmp r0, #0
	bne _08047644
	adds r0, r4, #0
	bl Proc_Break
_08047644:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804764C: .4byte 0x08B9A1E0
