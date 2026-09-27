	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsGetTotalLevel
PidStatsGetTotalLevel: @ 0x080A0190
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A01B8 @ =0x0203E7A0
	movs r4, #0x45
_080A0198:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A0198
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A01B8: .4byte 0x0203E7A0
