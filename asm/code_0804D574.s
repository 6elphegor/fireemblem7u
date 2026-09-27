	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEkrHitDone
CheckEkrHitDone: @ 0x0804D574
	ldr r0, _0804D588 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D590
	ldr r0, _0804D58C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804D590
	movs r0, #1
	b _0804D592
	.align 2, 0
_0804D588: .4byte 0x02017728
_0804D58C: .4byte 0x0201772C
_0804D590:
	movs r0, #0
_0804D592:
	bx lr
