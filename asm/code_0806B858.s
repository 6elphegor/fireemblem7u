	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B858
sub_0806B858: @ 0x0806B858
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_0804CC48
	bl EkrDispUP_0804D5A4
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
