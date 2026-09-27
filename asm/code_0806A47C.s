	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A47C
sub_0806A47C: @ 0x0806A47C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806A4A0 @ =0x02020130
	ldr r0, [r0]
	cmp r0, #1
	bne _0806A49A
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806A49A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4A0: .4byte 0x02020130
