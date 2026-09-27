	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800ADB8
sub_0800ADB8: @ 0x0800ADB8
	push {lr}
	ldr r0, _0800ADC8 @ =0x08B90D88
	ldr r1, _0800ADCC @ =sub_0800ADD0
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_0800ADC8: .4byte 0x08B90D88
_0800ADCC: .4byte sub_0800ADD0
