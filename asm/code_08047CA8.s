	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047CA8
sub_08047CA8: @ 0x08047CA8
	push {lr}
	ldr r0, _08047CB4 @ =0x08CC1C5C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047CB4: .4byte 0x08CC1C5C
