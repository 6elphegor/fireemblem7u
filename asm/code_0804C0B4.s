	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrLvlupFan
NewEkrLvlupFan: @ 0x0804C0B4
	push {lr}
	ldr r0, _0804C0CC @ =0x08B9A9E4
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl SetBgmVolume
	pop {r0}
	bx r0
	.align 2, 0
_0804C0CC: .4byte 0x08B9A9E4
