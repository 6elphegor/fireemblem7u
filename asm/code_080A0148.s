	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsGetTotalWinAmt
PidStatsGetTotalWinAmt: @ 0x080A0148
	push {r4, r5, lr}
	movs r3, #0
	ldr r0, _080A0174 @ =0x0203E7A0
	movs r4, #3
	adds r1, r0, #0
	adds r1, #0xb
	movs r2, #0x45
_080A0156:
	adds r0, r4, #0
	ldrb r5, [r1, #1]
	ands r0, r5
	lsls r0, r0, #8
	ldrb r5, [r1]
	orrs r0, r5
	adds r3, r3, r0
	adds r1, #0x10
	subs r2, #1
	cmp r2, #0
	bge _080A0156
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0174: .4byte 0x0203E7A0
