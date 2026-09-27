	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleObstacleStats
ComputeBattleObstacleStats: @ 0x0802A2D8
	push {r4, lr}
	ldr r1, _0802A30C @ =0x0203A3F0
	adds r2, r1, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r0, #0x64
	strh r0, [r2]
	adds r1, #0x6a
	strh r3, [r1]
	ldr r1, _0802A310 @ =0x0203A470
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #0xff
	strh r0, [r2]
	ldrb r0, [r1, #0x13]
	adds r2, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A30C: .4byte 0x0203A3F0
_0802A310: .4byte 0x0203A470
