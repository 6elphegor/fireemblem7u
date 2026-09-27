	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E1CC
sub_0804E1CC: @ 0x0804E1CC
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804E1E8
	ldr r1, _0804E1F0 @ =0x02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E1E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1F0: .4byte 0x02017738
