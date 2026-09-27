	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801109C
sub_0801109C: @ 0x0801109C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080110B4 @ =0x08B91FDC
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	movs r1, #0xff
	ands r1, r4
	str r1, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080110B4: .4byte 0x08B91FDC
