	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDeadEvent
NewEfxDeadEvent: @ 0x0804E018
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E038 @ =0x08B9ACE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _0804E03C @ =0x02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E038: .4byte 0x08B9ACE4
_0804E03C: .4byte 0x02017738
