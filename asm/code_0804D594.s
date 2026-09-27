	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrEfxIsUnitHittedNow
EkrEfxIsUnitHittedNow: @ 0x0804D594
	ldr r1, _0804D5A0 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804D5A0: .4byte 0x02017780
