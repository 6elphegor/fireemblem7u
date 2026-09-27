	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FBDC
sub_0804FBDC: @ 0x0804FBDC
	push {lr}
	ldr r1, _0804FBF4 @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _0804FBEE
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_0804FBEE:
	pop {r0}
	bx r0
	.align 2, 0
_0804FBF4: .4byte 0x02017778
