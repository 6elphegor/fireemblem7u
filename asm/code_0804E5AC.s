	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E5AC
sub_0804E5AC: @ 0x0804E5AC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_0804E574
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl EkrDragonTmCpyExt
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_0804E6DC
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
