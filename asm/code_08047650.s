	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047650
sub_08047650: @ 0x08047650
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804766C @ =0x08B9A218
	bl Proc_Find
	cmp r0, #0
	bne _08047664
	adds r0, r4, #0
	bl Proc_Break
_08047664:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804766C: .4byte 0x08B9A218
